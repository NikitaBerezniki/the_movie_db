import 'package:flutter/material.dart';
import 'package:the_movie_db/resources/styles.dart';
import 'package:the_movie_db/widgets/app_bar_widget.dart';
import 'example/did_update_widget.dart';
import 'movie_listview/movie_listview.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab = 0;

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
        // MyDidUpdateWidget(),
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
