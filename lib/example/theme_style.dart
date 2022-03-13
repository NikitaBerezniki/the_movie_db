import 'package:flutter/material.dart';
import 'dart:math' as math;

class OwnThemeStyle extends StatelessWidget {
  const OwnThemeStyle({Key? key}) : super(key: key);
  void onTap(context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ThemeSetting(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App bar'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: (() => onTap(context)), icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
          child: Text(
            'HOME',
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}

class ThemeSetting extends StatefulWidget {
  const ThemeSetting({Key? key}) : super(key: key);

  @override
  State<ThemeSetting> createState() => _ThemeSettingState();
}

class _ThemeSettingState extends State<ThemeSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Setting theme'),
      ),
      body: ListView.builder(
        itemCount: 4,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                  .withOpacity(0.9),
              child: Text(
                '123',
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
        // separatorBuilder: (BuildContext context, int index) =>
        // const Divider(thickness: 0),
      ),
    );
  }
}


