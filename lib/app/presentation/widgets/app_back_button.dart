import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AppBackButton extends StatelessWidget {
  final Function()? customBackCallBack;
  const AppBackButton({
    super.key,
    this.customBackCallBack,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: customBackCallBack ??
          () {
            Get.back();
          },
      child: Container(
          padding:
              const EdgeInsets.only(left: 14, right: 6, bottom: 10, top: 10),
          decoration: BoxDecoration(
            // color: p,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 16,
          )),
    );
  }
}
