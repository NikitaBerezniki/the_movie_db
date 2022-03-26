import 'package:flutter/material.dart';

import 'auth_model.dart';

class AuthProvider extends InheritedNotifier {
  final AuthModel model;

  AuthProvider({Key? key, required this.model, required Widget child})
      : super(
          key: key,
          notifier: model,
          child: child,
        );

  static AuthModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AuthProvider>()
        ?.model;
  }
}
