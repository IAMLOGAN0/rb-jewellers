import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../domain/core/constants.dart';

class AppGradientText extends StatelessWidget {
  const AppGradientText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
  });
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return GradientText(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 15.0,
          fontWeight: fontWeight ?? FontWeight.normal),
      colors: [
        secondaryColor,
        secondaryAccentColor,
      ],
    );
  }
}
