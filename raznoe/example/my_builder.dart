import 'package:flutter/material.dart';

final ckey = GlobalKey<_ColoredWidgetState>();

class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initalColor;

  ColoredWidget({Key? key, required this.child, required this.initalColor})
      : super(key: key);
  @override
  State<ColoredWidget> createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;
  @override
  void initState() {
    super.initState();
    color = widget.initalColor;
  }

  void changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      color: color,
      child: widget.child,
    );
  }
}

class MyBuilder extends StatelessWidget {
  const MyBuilder({Key? key}) : super(key: key);
  void _onPressed(BuildContext context) {
    // context
    //     .findRootAncestorStateOfType<_ColoredWidgetState>()
    //     ?.changeColor(Colors.red);
    // ckey.currentState?.changeColor(Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initalColor: Colors.cyanAccent,
      child: Container(
        color: Colors.amber,
        padding: EdgeInsets.all(50),
        child: Builder(builder: (context) {
          return ColoredWidget(
            key: ckey,
            initalColor: Colors.blue,
            child: Center(child: Builder(builder: (context) {
              return ElevatedButton(
                onPressed: () => _onPressed(context),
                child: Text('ЖМИ'),
              );
            })),
          );
        }),
      ),
    );
  }
}
