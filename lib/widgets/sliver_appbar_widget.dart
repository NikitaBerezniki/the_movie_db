import 'package:flutter/material.dart';

import '../resources/images.dart';

class MySliverAppBar extends SliverAppBar {
  const MySliverAppBar({Key? key}) : super(key: key);
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color.fromRGBO(3, 37, 65, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 35,
              )),
          IconButton(
            onPressed: null,
            icon: Image.asset(AppImages.logo),
            iconSize: 60,
            padding: const EdgeInsets.all(0),
          ),
          Row(
            children: const [
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
