import 'package:flutter/material.dart';

class MyDidUpdateWidget extends StatefulWidget {
  const MyDidUpdateWidget({Key? key}) : super(key: key);

  @override
  State<MyDidUpdateWidget> createState() => _MyDidUpdateWidgetState();
}

class _MyDidUpdateWidgetState extends State<MyDidUpdateWidget> {
  bool _isCollapse = false;

  void _toggle() {
    _isCollapse = !_isCollapse;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ElevatedButton(
          onPressed: _toggle,
          child: Text(_isCollapse ? 'Развернуть' : 'Свернуть')),
      Expanded(
          child: Center(
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.all(10),
          child: CollapseAnimatedBox(
            isCollapse: _isCollapse,
            duration: Duration(milliseconds: 2500),
            child: Container(
              height: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ))
    ]);
  }
}

class CollapseAnimatedBox extends StatefulWidget {
  final Widget child;

  final Duration duration;

  bool isCollapse;

  CollapseAnimatedBox(
      {Key? key,
      required this.isCollapse,
      required this.duration,
      required this.child})
      : super(key: key);

  @override
  State<CollapseAnimatedBox> createState() => _CollapseAnimatedBoxState();
}

class _CollapseAnimatedBoxState extends State<CollapseAnimatedBox>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    if (!widget.isCollapse) {
      _animationController.value = 1;
    }
  }

@override
  void didUpdateWidget(covariant CollapseAnimatedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
       
    
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
