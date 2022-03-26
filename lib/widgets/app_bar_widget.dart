import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/images.dart';
import '../resources/styles.dart';

AppBar simpleAppBar() {
  return AppBar(
    backgroundColor: AppColorStyle.blueBackgroundColor,
    title: IconButton(
        icon: Image.asset(AppImages.logo),
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
