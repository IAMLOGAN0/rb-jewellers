import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../domain/core/constants.dart';

class AppGradientTextButton extends StatelessWidget {
  const AppGradientTextButton({
    super.key,
    required this.onTapCallBack,
    required this.buttonText,
  });
  final String buttonText;
  final Function() onTapCallBack;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallBack,
      child: GradientText(
        buttonText,
        style: const TextStyle(
          fontSize: 15.0,
        ),
        colors: [
          secondaryColor,
          secondaryAccentColor,
        ],
      ),
    );
  }
}
