import 'package:flutter/material.dart';

import '../../domain/core/constants.dart';

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget({
    super.key,
    required this.onTap,
    required this.buttonText,
    this.isEnabled = true,
    this.color,
    this.buttonTextColor,
    this.textAlign = Alignment.center,
    this.textStyle,
    this.enableBorder = false,
    this.borderRadius,
  });

  final VoidCallback onTap;
  final String buttonText;
  final bool isEnabled;
  final Color? color;
  final Color? buttonTextColor;
  final AlignmentGeometry textAlign;
  final TextStyle? textStyle;
  final bool enableBorder;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isEnabled ? onTap : null,
      shape: RoundedRectangleBorder(
          side: enableBorder
              ? BorderSide(color: primaryAccentColor)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 10)),
      color: color ?? secondaryColor,
      splashColor: primaryColor,
      padding: EdgeInsets.zero,
      child: Ink(
        decoration: BoxDecoration(
          color: color ?? secondaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 10),
          // gradient: color != null
          //     ? null
          //     : LinearGradient(
          //         colors: [
          //           secondaryColor,
          //           secondaryAccentColor,
          //         ],
          //       ),
        ),
        child: Align(
          alignment: textAlign,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              buttonText,
              style: textStyle ??
                  largeTextBold.copyWith(
                      fontWeight: FontWeight.w900,
                      color: buttonTextColor ?? textColorLight),
            ),
          ),
        ),
      ),
    );
  }
}
