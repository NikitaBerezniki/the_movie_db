import 'package:flutter/material.dart';
import 'calculator_model.dart';

class CalculatorProvider extends InheritedNotifier<CalculatorModel> {
  final CalculatorModel model;
  CalculatorProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static CalculatorModel? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CalculatorProvider>()
        ?.model;
  }
}

//
//
//
//

class ChangeNotifierProvider<T extends ChangeNotifier>
    extends InheritedNotifier {
  final T model;
  ChangeNotifierProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static T? of<T>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ChangeNotifierProvider>();
    if (provider != null) {
      return provider.model as T;
    } else {
      return null;
    }
    // return context
    //     .dependOnInheritedWidgetOfExactType<ChangeNotifierProvider>()
    //     ?.model as T;
  }
}


/*
class CalculatorProvider extends InheritedWidget {
  final CalculatorModel model;
  CalculatorProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(key: key, child: child);

  static CalculatorProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CalculatorProvider>();
  }

  @override
  bool updateShouldNotify(CalculatorProvider oldWidget) {
    return model != oldWidget.model;
  }
}
*/