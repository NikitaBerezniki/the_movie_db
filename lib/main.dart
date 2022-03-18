import 'package:flutter/material.dart';
import 'package:the_movie_db/movie_details/movie_details_listview.dart';

import 'auth/authorization_page.dart';
import 'example/my_builder.dart';
import 'example/my_keys.dart';

void main(List<String> args) {
  return runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => MyBuilder(),

          // '/': (context) => MainPage(),
          '/movie_details_page': (context) {
            final id = ModalRoute.of(context)?.settings.arguments;
            if (id is int) {
              return MovieDetailsListViewWdiget(movieId: id);
            } else {
              return MovieDetailsListViewWdiget(movieId: 1);
            }
          },
          '/authorization': (context) => AuthorizationPage(),
        });
  }
}
