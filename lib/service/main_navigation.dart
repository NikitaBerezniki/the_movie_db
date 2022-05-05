import 'package:flutter/material.dart';
import 'package:the_movie_db/movie_details/movie_details_page.dart';
import 'package:the_movie_db/pages/home_page.dart';

import '../pages/authorization_page.dart';

abstract class MainNavigationOfRoutes {
  static const String homePage = '/';
  static const String authPage = '/authorization';
  static const String movieDetails = '/movie_details_page';
}

class MainNavigation {
  final initialRoute = MainNavigationOfRoutes.authPage;

  final routes = <String, Widget Function(BuildContext context)>{
    MainNavigationOfRoutes.authPage: (context) => AuthorizationPage(),
    MainNavigationOfRoutes.homePage: (context) => HomePage(),
  };

  
  Route<Object>? onGenerateRoute(RouteSettings settings) {
    // final configuration = settings.arguments;
    switch (settings.name) {
      case MainNavigationOfRoutes.movieDetails:
        return MaterialPageRoute(
            builder: ((context) =>
                MovieDetailsPage(movieId: settings.arguments as int)));
      default:
        onUnknownRoute;
    }
    return null;
  }

  MaterialPageRoute<void> onUnknownRoute(RouteSettings settings) =>
      MaterialPageRoute<void>(
          settings: settings,
          builder: (BuildContext context) => Scaffold(
                  body: Center(
                      child: Column(
                children: [
                  Text('Page not found \n'),
                  SizedBox(height: 16),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(MainNavigationOfRoutes.homePage);
                      },
                      child: Text('return for home page'))
                ],
              ))));

}
