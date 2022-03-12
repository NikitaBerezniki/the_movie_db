import 'package:flutter/material.dart';
import 'package:the_movie_database/movie_details_page.dart';
import 'package:the_movie_database/widgets/progress_bar_widget.dart';

import 'authorization_page.dart';
import 'main_page.dart';
import 'movie_list_page.dart';

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
          // '/': (context) => const MainPage(),
          '/': (context) => const MovieDetailsPage(movieId: 1),

          '/movie_details_page': (context) {
            final id = ModalRoute.of(context)?.settings.arguments;
            if (id is int) {
              return MovieDetailsPage(movieId: id);
            } else {
              return MovieDetailsPage(movieId: 0);
            }
          },
          '/progress_bar': (context) => RadialProgressBar(),
          '/authorization': (context) => AuthorizationPage(),
        });
  }
}

abstract class AppStyleClass {
  static const Color backgroundColor = Color.fromRGBO(3, 47, 127, 1);
  static const Color whiteColor = Colors.white;
  static const Color blueAccentColor = Colors.blueAccent;

  static const TextStyle textStyleDrawer =
      TextStyle(fontSize: 24, color: Colors.white);
}
