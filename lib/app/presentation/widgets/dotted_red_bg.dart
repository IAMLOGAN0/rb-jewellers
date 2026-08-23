import 'package:flutter/material.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';

class DottedRedBackground extends StatelessWidget {
  const DottedRedBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: screenWidth,
      // height: screenHeight,
      decoration: BoxDecoration(
        // color: backgroundColor, // Red background color
        gradient: appRadialGrdient,
      ),
      child: CustomPaint(
        painter: DottedBackgroundPainter(),
        child: child,
      ),
    );
  }
}

class DottedBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the white paint (for the dots)
    final paint = Paint()
      ..color = Colors.white24
      ..strokeCap = StrokeCap.round // Makes the dots circular
      ..strokeWidth = 4.0; // Diameter of the dots

    // Define spacing between the dots
    double spacing = 15.0;

    for (double y = 0; y < size.height; y += spacing) {
      for (double x = 0; x < size.width; x += spacing) {
        canvas.drawCircle(Offset(x, y), 2.0, paint); // Draw white dots
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No need to repaint unless you want to update the pattern
  }
}
