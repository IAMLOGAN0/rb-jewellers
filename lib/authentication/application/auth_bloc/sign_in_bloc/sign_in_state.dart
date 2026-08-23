part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  factory SignInState({
    required PhoneNumber? phoneNumber,
    required bool showErrorMessages,
    required bool isSubmitting,
    required Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
    required FirebaseAuthException? firebaseAuthException,
    required bool codeSent,
    required String? smsCode,
    required String? verificationId,
    required int? resendToken,
    required bool codeAutoRetrievalTimeout,
  }) = _SignInState;

  factory SignInState.initial() => SignInState(
        firebaseAuthException: null,
        codeSent: false,
        smsCode: '',
        verificationId: '',
        resendToken: null,
        codeAutoRetrievalTimeout: true,
        phoneNumber: null,
        showErrorMessages: false,
        isSubmitting: false,
        authFailureOrSuccessOption: none(),
      );
}
