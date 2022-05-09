import 'package:flutter/cupertino.dart';
import 'package:the_movie_db/domain/api_client/api_client.dart';
import 'package:the_movie_db/service/main_navigation.dart';
import 'package:the_movie_db/domain/data_provider/session_data_provider.dart';

class AuthScreenModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

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
    } on AssertionError {
      _errorMessage =
          'Ошибка в получении валидных данных с сервера: ${_apiClient.errorMessage ?? 'неопознанная ошибка'}';
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.Network:
          _errorMessage =
              'Неполадки с сетью: ${_apiClient.errorMessage ?? 'неопознанная ошибка'}';
          break;
        case ApiClientExceptionType.Auth:
          _errorMessage =
              'Ошибка авторизации: ${_apiClient.errorMessage ?? 'неопознанная ошибка'}';
          break;
        case ApiClientExceptionType.Other:
          _errorMessage = _apiClient.errorMessage;
          break;
      }
    }
    print("sessionId: $sessionId. errorMessage: $_errorMessage");
    if (sessionId == null || _errorMessage != null) {
      _isAuthProgress = false;
      notifyListeners();
      return;
    }

    _isAuthProgress = false;
    // if (_errorMessage != null || sessionId.isEmpty) notifyListeners();
    _sessionDataProvider.setSessionId(sessionId);
    Navigator.of(context).pushReplacementNamed(MainNavigationOfRoutes.homePage);
  }

  Future<void> recoveryPassword(BuildContext context) async {}

  void onSwitchPasswordDisplay() {
    isPasswordDisplay = !isPasswordDisplay;
    notifyListeners();
  }
}

// class AuthProvider extends InheritedNotifier<AuthModel> {
//   final AuthModel model;

//   const AuthProvider({Key? key, required Widget child, required this.model})
//       : super(key: key, notifier: model, child: child);

//   static AuthProvider? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthProvider>();
//   }
// }
