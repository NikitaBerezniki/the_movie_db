import 'package:flutter/material.dart';
import 'package:the_movie_db/service/application_model.dart';
import 'service/main_navigation.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final model = ApplicationModel();
  await model.checkAuth();
  return runApp(TheMovieDataBaseApp(model: model));
}

class TheMovieDataBaseApp extends StatelessWidget {
  const TheMovieDataBaseApp({Key? key, required this.model}) : super(key: key);
  static final mainNavigation = MainNavigation();
  final ApplicationModel model;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: mainNavigation.initialRoute(model.isAuth),
      onGenerateRoute: mainNavigation.onGenerateRoute,
      routes: mainNavigation.routes,
    );
  }
}
