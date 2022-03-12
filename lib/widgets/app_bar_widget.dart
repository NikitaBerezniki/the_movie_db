import 'package:flutter/material.dart';
import '../main.dart';

AppBar simpleAppBar() {
  return AppBar(
    backgroundColor: AppStyleClass.backgroundColor,
    title: IconButton(
        icon: Image.asset('images/logo.png'),
        iconSize: 50,
        splashRadius: 0.1,
        onPressed: () {}),
    centerTitle: true,
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
      IconButton(onPressed: () {}, icon: const Icon(Icons.search))
    ],
  );
}
