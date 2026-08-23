import 'package:flutter/material.dart';

import '../../domain/core/constants.dart';

class DottedLineDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double height;
  final double width;
  final double dashLength;
  final double gapLength;
  final bool isVertical;

  const DottedLineDivider({
    Key? key,
    this.thickness = 2.0,
    this.color = Colors.grey,
    this.dashLength = 5.0,
    this.gapLength = 5.0,
    this.isVertical = false,
    this.height = 20,
    this.width = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isVertical) {
      return SizedBox(
        width: 20,
        child: Center(
          child: CustomPaint(
            size: Size(0, height),
            painter: DottedLinePainter(
              color: color,
              thickness: thickness,
              dashLength: dashLength,
              gapLength: gapLength,
              isVertical: true,
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: height,
        width: screenWidth,
        child: Center(
          child: CustomPaint(
            size: Size(screenWidth, 0),
            painter: DottedLinePainter(
              color: color,
              thickness: thickness,
              dashLength: dashLength,
              gapLength: gapLength,
            ),
          ),
        ),
      );
    }
  }
}

class DottedLinePainter extends CustomPainter {
  final double thickness;
  final Color color;
  final double dashLength;
  final double gapLength;
  final bool isVertical;

  DottedLinePainter({
    required this.color,
    required this.thickness,
    required this.dashLength,
    required this.gapLength,
    this.isVertical = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double startX = 0;
    double endX = isVertical ? size.height : size.width;
    double startY = 0;
    double endY = isVertical ? size.width : size.height;

    while (startX < endX || startY < endY) {
      if (!isVertical) {
        canvas.drawPath(
          Path()
            ..moveTo(startX, 0)
            ..lineTo(startX + dashLength, 0),
          paint,
        );
      } else {
        canvas.drawPath(
          Path()
            ..moveTo(0, startY)
            ..lineTo(0, startY + dashLength),
          paint,
        );
      }

      startX += dashLength + gapLength;
      startY += dashLength + gapLength;
    }
  }

  @override
  bool shouldRepaint(DottedLinePainter oldDelegate) {
    return color != oldDelegate.color ||
        thickness != oldDelegate.thickness ||
        dashLength != oldDelegate.dashLength ||
        gapLength != oldDelegate.gapLength ||
        isVertical != oldDelegate.isVertical;
  }
}
