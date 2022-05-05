import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/styles.dart';
import 'package:the_movie_db/widgets/app_bar_widget.dart';

import '../movies_list/movies_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        MovieListViewWidget(),
        Text('123'),
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
