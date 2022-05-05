import 'package:flutter/material.dart';

final gkey = GlobalKey<_MyTextWidgetState>();

class MyGlobalKeyWidget extends StatelessWidget {
  const MyGlobalKeyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                onPressed: () => gkey.currentState?._increment(),
                child: Text('Increment'),
              ),
          SizedBox(height: 30),
          MyTextWidget(key: gkey),
        ]),
      )),
    );
  }
}

class MyTextWidget extends StatefulWidget {
  MyTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTextWidget> createState() => _MyTextWidgetState();
}

class _MyTextWidgetState extends State<MyTextWidget> {
  var _value = 0;

  void _increment() {
    _value++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _value.toString(),
      style: TextStyle(fontSize: 30),
    );
  }
}
