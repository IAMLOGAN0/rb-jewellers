import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/core/constants.dart';

class AppDialogs {
  static bool _isDialogOpen = false;
  static late Widget _currentDialog;

  static void setLoadingDialog(
      {bool isDismissible = false,
      Alignment alignment = Alignment.center,
      String? text}) {
    if (!_isDialogOpen) {
      _currentDialog = PopScope(
        // onPopInvokedWithResult: (b, d) {
        //   if (isDismissible) {
        //     Get.back();
        //     _isDialogOpen = false;
        //     _currentDialog = const SizedBox.shrink();
        //   }
        //   // return false;
        // },
        onPopInvoked: (didPop) {
          if (isDismissible) {
            Get.back();
            _isDialogOpen = false;
            _currentDialog = const SizedBox.shrink();
          }
        },
        child: Align(
          alignment: alignment,
          child: Container(
            margin: const EdgeInsets.all(12),
            height: 200,
            child: Material(
              borderRadius: BorderRadius.circular(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  isDismissible
                      ? Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.cancel,
                                color: Colors.black12,
                              ),
                            ),
                            onTap: () {
                              closeDialog();
                            },
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 70,
                            width: 70,
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          secondaryAccentColor)
                                      //  color: Colors.indigo,
                                      ),
                                ),
                                Center(
                                  child: Image.asset(
                                    'assets/app_icon/playstore.png',
                                    height: 42,
                                    width: 42,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          text ?? 'Please wait..',
                          textAlign: TextAlign.center,
                          style: standardTextBold.copyWith(
                              color: secondaryAccentColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      Get.dialog(_currentDialog,
          barrierDismissible: false, barrierColor: Colors.black26);
      _isDialogOpen = true;
    }
  }

  static void setMessageDialog(
    String message, {
    String? buttonText,
    Function()? buttonCallBack,
    bool isCouponCard = false,
  }) {
    if (!_isDialogOpen) {
      _currentDialog = Align(
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: isCouponCard
              ? const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/golden-ticket-coupon.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                )
              : null,
          child: Material(
            color: isCouponCard ? Colors.transparent : backgroundColor,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  thickSpace,
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: isCouponCard
                        ? titleTextBoldDark.copyWith(
                            color: secondaryAccentColor,
                            letterSpacing: 8,
                          )
                        : titleTextBoldDark,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth / 4),
                    child: ElevatedButton(
                      onPressed: () {
                        closeDialog();
                        if (buttonCallBack != null) {
                          buttonCallBack();
                        }

                        _isDialogOpen = false;
                        _currentDialog = const SizedBox.shrink();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isCouponCard
                            ? secondaryAccentColor
                            : secondaryColor,
                      ),
                      child: Text(
                        buttonText ?? 'OK',
                        style: largeTextBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
      Get.dialog(_currentDialog,
          barrierDismissible: false, barrierColor: Colors.black26);
      _isDialogOpen = true;
    }
  }

  static void closeDialog() {
    if (_isDialogOpen) {
      Get.overlayContext?.findRootAncestorStateOfType<NavigatorState>()?.pop();
      _isDialogOpen = false;
      _currentDialog = const SizedBox.shrink();
    }
  }
}
