import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rb_jewellers/authentication/presentation/widget/phone_number_form.dart';
import 'package:rb_jewellers/profile/domain/profile.dart';

import '../../../app/domain/core/constants.dart';
import '../../../app/presentation/widgets/dotted_red_bg.dart';
import '../../../authentication/application/auth_bloc/sign_in_bloc/sign_in_bloc.dart';

class GuestProfileViewScreen extends StatefulWidget {
  const GuestProfileViewScreen({super.key});

  @override
  State<GuestProfileViewScreen> createState() => _GuestProfileViewScreenState();
}

class _GuestProfileViewScreenState extends State<GuestProfileViewScreen> {
  Widget dismissKeyboardOnTap(BuildContext context, {required Widget child}) {
    return GestureDetector(
      // 1. Tap anywhere → hide keyboard
      onTap: () => _hideKeyboard(context),

      // 2. (Optional) Long-press also hides it
      onLongPress: () => _hideKeyboard(context),

      // 3. Do **not** intercept taps that are meant for buttons / scroll
      behavior: HitTestBehavior.translucent,

      child: child,
    );
  }

  /// Internal – unfocus the current node (works on iOS & Android)
  void _hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    } else {
      // If the focused widget is inside a Form, unfocus the node first
      currentFocus.focusedChild?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return dismissKeyboardOnTap(
      context,
      child: BlocProvider(
        create: (context) => SignInBloc(),
        child: DottedRedBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    thickSpace,
                    thickSpace,
                    thickSpace,
                    const PhoneNumberForm(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
