
import 'package:flutter/material.dart';

import '../../domain/core/constants.dart';

class BottomAppBarCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_1 = Paint()
      ..color = primaryAccentColor
      ..style = PaintingStyle.fill;

    Path path_1 = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * .08, size.height)
      ..cubicTo(
          size.width * 0.00, // new x1
          size.height, // new y1
          0.0, // new x2
          size.height - (0.1 * size.width), // new y2
          0.0, // new x3
          size.height - (0.05 * size.width) // new y3
          );

    Path path_2 = Path()
      ..moveTo(size.width, size.height)
      ..lineTo(size.width * .92, size.height)
      ..cubicTo(
          size.width * 1, // new x1
          size.height, // new y1
          size.width, // new x2
          size.height - (0.1 * size.width), // new y2
          size.width, // new x3
          size.height - (0.05 * size.width) // new y3
          );

    // Path path_1 = Path()
    //   ..moveTo(0, size.height)
    //   ..lineTo(size.width * .08, size.height)
    //   ..cubicTo(
    //       size.width * 0.04,
    //       size.height, //x1,y1
    //       0.0,
    //       size.height - (0.1 * size.width), //x2,y2
    //       0.0,
    //       size.height - (0.04 * size.width) //x3,y3
    //       );

    // Path path_2 = Path()
    //   ..moveTo(size.width, size.height)
    //   ..lineTo(size.width * .92, size.height)
    //   ..cubicTo(
    //       size.width * .96,
    //       size.height, //x1,y1
    //       size.width,
    //       size.height - (0.1 * size.width), //x2,y2
    //       size.width,
    //       size.height - (0.04 * size.width) //x3,y3
    //       );

    Paint paint_2 = Paint()
      ..color = primaryAccentColor
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    Path path_3 = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path_1, paint_1);
    canvas.drawPath(path_2, paint_1);
    canvas.drawPath(path_3, paint_2);
  }

  @override
  bool shouldRepaint(BottomAppBarCustomPainter oldDelegate) {
    return true; // or return true if your custom painter should repaint under certain conditions
  }
}
