import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../domain/core/constants.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.onChangedCallBack,
    this.validateCallBack,
    this.textInputType,
    this.inputFormatters,
    this.enableEdit = true,
    this.enableBorder = false,
    this.prefixWidget,
    this.suffixWidget,
    this.borderRadius = 10,
    this.maxLines,
    this.textStyle,
    this.hintStyle,
    this.fillColor,
    this.contentPadding,
    this.textAlign,
    this.autovalidateMode,
    this.errorText,
    this.borderColor,
    this.suffixText,
    this.suffixTextStyle,
    this.prefixText,
    this.prefixTextStyle,
    this.focusedBorderColor,
    this.initialValue,
    this.autoFocus = true,
    this.errorStyle,
    this.textInputAction,
  });

  final bool autoFocus;
  final String? initialValue;
  final bool enableEdit;
  final bool enableBorder;
  final String? hintText;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final Function(String)? onChangedCallBack;
  final String? Function(String?)? validateCallBack;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final double borderRadius;
  final int? maxLines;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final Color? fillColor;
  final EdgeInsets? contentPadding;
  final TextAlign? textAlign;
  final String? errorText;
  final AutovalidateMode? autovalidateMode;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      initialValue: initialValue,
      autovalidateMode: autovalidateMode,
      textAlign: textAlign ?? TextAlign.left,
      enabled: enableEdit,
      controller: controller,
      maxLines: maxLines,
      autocorrect: false,
      onChanged: onChangedCallBack,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      validator: validateCallBack,
      style: textStyle,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: enableBorder
                ? BorderSide(color: borderColor ?? primaryAccentColor)
                : BorderSide.none),
        disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: enableBorder
                ? BorderSide(color: primaryAccentColor.shade100)
                : BorderSide.none),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: enableBorder
                ? BorderSide(color: borderColor ?? primaryAccentColor.shade200)
                : BorderSide.none),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: enableBorder
                ? BorderSide(
                    color: focusedBorderColor ?? primaryAccentColor.shade900)
                : BorderSide.none),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide.none),
        errorStyle: errorStyle ?? smallText,
        errorText: errorText,
        helperStyle: smallText,
        hintText: hintText,
        hintStyle: hintStyle ?? largeTextDark.copyWith(color: Colors.black45),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
        suffixText: suffixText,
        suffixStyle: suffixTextStyle,
        prefixText: prefixText,
        prefixStyle: prefixTextStyle,
        prefixIconColor: Colors.black45,
        suffixIconColor: Colors.black45,
        filled: true,
        fillColor: fillColor ?? primaryColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
 textInputAction: textInputAction,     // InputDecoration(
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      //     borderSide: enableBorder
      //         ? BorderSide(color: primaryAccentColor)
      //         : BorderSide.none,
      //   ),
      //   disabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      //     borderSide: enableBorder
      //         ? BorderSide(color: primaryAccentColor)
      //         : BorderSide.none,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      //     borderSide: enableBorder
      //         ? BorderSide(color: primaryAccentColor)
      //         : BorderSide.none,
      //   ),
      //   errorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      //     borderSide: enableBorder
      //         ? BorderSide(color: primaryAccentColor)
      //         : BorderSide.none,
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      //     borderSide: enableBorder
      //         ? BorderSide(color: primaryAccentColor)
      //         : BorderSide.none,
      //   ),
      //   focusedErrorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      //     borderSide: enableBorder
      //         ? BorderSide(color: primaryAccentColor)
      //         : BorderSide.none,
      //   ),

      //   hintText: hintText,
      //   hintStyle: hintStyle ?? largeTextDark,
      //   prefixIcon: leadingWidget,
      //   suffixIcon: suffixWidget,

      //   filled: true,
      //   fillColor: fillColor ??
      //       primaryColorShade, // !enableBorder ? primaryColorShade : primaryAccentColor,
      //   // isDense: true,
      // contentPadding: contentPadding ??
      //     const EdgeInsets.symmetric(vertical: 10, horizontal: 15).copyWith(
      //       right: suffixWidget != null ? 0 : 15,
      //     ),
      // ),
    );
  }
}
