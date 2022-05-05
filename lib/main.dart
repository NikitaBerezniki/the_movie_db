import 'package:flutter/material.dart';
import 'service/main_navigation.dart';

void main(List<String> args) {
  return runApp(MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);
    static final mainNavigation = MainNavigation();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
        debugShowCheckedModeBanner: false,
        initialRoute: mainNavigation.initialRoute,
        onGenerateRoute: mainNavigation.onGenerateRoute,
        routes: mainNavigation.routes,
        );
  }
}
