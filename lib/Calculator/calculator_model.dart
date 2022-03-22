import 'package:flutter/material.dart';

class CalculatorModel extends ChangeNotifier {
  int? _a;
  int? _b;
  int? result;

  set firstNumber(String value) => _a = int.tryParse(value);
  set secondNumber(String value) => _b = int.tryParse(value);

  void sum() {
    int? result;
    if (_a != null || _b != null) {
      result = (_a ?? 0) * (_b ?? 0);
    } else {
      result = null;
    }
    if (this.result != result) {
      // Обновляем модель только при изменении результирующего значения
      this.result = result;
      notifyListeners();
    }
  }
}