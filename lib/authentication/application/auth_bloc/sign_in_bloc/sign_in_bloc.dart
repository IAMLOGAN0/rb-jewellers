import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../profile/domain/value_objects.dart';
import '../../../domain/auth_failure.dart';
import '../../../presentation/widget/phone_number_form.dart';

part 'sign_in_bloc.freezed.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState.initial()) {
    // on<SelectCountryCode>((event, emit) {
    //   emit(state.copyWith(
    //     countryCode: event.countryCode,
    //     authFailureOrSuccessOption: none(),
    //   ));
    // });

    on<EnteringPhoneNumber>((event, emit) {
      emit(state.copyWith(
        phoneNumber: PhoneNumber(event.phoneNumber.toString()),
        authFailureOrSuccessOption: none(),
      ));
    });

    on<ShowError>((event, emit) {
      emit(state.copyWith(
        showErrorMessages: true,
        authFailureOrSuccessOption: none(),
      ));
    });

    on<AuthenticatePhone>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        showErrorMessages: true,
        phoneNumber: PhoneNumber(event.phoneNumber.toString()),
        smsCode: '',
        firebaseAuthException: null,
        authFailureOrSuccessOption: none(),
      ));
    });

    on<VerificationCompleted>((event, emit) async {
      try {
        await FirebaseAuth.instance.signInWithCredential(event.credential!);
      } on FirebaseAuthException catch (e) {
        emit(state.copyWith(
            isSubmitting: false,
            firebaseAuthException: e,
            authFailureOrSuccessOption:
                optionOf(left(AuthFailure.unknownError(e.code)))));
      } catch (e) {
        emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: optionOf(
            left(
              AuthFailure.unknownError(e.toString()),
            ),
          ),
        ));
      }
      emit(
        state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: optionOf(right("success")),
        ),
      );
    });

    on<VerificationFailed>((event, emit) {
      if (event.error.code == 'invalid-phone-number') {
        emit(state.copyWith(
          isSubmitting: false,
          firebaseAuthException: event.error,
          authFailureOrSuccessOption: optionOf(
            left(const AuthFailure.invalidPhoneNumber()),
          ),
        ));
        return;
      }
      String err =
          'AUTH ${event.error.code}  ${event.error.message} ${event.error.toString()}';
      emit(state.copyWith(
        firebaseAuthException: event.error,
        authFailureOrSuccessOption:
            optionOf(left(AuthFailure.unknownError(err))),
        isSubmitting: false,
      ));
    });

    on<CodeAutoRetrievalTimeout>((event, emit) {
      emit(state.copyWith(
        codeAutoRetrievalTimeout: true,
        verificationId: event.verificationId,
      ));
    });

    on<CodeSent>((event, emit) async {
      emit(state.copyWith(
        codeSent: true,
        verificationId: event.verificationId,
        resendToken: event.forceResendingToken,
        codeAutoRetrievalTimeout: false,
        isSubmitting: false,
      ));

      if (state.smsCode != null && state.smsCode!.length == 6) {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: state.verificationId!, smsCode: state.smsCode!);
        try {
          final FirebaseAuth _auth = FirebaseAuth.instance;

          await _auth.signInWithCredential(credential);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-phone-number') {
            emit(state.copyWith(
              isSubmitting: false,
              firebaseAuthException: e,
              authFailureOrSuccessOption: optionOf(
                left(AuthFailure.unknownError(e.message!)),
              ),
            ));
            return;
          }
          emit(state.copyWith(
            firebaseAuthException: e,
          ));
        } catch (e) {
          emit(state.copyWith(
            authFailureOrSuccessOption:
                optionOf(left(AuthFailure.unknownError(e.toString()))),
          ));
        }
        emit(
          state.copyWith(
            authFailureOrSuccessOption: optionOf(right("success")),
          ),
        );
      }
    });

    on<EnterCode>((event, emit) {
      emit(state.copyWith(
        smsCode: event.code,
        firebaseAuthException: null,
        authFailureOrSuccessOption: none(),
      ));
    });

    on<VerifyOTP>(
      (event, emit) async {
        try {
          final credential = PhoneAuthProvider.credential(
            verificationId: state.verificationId!,
            smsCode: event.code,
          );
          await FirebaseAuth.instance.signInWithCredential(credential);
          // print('yahi h >> ');

          // final AuthService _auth = AuthService();
          // final user = await _auth.signInAsGuest();
          //
          // print('uid >> ${user!.uid.toString()}');
          // FirebaseMessaging messaging = FirebaseMessaging.instance;
          // String? token = await messaging.getToken();
          // print('token >> ${token}');
          // CollectionReference products = FirebaseFirestore.instance.collection('user_tokens');
          // await products.add({
          //   'userId': user.uid.toString(),
          //   'fcmToken': token,
          //   'lastUpdated': DateTime.now(),
          // });

          emit(
            state.copyWith(
              authFailureOrSuccessOption: optionOf(right("success")),
            ),


          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'invalid-verification-code') {
            emit(state.copyWith(
              isSubmitting: false,
              firebaseAuthException: e,
              authFailureOrSuccessOption: optionOf(
                left(const AuthFailure.invalidOTP()),
              ),
            ));
            return;
          }
          emit(state.copyWith(
            firebaseAuthException: e,
            authFailureOrSuccessOption:
                optionOf(left(AuthFailure.unknownError(e.toString()))),
          ));
        } catch (e) {
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: optionOf(left(
              AuthFailure.unknownError(e.toString()),
            )),
          ));
        }
      },
    );

    on<GuestSignIn>((event, emit) async {
      emit(state.copyWith(
        isSubmitting: true,
        authFailureOrSuccessOption: none(),
      ));
      try {
        final AuthService _auth = AuthService();
        final user = await _auth.signInAsGuest();
        if (user != null) {
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool("isAnonymous", user.isAnonymous);
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: optionOf(right("guest_success")),
          ));
        } else {
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: optionOf(left(const AuthFailure.serverError())),
          ));
        }
      } catch (e) {
        emit(state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: optionOf(left(AuthFailure.unknownError(e.toString()))),
        ));
      }
    });

  }
}
