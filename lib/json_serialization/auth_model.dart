import 'package:flutter/material.dart';
import 'json_serialization.dart';
import 'dart:math';

 String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

class AuthModel extends ChangeNotifier {
  String? username;
  String? email;
  String? secretCode;

  void logIn() {
    
    secretCode = getRandomString(20);
    notifyListeners();
  }

  void register() {}
}
