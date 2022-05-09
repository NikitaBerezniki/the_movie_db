import 'package:flutter/material.dart';
import 'package:the_movie_db/pages/main/main_screen_model.dart';
import 'package:the_movie_db/resources/styles.dart';
import 'package:the_movie_db/service/notifier_provider.dart';
import 'package:the_movie_db/widgets/simple_app_bar_widget.dart';

import '../movies_list/movies_list_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 1;
  void _onSelectedItem(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.of<MainScreenModel>(context);
    return Scaffold(
      body: IndexedStack(index: _selectedTab, children: [
        Container(),
        MovieListPage(),
        Container(),
      ]),
      appBar: simpleAppBar(),
      // drawer: CategoriesDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _onSelectedItem,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 24,
        selectedItemColor: AppColorStyle.whiteColor,
        backgroundColor: AppColorStyle.blueBackgroundColor,
        unselectedItemColor: AppColorStyle.blueAccentColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.newspaper), label: 'Новости'),
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Фильмы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_library), label: 'Сериалы')
        ],
      ),
    );
  }
}
