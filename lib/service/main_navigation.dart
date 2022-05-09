import 'package:flutter/material.dart';
import 'package:the_movie_db/pages/auth/auth_model.dart';
import 'package:the_movie_db/service/notifier_provider.dart';
import '../pages/auth/authorization_page.dart';
import '../pages/main/main_screen.dart';
import '../pages/main/main_screen_model.dart';
import '../pages/movie_details/movie_details_screen.dart';

abstract class MainNavigationOfRoutes {
  static const String homePage = '/movies_list';
  static const String authPage = 'authorization';
  static const String movieDetailsPage = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationOfRoutes.homePage
      : MainNavigationOfRoutes.authPage;
  // final initialRoute = MainNavigationOfRoutes.authPage;

  final routes = <String, Widget Function(BuildContext context)>{
    MainNavigationOfRoutes.authPage: (context) => NotifierProvider(
        model: AuthScreenModel(), child: const AuthorizationScreen()),
    //
    MainNavigationOfRoutes.homePage: (context) =>
        NotifierProvider(model: MainScreenModel(), child: const MainScreen()),
  };

  Route<Object>? onGenerateRoute(RouteSettings settings) {
    // final configuration = settings.arguments;
    switch (settings.name) {
      case MainNavigationOfRoutes.movieDetailsPage:
        final arguments = settings.arguments;
        final movieId = arguments is int ? arguments : 0;
        return MaterialPageRoute(
            builder: ((context) => MovieDetailsScreen(movieId: movieId)));
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
