import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rb_jewellers/app/presentation/widgets/dotted_red_bg.dart';

import '../../../app/domain/core/constants.dart';
import '../../application/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import '../widget/phone_number_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
                  SizedBox(
                    height: screenHeight * .08,
                  ),
                  Center(
                    child: Image.asset(
                      'assets/logo/LOGO.png',
                      height: screenHeight / 4.5,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .08,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.76, top: 10),
                    child: Text(
                      "Login/Signup",
                      style: titleTextBold.copyWith(fontSize: 44),
                    ),
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
    );
  }
}
