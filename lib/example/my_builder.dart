import 'package:flutter/material.dart';


class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initalColor;
  
  const ColoredWidget({ Key? key, required this.child, required this.initalColor }) : super(key: key);
  @override
  State<ColoredWidget> createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  void changeColor(Color color){
    widget.initalColor = color;
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(50),
      color: widget.initalColor,
    );
  }
}

class MyBuilder extends StatelessWidget {
  const MyBuilder({Key? key}) : super(key: key);
  void _onPressed(BuildContext context){
    context.findAncestorStateOfType<_ColoredWidgetState>()?.changeColor(Colors.deepPurpleAccent);
  }
  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initalColor: Colors.blue,
      child: Center(
        child: Builder(
          builder: (context) {
            return ElevatedButton(onPressed: ()=>_onPressed(context), child: Text('ЖМИ'));
          }
        ),
      ),
    );
  }
}
