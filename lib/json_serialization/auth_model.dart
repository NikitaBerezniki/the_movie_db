import 'package:flutter/material.dart';
import 'json_serialization.dart';
import 'dart:math';

class AuthModel extends ChangeNotifier {
  String? username;
  String? password;
  String? secretCode;

  static String getRandomString(int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  void logIn() {
    secretCode = getRandomString(20);
    notifyListeners();
  }

  void register() {}
}
