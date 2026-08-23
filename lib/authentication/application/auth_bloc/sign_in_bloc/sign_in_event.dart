part of 'sign_in_bloc.dart';

@freezed
class SignInEvent with _$SignInEvent {
  const factory SignInEvent.started() = _Started;
  const factory SignInEvent.selectCountryCode(String countryCode) =
      SelectCountryCode;
  const factory SignInEvent.enteringPhoneNumber(String phoneNumber) =
      EnteringPhoneNumber;
  const factory SignInEvent.authenticatePhone(String phoneNumber) =
      AuthenticatePhone;
  const factory SignInEvent.verificationCompleted(
      PhoneAuthCredential? credential) = VerificationCompleted;
  const factory SignInEvent.verificationFailed(FirebaseAuthException error) =
      VerificationFailed;
  const factory SignInEvent.codeAutoRetrievalTimeout(String verificationId) =
      CodeAutoRetrievalTimeout;
  const factory SignInEvent.codeSent(
      String verificationId, int? forceResendingToken) = CodeSent;
  const factory SignInEvent.enterCode(String code) = EnterCode;
  const factory SignInEvent.verifyOTP(String code) = VerifyOTP;
  const factory SignInEvent.showError() = ShowError;
  const factory SignInEvent.guestSignIn() = GuestSignIn;
}
