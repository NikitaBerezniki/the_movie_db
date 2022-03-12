import 'package:flutter/material.dart';

import 'widgets/app_bar_widget.dart';
import 'main.dart';
import 'movie_list_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab = 1;

  void _onSelectedItem(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedTab, children: const [
        Text('123'),
        MovieListPage(),
        Text('657567'),
      ]),
      appBar: simpleAppBar(),
      // drawer: CategoriesDrawerWidget(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: _onSelectedItem,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 24,
        selectedItemColor: AppStyleClass.whiteColor,
        backgroundColor: AppStyleClass.backgroundColor,
        unselectedItemColor: AppStyleClass.blueAccentColor,
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
