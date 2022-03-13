import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgressBar extends StatefulWidget {
  final double sizeBar;
  final double percent;
  RadialProgressBar({Key? key, required this.sizeBar,required this.percent}) : super(key: key);

  @override
  State<RadialProgressBar> createState() => _RadialProgressBarState();
}

class _RadialProgressBarState extends State<RadialProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: widget.sizeBar,
          height: widget.sizeBar,
          child: RadialPercentWidget(
            percent: widget.percent,
            sizeBar: widget.sizeBar,
            backgroundColor: const Color.fromARGB(255, 10, 23, 25),
            coverColor: const Color.fromARGB(255, 25, 54, 31),
            scaleColor: const Color.fromARGB(255, 37, 203, 103),
          ),
        ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final double percent;
  final double sizeBar;
  final Color backgroundColor;
  final Color coverColor;
  final Color scaleColor;
  const RadialPercentWidget(
      {Key? key,
      required this.percent,
      required this.sizeBar,
      required this.backgroundColor,
      required this.coverColor,
      required this.scaleColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      CustomPaint(
          painter: MyPainter(
              percent: percent,
              sizeWidget: sizeBar,
              backgroundColor: backgroundColor,
              coverColor: coverColor,
              lineColor: scaleColor)),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${percent.toInt()}',
              style: TextStyle(
                  fontSize: sizeBar / 3, color: Colors.white)),
          Baseline(
            baseline: 0,
            baselineType: TextBaseline.ideographic,
            child: Text(
              '%',
              style: TextStyle(
                  fontSize: sizeBar / 6, color: Colors.white),
            ),
          )
        ],
      )
    ]);
  }
}

class MyPainter extends CustomPainter {
  final double percent;
  final double sizeWidget;
  final Color backgroundColor;
  final Color coverColor;
  final Color lineColor;
  MyPainter(
      {required this.percent,
      required this.sizeWidget,
      required this.backgroundColor,
      required this.coverColor,
      required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final double widthScale = sizeWidget / 16;
    final arcRect = calculateArcRect(size, widthScale);

    drawBackground(canvas, size);

    drawBaselineForScale(widthScale, canvas, arcRect);

    drawScale(widthScale, canvas, arcRect);
  }

  void drawScale(double widthScale, Canvas canvas, Rect arcRect) {
    final paint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 10)
      ..strokeWidth = widthScale;
    canvas.drawArc(arcRect, -pi / 2, pi * 2 * (percent / 100), false, paint);
  }

  void drawBaselineForScale(double fillWidth, Canvas canvas, Rect arcRect) {
    final paint = Paint()
      ..color = coverColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = fillWidth;
    canvas.drawOval(arcRect, paint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateArcRect(Size size, double widthScale) {
    return Offset(widthScale / 2 + sizeWidget / 24,
            widthScale / 2 + sizeWidget / 24) &
        Size(size.width - widthScale - sizeWidget / 12,
            size.height - widthScale - sizeWidget / 12);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
