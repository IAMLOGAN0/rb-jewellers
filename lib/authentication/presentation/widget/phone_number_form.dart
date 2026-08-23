import 'dart:developer';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hyperlink_text/Rich_text/rich_element.dart';
import 'package:hyperlink_text/hyperlink_text.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app/domain/core/constants.dart';
import '../../../app/presentation/widgets/app_button_widget.dart';
import '../../../home/presentation/home_screen.dart';
import '../../application/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import '../screen/verify_phone_number_screen.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({
    super.key,
  });

  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();

  bool isTermsAndConditonsAccepted = false;

  var userrrr;

  callUSer() async {
    await Future.delayed(const Duration(seconds: 2));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userrrr = prefs.getBool("isAnonymous") ?? false;
    print("userr2222----${userrrr}");
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callUSer();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInBloc, SignInState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              // handle failure if needed
            },
            (success) {
              if (success == "guest_success") {
                Get.offAll(() => const HomeScreen());
                Get.snackbar(
                  'Guest Mode Activated',
                  'You can browse our products. Sign up later to save your data.',
                  duration: const Duration(seconds: 3),
                );
              }
            },
          ),
        );
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          autovalidateMode: state.showErrorMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25),
                child: AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textStyle: largeTextDark,
                  prefixWidget: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      '+91',
                      style: largeTextDark,
                    ),
                  ),
                  hintText: 'Enter Phone Number',
                  validateCallBack: (v) {
                    return state.phoneNumber != null
                        ? context
                            .read<SignInBloc>()
                            .state
                            .phoneNumber!
                            .value
                            .fold(
                              (f) => f.maybeMap(
                                invalidPhoneNumber: (_) =>
                                    'Invalid Phone Number',
                                orElse: () => null,
                              ),
                              (_) => null,
                            )
                        : 'Phone Number Cannot be Empty';
                  },
                  onChangedCallBack: (value) => context
                      .read<SignInBloc>()
                      .add(SignInEvent.enteringPhoneNumber('+91$value')),
                ),
              ),
              thickSpace,
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 18),
                child: Row(
                  children: [
                    Transform.scale(
                      scale: 1.0,
                      // Adjust scale if you need to tweak the size of the checkbox
                      child: Checkbox(
                        activeColor: primaryColor,
                        checkColor: primaryAccentColor,
                        // fillColor: WidgetStateProperty.all(primaryColor),
                        fillColor: MaterialStateProperty.all(primaryColor),
                        side: BorderSide.none,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        // Removes extra padding around the checkbox
                        value: isTermsAndConditonsAccepted,
                        onChanged: (bool? value) {
                          setState(() {
                            isTermsAndConditonsAccepted =
                                !isTermsAndConditonsAccepted;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: HyperLinkText(
                          textStyle: standardText.copyWith(),
                          hyperLinkStyle: standardTextBold,
                          richElements: [
                            RichElement.text(text: "By proceeding you accept"),
                            RichElement.link(
                              text: ' terms and conditions',
                              url: 'https://rbjeweller.in/terms-conditions/',
                            ),
                            RichElement.text(
                                text: "\nYou can read the privacy policy"),
                            RichElement.link(
                              text: ' here',
                              url: 'https://rbjeweller.in/privacy-policy-2/',
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
              thickSpace,
              thickSpace,
              thickSpace,
              thickSpace,
              SizedBox(
                width: screenWidth - 50,
                height: screenWidth * .6 / 4.5,
                child: AppButtonWidget(
                  onTap: () async {
                    FocusManager.instance.primaryFocus?.unfocus();
                    // if (!_formKey.currentState!.validate()) {
                    //   return;
                    // }
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    if (userrrr == true) {
                      prefs.setBool("isAnonymous", false);
                      _auth.signOutAnonymously();
                      print("object-------${prefs.getBool("isAnonymous")}");
                    }
                    context
                        .read<SignInBloc>()
                        .add(const SignInEvent.showError());

                    if (state.phoneNumber?.isValid() ?? false) {
                      if (!isTermsAndConditonsAccepted) {
                        toastMessage('Please accept terms and conditions');
                        return;
                      }

                      Get.to(() => VerifyPhoneNumberScreen(
                            phoneNumber: state.phoneNumber!.getOrCrash(),
                          ));
                    } else {
                      toastMessage('Enter valid phone number');
                    }
                  },
                  buttonText: "SEND OTP",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              userrrr == false
                  ? state.isSubmitting
                      ? const Center(child: CircularProgressIndicator())
                      : SizedBox(
                          width: screenWidth - 50,
                          height: screenWidth * .6 / 4.5,
                          child: AppButtonWidget(
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context
                                  .read<SignInBloc>()
                                  .add(const SignInEvent.guestSignIn());
                            },
                            buttonText: "GUEST LOGIN",
                          ),
                        )
                  : Container()
            ],
          ),
        );
      },
    );
  }

  // In your widget or provider
  final authService = AuthService();
  
  // To check if user is already signed in
  void checkAuthState() {
    User? user = authService.getCurrentUser();
    if (user != null) {
      // User is signed in (could be anonymous or regular)
      print(
          "User is signed in: ${user.isAnonymous ? 'as guest' : 'as regular user'}");
    } else {
      // No user is signed in
      print("No user signed in");
    }
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Anonymous sign in
  Future<User?> signInAnonymously() async {
    try {
      // Initialize Firebase if not already done
      await Firebase.initializeApp();

      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print("user------${user}");
      return user;
    } catch (e) {
      print("Error signing in anonymously: $e");
      return null;
    }
  }

  Future<User?> signInAsGuest() async {
    try {
      await Firebase.initializeApp();
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;

      if (user != null) {
        // Log analytics event
        await FirebaseAnalytics.instance.logEvent(
          name: 'guest_sign_in',
          parameters: {'uid': user.uid},
        );

        //  await _initializeGuestData(user.uid);
      }

      return user;
    } catch (e) {
      // Log error to analytics
      await FirebaseAnalytics.instance.logEvent(
        name: 'guest_sign_in_error',
        parameters: {'error': e.toString()},
      );

      rethrow;
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> signOutAnonymously() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      // Check if user is anonymous before signing out
      if (user != null && user.isAnonymous) {
        await FirebaseAuth.instance.signOut();

        // Optional: Clear any anonymous user data from local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove('anonymous_user_data');

        print('Anonymous user signed out successfully');
      } else {
        print('No anonymous user to sign out');
      }
    } catch (e) {
      print('Error signing out anonymous user: $e');
    }
  }
}
