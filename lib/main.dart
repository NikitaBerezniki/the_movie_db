import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_movie_db/models/app_model.dart';
import 'package:the_movie_db/models/auth_model.dart';
import 'package:the_movie_db/models/main_screen_model.dart';
import 'package:the_movie_db/models/movie_list_model.dart';
import 'service/main_navigation.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // final model = AppModel();
  // await model.checkAuth();
  return runApp(MultiProvider(providers: [
    Provider(create: (context) => AppModel()),
    ChangeNotifierProvider(create: (context) => AuthModel()),
    ChangeNotifierProvider(create: (context) => MovieListModel()),
    ChangeNotifierProvider(create: (context) => MainScreenModel()),
  ], child: TheMovieDataBaseApp(/*model: model*/)));
}

class TheMovieDataBaseApp extends StatefulWidget {
  const TheMovieDataBaseApp({
    Key? key,
    /*required this.model*/
  }) : super(key: key);
  static final mainNavigation = MainNavigation();

  @override
  State<TheMovieDataBaseApp> createState() => _TheMovieDataBaseAppState();
}

class _TheMovieDataBaseAppState extends State<TheMovieDataBaseApp> {
  // final AppModel model;
  @override
  void initState() {
    super.initState();
    Provider.of<AppModel>(context, listen: false).checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, appModel, child) {
      // appModel.checkAuth();
      print('Мы авторизованы? ${appModel.isAuth}');
      return MaterialApp(
        theme: ThemeData(primaryColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        initialRoute:
            TheMovieDataBaseApp.mainNavigation.initialRoute(appModel.isAuth),
        onGenerateRoute: TheMovieDataBaseApp.mainNavigation.onGenerateRoute,
        routes: TheMovieDataBaseApp.mainNavigation.routes,
      );
    });
  }
}
