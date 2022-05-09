import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/images.dart';
import 'package:the_movie_db/service/main_navigation.dart';
import 'package:the_movie_db/domain/data_provider/session_data_provider.dart';
import '../resources/styles.dart';

AppBar simpleAppBar() {

  Future<void> exitOfSession(context)async{
await SessionDataProvider().setSessionId(null);
                Navigator.of(context).pushReplacementNamed(
                    MainNavigationOfRoutes.authPage);
  }

  return AppBar(
    backgroundColor: AppColorStyle.blueBackgroundColor,
    title: IconButton(
        icon: Image.asset(AppImages.logo),
        iconSize: 50,
        splashRadius: 0.1,
        onPressed: () {}),
    centerTitle: true,
    actions: [
      Builder(
        builder: (context) {
          return IconButton(
              onPressed: ()=>exitOfSession(context),
              icon: const Icon(Icons.person));
        }
      ),
      IconButton(onPressed: () {}, icon: const Icon(Icons.search))
    ],
  );
}
