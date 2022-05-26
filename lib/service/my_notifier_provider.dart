import 'package:flutter/material.dart';

class MyNotifierProvider<Model extends ChangeNotifier>
    extends InheritedNotifier {
  final Model model;

  const MyNotifierProvider(
      {Key? key, required Widget child, required this.model})
      : super(key: key, notifier: model, child: child);

  static Model? of<Model extends ChangeNotifier>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyNotifierProvider<Model>>()
        ?.model;
  }

  static Model? read<Model extends ChangeNotifier>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MyNotifierProvider<Model>>()
        ?.widget;
    return widget is MyNotifierProvider<Model> ? widget.model : null;
  }
}

class MyProvider<Model> extends InheritedWidget {
  final Model model;
  const MyProvider({Key? key, required Widget child, required this.model})
      : super(key: key, child: child);

  static Model? of<Model>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyProvider<Model>>()
        ?.model;
  }

  static Model? read<Model>(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<MyProvider<Model>>()
        ?.widget;
    return widget is MyProvider<Model> ? widget.model : null;
  }

  @override
  bool updateShouldNotify(MyProvider oldWidget) {
    return model != oldWidget.model;
  }
}
