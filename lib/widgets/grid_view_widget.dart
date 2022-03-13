import 'package:flutter/material.dart';

class MyGridViewWidget extends StatelessWidget {
  const MyGridViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          children: [
            Container(
              color: Colors.amber,
              child: Text('123'),
            ),
            Container(
              color: Colors.blue,
              child: Text('123'),
            ),
            Container(
              color: Colors.pinkAccent,
              child: Text('123'),
            ),
            Container(
              color: Colors.indigoAccent,
              child: Text('123'),
            ),
            Container(
              color: Colors.cyan,
              child: Text('123'),
            ),
            Container(
              color: Colors.deepPurple,
              child: Text('123'),
            ),
            Container(
              color: Colors.lightBlueAccent,
              child: Text('123'),
            ),
          ],
        ));
  }
}
