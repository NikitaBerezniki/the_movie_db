import 'package:flutter/material.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';
import 'package:the_movie_db/service/main_navigation.dart';
import 'package:the_movie_db/service/session_id_provider.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionIdProvider();

  bool isPasswordDisplay = true;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;
  bool get canStartAuth => !_isAuthProgress;

  TextEditingController usernameController =
      TextEditingController(text: "Niki_berz");
  TextEditingController passwordController =
      TextEditingController(text: "Solo1994");

  Future<void> auth(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;
    if (username.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните имя пользователя или пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(username: username, password: password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          _errorMessage =
              'Неполадки с сетью: ${_apiClient.errorMessage ?? 'неопознанная ошибка'}';
          break;
        case ApiClientExceptionType.auth:
          _errorMessage =
              'Ошибка авторизации: ${_apiClient.errorMessage ?? 'неопознанная ошибка'}';
          break;
        case ApiClientExceptionType.other:
          _errorMessage = _apiClient.errorMessage;
          break;
      }
    }
    if (sessionId == null || _errorMessage != null) {
      _isAuthProgress = false;
      notifyListeners();
      return;
    }

    _isAuthProgress = false;
    _sessionDataProvider.setSessionId(sessionId);
    Navigator.of(context).pushReplacementNamed(MainNavigationOfRoutes.homePage);
  }

  Future<void> recoveryPassword(BuildContext context) async {}

  void onSwitchPasswordDisplay() {
    isPasswordDisplay = !isPasswordDisplay;
    notifyListeners();
  }
}
