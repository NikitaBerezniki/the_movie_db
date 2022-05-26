import 'package:the_movie_db/service/session_id_provider.dart';

class AppModel {
  final _sessionDataProvider = SessionIdProvider();
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    print('sessionId: $sessionId');
    _isAuth = sessionId != null;
  }
}
