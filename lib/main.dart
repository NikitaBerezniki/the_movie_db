import 'package:flutter/material.dart';
import 'package:the_movie_db/movie_details/movie_details_listview_widget.dart';

import 'auth/authorization_page.dart';
import 'main_page.dart';


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
          '/': (context) => MainPage(),
          // '/': (context) => MovieDetailsWidgetEducation(movieId: 1),
          // '/': (context) => const MovieDetailsPage(movieId: 1),
          '/movie_details_page': (context) {
            final id = ModalRoute.of(context)?.settings.arguments;
            if (id is int) {
              return MovieDetailsWidgetEducation(movieId: id);
            } else {
              return MovieDetailsWidgetEducation(movieId: 0);
            }
          },
          '/authorization': (context) => AuthorizationPage(),
        });
  }
}
