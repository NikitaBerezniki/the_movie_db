import 'package:flutter/material.dart';
import 'package:the_movie_db/models/auth_model.dart';
import 'package:the_movie_db/service/my_notifier_provider.dart';
import '../pages/auth/auth_screen.dart';
import '../pages/main/main_screen.dart';
import '../models/main_screen_model.dart';
import '../pages/movie_details/movie_details_screen.dart';

abstract class MainNavigationOfRoutes {
  static const String homePage = '/movies_list';
  static const String authPage = '/authorization';
  static const String movieDetailsPage = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationOfRoutes.homePage
      : MainNavigationOfRoutes.authPage;

  final routes = <String, Widget Function(BuildContext context)>{
    MainNavigationOfRoutes.authPage: (context) => const AuthScreen(),
    // NotifierProvider(model: AuthModel(), child: const AuthScreen()),
    MainNavigationOfRoutes.homePage: (context) => const MainScreen(),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    // final configuration = settings.arguments;
    // switch (settings.name) {
    //   case MainNavigationOfRoutes.movieDetailsPage:
    //     final arguments = settings.arguments;
    //     final movieId = arguments is int ? arguments : 0;
    //     return MaterialPageRoute(
    //         builder: ((context) => MovieDetailsScreen(movieId: movieId)));
    //   default:
    //     onUnknownRoute;
    // }
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
