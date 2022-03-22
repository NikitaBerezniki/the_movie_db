import 'package:flutter/material.dart';

abstract class AppColorStyle {
  static const Color blueBackgroundColor = Color.fromRGBO(3, 47, 127, 1);
  static const Color whiteColor = Colors.white;
  static const Color blueAccentColor = Colors.blueAccent;
  static const Color brownBackgroundColor = Color.fromARGB(255, 26, 17, 14);
  static const Color darkbrownBackgroundColor = Color.fromARGB(255, 17, 11, 9);
}

abstract class AppTextStyle {
  static const TextStyle textStyleDrawer =
      TextStyle(fontSize: 24, color: Colors.white);
  static const TextStyle textWhite16 =
      TextStyle(fontSize: 16, color: Colors.white);
  static const TextStyle textBlack22 =
      TextStyle(fontSize: 22, color: Colors.black);
}


abstract class AppTextFieldStyle{
  static const inputDecorationTextField = InputDecoration(
    border: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.blue, style: BorderStyle.solid),
        borderRadius: BorderRadius.all(Radius.elliptical(5, 10))),
    labelText: 'Введите число');
}