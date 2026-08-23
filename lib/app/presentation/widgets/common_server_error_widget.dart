import 'package:flutter/material.dart';

import '../../domain/core/constants.dart';

class CommonServerErrorWidget extends StatelessWidget {
  final String? text;
  final Function() buttonHandler;
  final Color? textColorReceived;

  const CommonServerErrorWidget(this.text, this.buttonHandler,
      {super.key, this.textColorReceived = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 10,
        ),
        Icon(
          Icons.error_outline,
          color: backgroundColor,
          size: 50,
        ),
        if (text != null)
          Container(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            alignment: FractionalOffset.center,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              text ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: textColorReceived,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        const SizedBox(height: 8),
        MaterialButton(
          height: 40,
          color: secondaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          onPressed: buttonHandler,
          child: Container(
            padding: const EdgeInsets.fromLTRB(
              30,
              0,
              30,
              0,
            ),
            child: Text(
              "Tap to Retry",
              style: standardTextBold, //.copyWith(color: secondaryAccentColor),
            ),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
