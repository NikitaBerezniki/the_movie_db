import 'dart:convert';
import 'dart:io';

import 'package:the_movie_db/domain/entities/popular_movie_response.dart';

/*
Возможные проблемы работы с REST API: 
1) нет сети
2) нет ответа, таймаут соединения

3) сервер не доступен
4) сервер не может обработать запрашиваемый запрос
5) сервер ответил не то что мы ожидали

6) сервер ответил ожидаемой ошибкой
*/

enum ApiClientExceptionType { network, auth, other }

class ApiClientException implements Exception {
  final ApiClientExceptionType type;

  ApiClientException(this.type);
}

class ApiClient {
  final _client = HttpClient();
  static const _host = 'https://api.themoviedb.org/3';
  static const _imageUrl = 'https://image.tmdb.org/t/p/w500';
  static const _apiKey = '06737821f808b0fd5fa5ed1471aab8ed';
  static const _language = 'ru-RU';
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<PopularMovieResponse> fetchPopularMovie(
      int page, String locale) async {
    final url = _makeUri('/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
    });
    final jsonMap = await _getMethod(url);
    // final jsonMap = response as Map<String, dynamic>;
    return PopularMovieResponse.fromJson(jsonMap);
  }

  Uri _makeUri(String path, [Map<String, dynamic>? parameters]) {
    final uri = Uri.parse('$_host$path');
    if (parameters != null) {
      return uri.replace(queryParameters: parameters);
    } else {
      return uri;
    }
  }

  static String? makeUrlForImage(String? path) {
    if (path == null) return null;
    return Uri.parse('$_imageUrl$path').toString();
  }

  Future<Map<String, dynamic>> _getMethod(Uri url) async {
    try {
      final request = await _client.getUrl(url);
      final response = await request.close();
      final json = _getDataOfResponse(response);
      return json;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<Map<String, dynamic>> _postMethod(
      Uri url, Map<String, dynamic> parameters) async {
    try {
      final request = await _client.postUrl(url);
      request.headers.contentType = ContentType.json; //аналогично строкой ниже
      // request.headers.add('Content-type', 'application/json; charset=UTF-8');
      request.write(jsonEncode(parameters));
      final response = await request.close();
      final json = _getDataOfResponse(response);
      return json;
    } on SocketException {
      throw ApiClientException(ApiClientExceptionType.network);
    } on ApiClientException {
      rethrow;
    } on AssertionError catch (e) {
      _errorMessage = e.message.toString();
      rethrow;
    } catch (e) {
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<Map<String, dynamic>> _getDataOfResponse(
      HttpClientResponse response) async {
    final json = await _responseToJson(response);
    if (response.statusCode == 200) {
      _errorMessage = null;
      return json;
    } else if (response.statusCode == 401) {
      final statusCode = json['status_code'];
      final code = statusCode is int ? statusCode : 0;
      if (code == 7) {
        _errorMessage = 'Указан неверный API key.';
        throw ApiClientException(ApiClientExceptionType.other);
      } else if (code == 30) {
        _errorMessage =
            'Неправильный имя пользователя/пароль. Пожалуйста, повторите попытку.';
        throw ApiClientException(ApiClientExceptionType.auth);
      } else if (code == 33) {
        _errorMessage = 'Указан неверный request токен.';
        throw ApiClientException(ApiClientExceptionType.other);
      } else {
        _errorMessage = json['status_message'];
        throw ApiClientException(ApiClientExceptionType.auth);
      }
    } else if (response.statusCode == 404) {
      _errorMessage = 'Запрошенный вами ресурс не удалось найти.';
      throw ApiClientException(ApiClientExceptionType.other);
    } else {
      _errorMessage = "Статус запроса: ${response.statusCode.toString()}";
      throw ApiClientException(ApiClientExceptionType.other);
    }
  }

  Future<Map<String, dynamic>> _responseToJson(
      HttpClientResponse response) async {
    return response
        .transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then((value) => jsonDecode(value) as Map<String, dynamic>);
  }

  Future<String> auth(
      {required String username, required String password}) async {
    _errorMessage = null;
    final token = await _makeToken();
    final validToken = await _validateUser(
        username: username, password: password, requestToken: token);
    final sessionId = _makeSession(requestToken: validToken);

    return sessionId;
  }

  Future<String> _makeToken() async {
    final url = _makeUri('/authentication/token/new', {'api_key': _apiKey});
    final json = await _getMethod(url);
    return json['request_token'];
  }

  Future<String> _validateUser(
      {required String username,
      required String password,
      required String requestToken}) async {
    final url = _makeUri(
        '/authentication/token/validate_with_login', {'api_key': _apiKey});
    final parameters = <String, dynamic>{
      'username': username,
      'password': password,
      'request_token': requestToken
    };

    final json = await _postMethod(url, parameters);
    return json['request_token'] as String;
  }

  Future<String> _makeSession({required String requestToken}) async {
    final url = _makeUri('/authentication/session/new', {'api_key': _apiKey});
    final parameters = <String, dynamic>{'request_token': requestToken};
    final json = await _postMethod(url, parameters);
    return json['session_id'] as String;
  }
}

// extension HttpClientResponseJsonDecode on HttpClientResponse {
//   Future<dynamic> jsonDecode() {
//     return transform(utf8.decoder)
//         .toList()
//         .then((value) => value.join())
//         .then<dynamic>((value) => json.decode(value));
//   }

// }
