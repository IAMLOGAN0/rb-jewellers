import 'dart:async';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/presentation/widgets/dotted_red_bg.dart';
import 'package:rb_jewellers/home/presentation/home_screen.dart';
import 'package:rb_jewellers/profile/application/bloc/profile_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../authentication/application/auth_bloc/auth_bloc.dart';
import '../../../authentication/presentation/screen/sign_in_screen.dart';
import '../../../authentication/presentation/widget/phone_number_form.dart';
import '../../domain/core/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("isPopup", true);
    });
  }

  @override
  Widget build(BuildContext context) {
    setScreenDimensions(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: DottedRedBackground(
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listenWhen: (previous, current) => previous != current,
              listener: (context, state) async {
                state.map(
                  initial: (_) {},
                  authenticated: (_) async => context.read<ProfileBloc>().add(
                    const ProfileEvent.getUser(),
                  ),
                  unauthenticated: (_) async => Future.delayed(
                    const Duration(seconds: 1),
                  ).then((value) => Get.offAll(() => const SignInScreen())),
                );
              },
            ),
            BlocListener<ProfileBloc, ProfileState>(
              listenWhen: (previous, current) => previous.responseFailedOrSuccess != current.responseFailedOrSuccess,
              listener: (context, state) async {
                state.responseFailedOrSuccess.fold(() {}, (either) {
                  either.fold(
                    (failure) async {
                      final AuthService _auth = AuthService();
                      final user = await _auth.signInAsGuest();
                      print('userobject----${user?.isAnonymous}');
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      // user?.isAnonymous == true ?
                      print('isAnonymous > ${prefs.getBool("isAnonymous")}');
                      // print('getOrCrash > ${AppUser.phoneNumber.getOrCrash()}');
                      prefs.getBool("isAnonymous") == true
                          ? Get.offAll(() => const HomeScreen())
                          : failure.maybeMap(
                              profileNotFound: (f) {
                                final authBloc = BlocProvider.of<AuthBloc>(
                                  context,
                                );
                                authBloc.add(const AuthEvent.signedOut());
                                Get.offAll(() => const SignInScreen());

                                // Get.offAll(() => ProfileRegistrationScreen(phoneNumber: AppUser.phoneNumber.getOrCrash(),));
                              },
                              unexpected: (e) {
                                FlushbarHelper.createError(
                                  message: failure.maybeMap(
                                    unexpected: (e) =>
                                        'Unxepected Error\n${e.message}',
                                    orElse: () => '',
                                  ),
                                ).show(context);
                                final authBloc = BlocProvider.of<AuthBloc>(
                                  context,
                                );
                                authBloc.add(const AuthEvent.signedOut());
                                Get.offAll(() => const SignInScreen());
                              },
                              orElse: () {
                                FlushbarHelper.createError(
                                  message: failure.maybeMap(
                                    unexpected: (e) =>
                                        'Unxepected Error\n${e.message}',
                                    orElse: () => '',
                                  ),
                                ).show(context);
                              },
                            );
                    },
                    (unit) async {
                      final AuthService _auth = AuthService();
                      final user1 = await _auth.getCurrentUser();
                      print('user1----${user1!.uid}');
                      Get.offAll(() => const HomeScreen());
                    },
                  );
                });
              },
            ),
          ],
          child: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 60,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/logo/LOGO.png',
                      width: screenWidth * 3 / 4,
                    ),
                  ),
                ),
                // Positioned(
                //   bottom: 20,
                //   right: 0,
                //   left: 0,
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text('Powered by',
                //           textAlign: TextAlign.center,
                //           style: smallTextDarkBold.copyWith(
                //             color: Colors.white54,
                //           )),
                //       const SizedBox(height: 8),
                //       Text('Binary Sequence',
                //           style: largeTextDark.copyWith(
                //             color: Colors.white54,
                //           )),
                //       const SizedBox(height: 8),
                //       FutureBuilder<String>(
                //           future: _getAppVersion(),
                //           builder: (BuildContext context,
                //               AsyncSnapshot<String> snapshot) {
                //             String version = '';
                //             if (snapshot.connectionState ==
                //                     ConnectionState.done &&
                //                 snapshot.hasData) {
                //               version = snapshot.data == null
                //                   ? ''
                //                   : 'Version : //${snapshot.data}';
                //             }
                //             return Text(version,
                //                 textAlign: TextAlign.center,
                //                 style: smallTextDark.copyWith(
                //                   color: Colors.white54,
                //                 ));
                //           }),
                //       const SizedBox(height: 20),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<String> _getAppVersion() async {
  //   PackageInfo packageInfo = await PackageInfo.fromPlatform();
  //   return packageInfo.version;
  // }
}
