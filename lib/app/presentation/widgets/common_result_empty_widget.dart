import 'package:flutter/material.dart';

import '../../domain/core/constants.dart';

class CommonResultsEmptyWidget extends StatelessWidget {
  final String msg;
  final Function()? buttonHandler;
  const CommonResultsEmptyWidget(
      {super.key, required this.msg, this.buttonHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: FractionalOffset.center,
      margin: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: primaryAccentColor.shade200,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (buttonHandler != null)
            const SizedBox(
              height: 40,
            ),
          const Expanded(
            child: Icon(
              Icons.data_array,
              color: Colors.white,
            ),
          ),
          // Image.asset('assets/images/null_data.png')),
          // thinSpace,
          Text(
            msg,
            textAlign: TextAlign.center,
            style: standardText,
          ),
          if (buttonHandler != null)
            MaterialButton(
              height: 40,
              color: secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
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
                  style: standardTextBold.copyWith(color: secondaryAccentColor),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
