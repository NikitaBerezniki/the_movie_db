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
  void didUpdateWidget(covariant MyDidUpdateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
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
    if (oldWidget.isCollapse == widget.isCollapse) return;

    if (widget.isCollapse) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
          parent: _animationController, curve: Curves.easeInOut),
      axisAlignment: 0.0,
      child: FadeTransition(
          opacity: CurvedAnimation(
              parent: _animationController, curve: Curves.linear),
          child: widget),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
