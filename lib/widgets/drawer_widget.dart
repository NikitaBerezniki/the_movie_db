import 'package:flutter/material.dart';

import '../main.dart';

class CategoriesDrawerWidget extends StatelessWidget {
  const CategoriesDrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: AppStyleClass.backgroundColor,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          children: const [
            Text('Фильмы', style: AppStyleClass.textStyleDrawer),
            Text('Сериалы', style: AppStyleClass.textStyleDrawer)
          ],
        ));
  }
}
