import 'package:flutter/material.dart';
import '../resources/styles.dart';

class CategoriesDrawerWidget extends StatelessWidget {
  const CategoriesDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppColorStyle.blueBackgroundColor,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: const [
            Text('Фильмы', style: AppTextStyle.textStyle24White),
            Text('Сериалы', style: AppTextStyle.textStyle24White)
          ],
        ));
  }
}
