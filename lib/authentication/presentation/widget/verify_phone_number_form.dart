import 'package:another_flushbar/flushbar_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/presentation/widgets/dotted_red_bg.dart';
import 'package:rb_jewellers/authentication/presentation/widget/phone_number_form.dart';
import 'package:rb_jewellers/home/presentation/home_screen.dart';

import '../../../app/domain/core/constants.dart';
import '../../../app/presentation/widgets/app_back_button.dart';
import '../../../app/presentation/widgets/shimmer_loading_widget.dart';
import '../../../app/presentation/widgets/timer_widget.dart';
import '../../../profile/application/bloc/profile_bloc.dart';
import '../../../profile/presentation/screen/profile_registration_screen.dart';
import '../../application/auth_bloc/auth_bloc.dart';
import '../../application/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../domain/user.dart';
import '../screen/sign_in_screen.dart';
import 'pin_input_field.dart';

class VerifyPhoneNumberWidget extends StatefulWidget {
  final String phoneNumber;

  const VerifyPhoneNumberWidget({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<VerifyPhoneNumberWidget> createState() =>
      _VerifyPhoneNumberWidgetState();
}

class _VerifyPhoneNumberWidgetState extends State<VerifyPhoneNumberWidget> {
  late TextEditingController pinController;

  @override
  void initState() {
    pinController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    pinController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DottedRedBackground(
      child: SafeArea(
        child: BlocListener<ProfileBloc, ProfileState>(
          listener: (context, state) {
            state.responseFailedOrSuccess.fold(
              () {}, // const Center(child: ThreeDotLoader()),
              (either) {
                either.fold((failure) {
                  failure.map(profileAlreadyExists: (f) {
                    final authBloc = BlocProvider.of<AuthBloc>(context);
                    authBloc.add(const AuthEvent.signedOut());
                    Get.offAll(() => const SignInScreen());
                  }, profileNotFound: (f) {
                    Get.offAll(() => ProfileRegistrationScreen(
                          phoneNumber: AppUser.phoneNumber.getOrCrash(),
                        ));
                  }, unexpected: (e) {
                    final authBloc = BlocProvider.of<AuthBloc>(context);
                    authBloc.add(const AuthEvent.signedOut());
                    Get.offAll(() => const SignInScreen());
                  });

                  FlushbarHelper.createError(
                    message: failure.map(
                      profileAlreadyExists: (f) =>
                          'Profile Already Exists With Number, Try Sign In.',
                      profileNotFound: (f) =>
                          'Profile Not Found, Please Sign Up',
                      unexpected: (e) => 'Unxepected Error\n${e.message}',
                    ),
                  ).show(context);
                }, (unit) async {
                  Get.offAll(() => const HomeScreen());
                });
              },
            );
          },
          child: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) async {
              if (state.isSubmitting) {
                // AppUser.phoneNumber = state.phoneNumber!;
                await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: state.phoneNumber!.value.getOrElse(() => ''),
                    verificationCompleted: (PhoneAuthCredential? credential) {
                      // pinController.text = credential?.smsCode?.toString() ?? '';
                      // setState(() {});
                    },
                    verificationFailed: (FirebaseAuthException error) => context
                        .read<SignInBloc>()
                        .add(SignInEvent.verificationFailed(error)),
                    codeAutoRetrievalTimeout: (String verificationId) => context
                        .read<SignInBloc>()
                        .add(SignInEvent.codeAutoRetrievalTimeout(
                            verificationId)),
                    codeSent:
                        (String verificationId, int? forceResendingToken) =>
                            context.read<SignInBloc>().add(SignInEvent.codeSent(
                                verificationId, forceResendingToken)),
                    timeout: const Duration(seconds: 0));
                // AppDialogs.closeDialog();
              }

              state.authFailureOrSuccessOption.fold(
                () {},
                (either) {
                  either.fold(
                    (failure) {
                      FlushbarHelper.createError(
                        duration: const Duration(seconds: 5),
                        message: failure.maybeMap(
                          cancelledByUser: (_) => 'Cancelled',
                          serverError: (_) => 'Server error',
                          invalidPhoneNumber: (_) => 'INVALID PHONE NUMBER',
                          invalidOTP: (_) => 'INVALID OTP',
                          unknownError: (e) => e.toString(),
                          orElse: () => 'unknown',
                        ),
                      ).show(context);
                    },
                    (_) {
                      context
                          .read<AuthBloc>()
                          .add(const AuthEvent.authCheckRequested());
                      context
                          .read<ProfileBloc>()
                          .add(const ProfileEvent.getUser());
                      // Get.offAll(ProfileRegistrationScreen(
                      //     phoneNumber: AppUser.phoneNumber.getOrCrash()));
                    },
                  );
                },
              );
            },
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                body: state.isSubmitting
                    ? Align(
                        alignment: Alignment.center,
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
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
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
                                      ShimmerLoadingScreen(
                                        widget: Text(
                                          'Sending OTP',
                                          textAlign: TextAlign.center,
                                          style: standardTextBold.copyWith(
                                              color: secondaryAccentColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    // Column(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: [
                    //       Center(
                    //         child: CustomLoader(
                    //           loaderType: LoaderType.circular,
                    //           activeColor: secondaryAccentColor,
                    //         ),
                    //       ),
                    //       const SizedBox(height: 50),
                    //       Center(
                    //         child: ShimmerLoadingScreen(
                    //           widget: Text(
                    //             'Sending OTP',
                    //             style: titleText,
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   )
                    : ListView(
                        padding: const EdgeInsets.all(20),
                        // controller: scrollController,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const AppBackButton(),
                              if (state.codeSent)
                                TextButton(
                                  onPressed: state.codeAutoRetrievalTimeout
                                      ? () {
                                          context.read<SignInBloc>().add(
                                              SignInEvent.authenticatePhone(
                                                  state.phoneNumber!.value
                                                      .getOrElse(() => '')));
                                        }
                                      : null,
                                  child: !state.codeAutoRetrievalTimeout
                                      ? const TimerWidget()
                                      : Text(
                                          "Resend OTP",
                                          style: largeTextBold,
                                        ),
                                ),
                            ],
                          ),
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
                          Text("Verification",
                              textAlign: TextAlign.center,
                              style: titleTextBold),
                          thickSpace, thickSpace,
                          Text(
                              "We've sent an SMS with a verification code to ${widget.phoneNumber}",
                              textAlign: TextAlign.center,
                              style: largeText),
                          thickSpace,

                          const SizedBox(height: 15),
                          // Text('Enter OTP', style: largeTextDark),
                          const SizedBox(height: 15),
                          PinInputField(
                            pinController: pinController,
                            length: 6,
                            // onFocusChange: (hasFocus) async {
                            //   if (hasFocus) await _scrollToBottomOnKeyboardOpen();
                            // },
                            onSubmit: (enteredOtp) async {
                              context
                                  .read<SignInBloc>()
                                  .add(SignInEvent.enterCode(enteredOtp));
                              if (enteredOtp.length == 6) {
                                context
                                    .read<SignInBloc>()
                                    .add(SignInEvent.verifyOTP(enteredOtp));
                              }
                            },
                          ),
                          thickSpace, thickSpace,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Didn't recieve otp? ",
                                style: standardText,
                              ),
                              InkWell(
                                child: Text(
                                  'Resend',
                                  style: standardTextBold,
                                ),
                                onTap: () {
                                  context.read<SignInBloc>().add(
                                      SignInEvent.authenticatePhone(state
                                          .phoneNumber!.value
                                          .getOrElse(() => '')));
                                },
                              ),
                            ],
                          ),
                          // thickSpace, thickSpace, thickSpace,
                          // SizedBox(
                          //   width: screenWidth - 45,
                          //   height: screenWidth * .6 / 5,
                          //   child: AppButtonWidget(
                          //     onTap: () {
                          //       if (state.smsCode?.length == 6) {
                          //         context
                          //             .read<SignInBloc>()
                          //             .add(SignInEvent.verifyOTP(state.smsCode!));
                          //       } else {
                          //         toastMessage('Enter 6 digit OTP');
                          //       }
                          //     },
                          //     buttonText: "SUBMIT",
                          //   ),
                          // ),
                        ],
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
