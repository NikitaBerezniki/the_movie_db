import 'package:flutter/material.dart';
import 'package:the_movie_db/movie_details/movie_details_listview.dart';

import 'Calculator/calculator_widget.dart';
import 'auth/authorization_page.dart';
// import 'json_serialization/auth_mockup.dart';
import 'domain/http_mockup.dart';
import 'json_serialization/auth_mockup.dart';
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
          '/':(context)=> HttpMockup(),
          // '/': (context) => AuthWidget(),
          // '/': (context) => SimpleCalculatorWidget(),
          // '/': (context) => MyBuilder(),

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
