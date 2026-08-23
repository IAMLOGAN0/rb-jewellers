// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'SignInEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements SignInEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SelectCountryCodeImplCopyWith<$Res> {
  factory _$$SelectCountryCodeImplCopyWith(_$SelectCountryCodeImpl value,
          $Res Function(_$SelectCountryCodeImpl) then) =
      __$$SelectCountryCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String countryCode});
}

/// @nodoc
class __$$SelectCountryCodeImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$SelectCountryCodeImpl>
    implements _$$SelectCountryCodeImplCopyWith<$Res> {
  __$$SelectCountryCodeImplCopyWithImpl(_$SelectCountryCodeImpl _value,
      $Res Function(_$SelectCountryCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
  }) {
    return _then(_$SelectCountryCodeImpl(
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectCountryCodeImpl implements SelectCountryCode {
  const _$SelectCountryCodeImpl(this.countryCode);

  @override
  final String countryCode;

  @override
  String toString() {
    return 'SignInEvent.selectCountryCode(countryCode: $countryCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectCountryCodeImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectCountryCodeImplCopyWith<_$SelectCountryCodeImpl> get copyWith =>
      __$$SelectCountryCodeImplCopyWithImpl<_$SelectCountryCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return selectCountryCode(countryCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return selectCountryCode?.call(countryCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (selectCountryCode != null) {
      return selectCountryCode(countryCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return selectCountryCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return selectCountryCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (selectCountryCode != null) {
      return selectCountryCode(this);
    }
    return orElse();
  }
}

abstract class SelectCountryCode implements SignInEvent {
  const factory SelectCountryCode(final String countryCode) =
      _$SelectCountryCodeImpl;

  String get countryCode;
  @JsonKey(ignore: true)
  _$$SelectCountryCodeImplCopyWith<_$SelectCountryCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnteringPhoneNumberImplCopyWith<$Res> {
  factory _$$EnteringPhoneNumberImplCopyWith(_$EnteringPhoneNumberImpl value,
          $Res Function(_$EnteringPhoneNumberImpl) then) =
      __$$EnteringPhoneNumberImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$EnteringPhoneNumberImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$EnteringPhoneNumberImpl>
    implements _$$EnteringPhoneNumberImplCopyWith<$Res> {
  __$$EnteringPhoneNumberImplCopyWithImpl(_$EnteringPhoneNumberImpl _value,
      $Res Function(_$EnteringPhoneNumberImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$EnteringPhoneNumberImpl(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EnteringPhoneNumberImpl implements EnteringPhoneNumber {
  const _$EnteringPhoneNumberImpl(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignInEvent.enteringPhoneNumber(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnteringPhoneNumberImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnteringPhoneNumberImplCopyWith<_$EnteringPhoneNumberImpl> get copyWith =>
      __$$EnteringPhoneNumberImplCopyWithImpl<_$EnteringPhoneNumberImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return enteringPhoneNumber(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return enteringPhoneNumber?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (enteringPhoneNumber != null) {
      return enteringPhoneNumber(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return enteringPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return enteringPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (enteringPhoneNumber != null) {
      return enteringPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class EnteringPhoneNumber implements SignInEvent {
  const factory EnteringPhoneNumber(final String phoneNumber) =
      _$EnteringPhoneNumberImpl;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$EnteringPhoneNumberImplCopyWith<_$EnteringPhoneNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticatePhoneImplCopyWith<$Res> {
  factory _$$AuthenticatePhoneImplCopyWith(_$AuthenticatePhoneImpl value,
          $Res Function(_$AuthenticatePhoneImpl) then) =
      __$$AuthenticatePhoneImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$AuthenticatePhoneImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$AuthenticatePhoneImpl>
    implements _$$AuthenticatePhoneImplCopyWith<$Res> {
  __$$AuthenticatePhoneImplCopyWithImpl(_$AuthenticatePhoneImpl _value,
      $Res Function(_$AuthenticatePhoneImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = null,
  }) {
    return _then(_$AuthenticatePhoneImpl(
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AuthenticatePhoneImpl implements AuthenticatePhone {
  const _$AuthenticatePhoneImpl(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'SignInEvent.authenticatePhone(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticatePhoneImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticatePhoneImplCopyWith<_$AuthenticatePhoneImpl> get copyWith =>
      __$$AuthenticatePhoneImplCopyWithImpl<_$AuthenticatePhoneImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return authenticatePhone(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return authenticatePhone?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (authenticatePhone != null) {
      return authenticatePhone(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return authenticatePhone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return authenticatePhone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (authenticatePhone != null) {
      return authenticatePhone(this);
    }
    return orElse();
  }
}

abstract class AuthenticatePhone implements SignInEvent {
  const factory AuthenticatePhone(final String phoneNumber) =
      _$AuthenticatePhoneImpl;

  String get phoneNumber;
  @JsonKey(ignore: true)
  _$$AuthenticatePhoneImplCopyWith<_$AuthenticatePhoneImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationCompletedImplCopyWith<$Res> {
  factory _$$VerificationCompletedImplCopyWith(
          _$VerificationCompletedImpl value,
          $Res Function(_$VerificationCompletedImpl) then) =
      __$$VerificationCompletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PhoneAuthCredential? credential});
}

/// @nodoc
class __$$VerificationCompletedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$VerificationCompletedImpl>
    implements _$$VerificationCompletedImplCopyWith<$Res> {
  __$$VerificationCompletedImplCopyWithImpl(_$VerificationCompletedImpl _value,
      $Res Function(_$VerificationCompletedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? credential = freezed,
  }) {
    return _then(_$VerificationCompletedImpl(
      freezed == credential
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
    ));
  }
}

/// @nodoc

class _$VerificationCompletedImpl implements VerificationCompleted {
  const _$VerificationCompletedImpl(this.credential);

  @override
  final PhoneAuthCredential? credential;

  @override
  String toString() {
    return 'SignInEvent.verificationCompleted(credential: $credential)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationCompletedImpl &&
            (identical(other.credential, credential) ||
                other.credential == credential));
  }

  @override
  int get hashCode => Object.hash(runtimeType, credential);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationCompletedImplCopyWith<_$VerificationCompletedImpl>
      get copyWith => __$$VerificationCompletedImplCopyWithImpl<
          _$VerificationCompletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return verificationCompleted(credential);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return verificationCompleted?.call(credential);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (verificationCompleted != null) {
      return verificationCompleted(credential);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return verificationCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return verificationCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (verificationCompleted != null) {
      return verificationCompleted(this);
    }
    return orElse();
  }
}

abstract class VerificationCompleted implements SignInEvent {
  const factory VerificationCompleted(final PhoneAuthCredential? credential) =
      _$VerificationCompletedImpl;

  PhoneAuthCredential? get credential;
  @JsonKey(ignore: true)
  _$$VerificationCompletedImplCopyWith<_$VerificationCompletedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerificationFailedImplCopyWith<$Res> {
  factory _$$VerificationFailedImplCopyWith(_$VerificationFailedImpl value,
          $Res Function(_$VerificationFailedImpl) then) =
      __$$VerificationFailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FirebaseAuthException error});
}

/// @nodoc
class __$$VerificationFailedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$VerificationFailedImpl>
    implements _$$VerificationFailedImplCopyWith<$Res> {
  __$$VerificationFailedImplCopyWithImpl(_$VerificationFailedImpl _value,
      $Res Function(_$VerificationFailedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$VerificationFailedImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException,
    ));
  }
}

/// @nodoc

class _$VerificationFailedImpl implements VerificationFailed {
  const _$VerificationFailedImpl(this.error);

  @override
  final FirebaseAuthException error;

  @override
  String toString() {
    return 'SignInEvent.verificationFailed(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerificationFailedImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerificationFailedImplCopyWith<_$VerificationFailedImpl> get copyWith =>
      __$$VerificationFailedImplCopyWithImpl<_$VerificationFailedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return verificationFailed(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return verificationFailed?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return verificationFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return verificationFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (verificationFailed != null) {
      return verificationFailed(this);
    }
    return orElse();
  }
}

abstract class VerificationFailed implements SignInEvent {
  const factory VerificationFailed(final FirebaseAuthException error) =
      _$VerificationFailedImpl;

  FirebaseAuthException get error;
  @JsonKey(ignore: true)
  _$$VerificationFailedImplCopyWith<_$VerificationFailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CodeAutoRetrievalTimeoutImplCopyWith<$Res> {
  factory _$$CodeAutoRetrievalTimeoutImplCopyWith(
          _$CodeAutoRetrievalTimeoutImpl value,
          $Res Function(_$CodeAutoRetrievalTimeoutImpl) then) =
      __$$CodeAutoRetrievalTimeoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId});
}

/// @nodoc
class __$$CodeAutoRetrievalTimeoutImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$CodeAutoRetrievalTimeoutImpl>
    implements _$$CodeAutoRetrievalTimeoutImplCopyWith<$Res> {
  __$$CodeAutoRetrievalTimeoutImplCopyWithImpl(
      _$CodeAutoRetrievalTimeoutImpl _value,
      $Res Function(_$CodeAutoRetrievalTimeoutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
  }) {
    return _then(_$CodeAutoRetrievalTimeoutImpl(
      null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CodeAutoRetrievalTimeoutImpl implements CodeAutoRetrievalTimeout {
  const _$CodeAutoRetrievalTimeoutImpl(this.verificationId);

  @override
  final String verificationId;

  @override
  String toString() {
    return 'SignInEvent.codeAutoRetrievalTimeout(verificationId: $verificationId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeAutoRetrievalTimeoutImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, verificationId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeAutoRetrievalTimeoutImplCopyWith<_$CodeAutoRetrievalTimeoutImpl>
      get copyWith => __$$CodeAutoRetrievalTimeoutImplCopyWithImpl<
          _$CodeAutoRetrievalTimeoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return codeAutoRetrievalTimeout(verificationId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return codeAutoRetrievalTimeout?.call(verificationId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (codeAutoRetrievalTimeout != null) {
      return codeAutoRetrievalTimeout(verificationId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return codeAutoRetrievalTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return codeAutoRetrievalTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (codeAutoRetrievalTimeout != null) {
      return codeAutoRetrievalTimeout(this);
    }
    return orElse();
  }
}

abstract class CodeAutoRetrievalTimeout implements SignInEvent {
  const factory CodeAutoRetrievalTimeout(final String verificationId) =
      _$CodeAutoRetrievalTimeoutImpl;

  String get verificationId;
  @JsonKey(ignore: true)
  _$$CodeAutoRetrievalTimeoutImplCopyWith<_$CodeAutoRetrievalTimeoutImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CodeSentImplCopyWith<$Res> {
  factory _$$CodeSentImplCopyWith(
          _$CodeSentImpl value, $Res Function(_$CodeSentImpl) then) =
      __$$CodeSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String verificationId, int? forceResendingToken});
}

/// @nodoc
class __$$CodeSentImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$CodeSentImpl>
    implements _$$CodeSentImplCopyWith<$Res> {
  __$$CodeSentImplCopyWithImpl(
      _$CodeSentImpl _value, $Res Function(_$CodeSentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? verificationId = null,
    Object? forceResendingToken = freezed,
  }) {
    return _then(_$CodeSentImpl(
      null == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == forceResendingToken
          ? _value.forceResendingToken
          : forceResendingToken // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CodeSentImpl implements CodeSent {
  const _$CodeSentImpl(this.verificationId, this.forceResendingToken);

  @override
  final String verificationId;
  @override
  final int? forceResendingToken;

  @override
  String toString() {
    return 'SignInEvent.codeSent(verificationId: $verificationId, forceResendingToken: $forceResendingToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeSentImpl &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.forceResendingToken, forceResendingToken) ||
                other.forceResendingToken == forceResendingToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, verificationId, forceResendingToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeSentImplCopyWith<_$CodeSentImpl> get copyWith =>
      __$$CodeSentImplCopyWithImpl<_$CodeSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return codeSent(verificationId, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return codeSent?.call(verificationId, forceResendingToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(verificationId, forceResendingToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return codeSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return codeSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(this);
    }
    return orElse();
  }
}

abstract class CodeSent implements SignInEvent {
  const factory CodeSent(
          final String verificationId, final int? forceResendingToken) =
      _$CodeSentImpl;

  String get verificationId;
  int? get forceResendingToken;
  @JsonKey(ignore: true)
  _$$CodeSentImplCopyWith<_$CodeSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EnterCodeImplCopyWith<$Res> {
  factory _$$EnterCodeImplCopyWith(
          _$EnterCodeImpl value, $Res Function(_$EnterCodeImpl) then) =
      __$$EnterCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$EnterCodeImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$EnterCodeImpl>
    implements _$$EnterCodeImplCopyWith<$Res> {
  __$$EnterCodeImplCopyWithImpl(
      _$EnterCodeImpl _value, $Res Function(_$EnterCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$EnterCodeImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EnterCodeImpl implements EnterCode {
  const _$EnterCodeImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'SignInEvent.enterCode(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnterCodeImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EnterCodeImplCopyWith<_$EnterCodeImpl> get copyWith =>
      __$$EnterCodeImplCopyWithImpl<_$EnterCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return enterCode(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return enterCode?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (enterCode != null) {
      return enterCode(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return enterCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return enterCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (enterCode != null) {
      return enterCode(this);
    }
    return orElse();
  }
}

abstract class EnterCode implements SignInEvent {
  const factory EnterCode(final String code) = _$EnterCodeImpl;

  String get code;
  @JsonKey(ignore: true)
  _$$EnterCodeImplCopyWith<_$EnterCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyOTPImplCopyWith<$Res> {
  factory _$$VerifyOTPImplCopyWith(
          _$VerifyOTPImpl value, $Res Function(_$VerifyOTPImpl) then) =
      __$$VerifyOTPImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$VerifyOTPImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$VerifyOTPImpl>
    implements _$$VerifyOTPImplCopyWith<$Res> {
  __$$VerifyOTPImplCopyWithImpl(
      _$VerifyOTPImpl _value, $Res Function(_$VerifyOTPImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$VerifyOTPImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOTPImpl implements VerifyOTP {
  const _$VerifyOTPImpl(this.code);

  @override
  final String code;

  @override
  String toString() {
    return 'SignInEvent.verifyOTP(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOTPImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      __$$VerifyOTPImplCopyWithImpl<_$VerifyOTPImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return verifyOTP(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return verifyOTP?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return verifyOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return verifyOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(this);
    }
    return orElse();
  }
}

abstract class VerifyOTP implements SignInEvent {
  const factory VerifyOTP(final String code) = _$VerifyOTPImpl;

  String get code;
  @JsonKey(ignore: true)
  _$$VerifyOTPImplCopyWith<_$VerifyOTPImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowErrorImplCopyWith<$Res> {
  factory _$$ShowErrorImplCopyWith(
          _$ShowErrorImpl value, $Res Function(_$ShowErrorImpl) then) =
      __$$ShowErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowErrorImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$ShowErrorImpl>
    implements _$$ShowErrorImplCopyWith<$Res> {
  __$$ShowErrorImplCopyWithImpl(
      _$ShowErrorImpl _value, $Res Function(_$ShowErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowErrorImpl implements ShowError {
  const _$ShowErrorImpl();

  @override
  String toString() {
    return 'SignInEvent.showError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return showError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return showError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return showError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return showError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (showError != null) {
      return showError(this);
    }
    return orElse();
  }
}

abstract class ShowError implements SignInEvent {
  const factory ShowError() = _$ShowErrorImpl;
}

/// @nodoc
abstract class _$$GuestSignInImplCopyWith<$Res> {
  factory _$$GuestSignInImplCopyWith(
          _$GuestSignInImpl value, $Res Function(_$GuestSignInImpl) then) =
      __$$GuestSignInImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GuestSignInImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$GuestSignInImpl>
    implements _$$GuestSignInImplCopyWith<$Res> {
  __$$GuestSignInImplCopyWithImpl(
      _$GuestSignInImpl _value, $Res Function(_$GuestSignInImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GuestSignInImpl implements GuestSignIn {
  const _$GuestSignInImpl();

  @override
  String toString() {
    return 'SignInEvent.guestSignIn()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GuestSignInImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String countryCode) selectCountryCode,
    required TResult Function(String phoneNumber) enteringPhoneNumber,
    required TResult Function(String phoneNumber) authenticatePhone,
    required TResult Function(PhoneAuthCredential? credential)
        verificationCompleted,
    required TResult Function(FirebaseAuthException error) verificationFailed,
    required TResult Function(String verificationId) codeAutoRetrievalTimeout,
    required TResult Function(String verificationId, int? forceResendingToken)
        codeSent,
    required TResult Function(String code) enterCode,
    required TResult Function(String code) verifyOTP,
    required TResult Function() showError,
    required TResult Function() guestSignIn,
  }) {
    return guestSignIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String countryCode)? selectCountryCode,
    TResult? Function(String phoneNumber)? enteringPhoneNumber,
    TResult? Function(String phoneNumber)? authenticatePhone,
    TResult? Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult? Function(FirebaseAuthException error)? verificationFailed,
    TResult? Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult? Function(String verificationId, int? forceResendingToken)?
        codeSent,
    TResult? Function(String code)? enterCode,
    TResult? Function(String code)? verifyOTP,
    TResult? Function()? showError,
    TResult? Function()? guestSignIn,
  }) {
    return guestSignIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String countryCode)? selectCountryCode,
    TResult Function(String phoneNumber)? enteringPhoneNumber,
    TResult Function(String phoneNumber)? authenticatePhone,
    TResult Function(PhoneAuthCredential? credential)? verificationCompleted,
    TResult Function(FirebaseAuthException error)? verificationFailed,
    TResult Function(String verificationId)? codeAutoRetrievalTimeout,
    TResult Function(String verificationId, int? forceResendingToken)? codeSent,
    TResult Function(String code)? enterCode,
    TResult Function(String code)? verifyOTP,
    TResult Function()? showError,
    TResult Function()? guestSignIn,
    required TResult orElse(),
  }) {
    if (guestSignIn != null) {
      return guestSignIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SelectCountryCode value) selectCountryCode,
    required TResult Function(EnteringPhoneNumber value) enteringPhoneNumber,
    required TResult Function(AuthenticatePhone value) authenticatePhone,
    required TResult Function(VerificationCompleted value)
        verificationCompleted,
    required TResult Function(VerificationFailed value) verificationFailed,
    required TResult Function(CodeAutoRetrievalTimeout value)
        codeAutoRetrievalTimeout,
    required TResult Function(CodeSent value) codeSent,
    required TResult Function(EnterCode value) enterCode,
    required TResult Function(VerifyOTP value) verifyOTP,
    required TResult Function(ShowError value) showError,
    required TResult Function(GuestSignIn value) guestSignIn,
  }) {
    return guestSignIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SelectCountryCode value)? selectCountryCode,
    TResult? Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult? Function(AuthenticatePhone value)? authenticatePhone,
    TResult? Function(VerificationCompleted value)? verificationCompleted,
    TResult? Function(VerificationFailed value)? verificationFailed,
    TResult? Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult? Function(CodeSent value)? codeSent,
    TResult? Function(EnterCode value)? enterCode,
    TResult? Function(VerifyOTP value)? verifyOTP,
    TResult? Function(ShowError value)? showError,
    TResult? Function(GuestSignIn value)? guestSignIn,
  }) {
    return guestSignIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SelectCountryCode value)? selectCountryCode,
    TResult Function(EnteringPhoneNumber value)? enteringPhoneNumber,
    TResult Function(AuthenticatePhone value)? authenticatePhone,
    TResult Function(VerificationCompleted value)? verificationCompleted,
    TResult Function(VerificationFailed value)? verificationFailed,
    TResult Function(CodeAutoRetrievalTimeout value)? codeAutoRetrievalTimeout,
    TResult Function(CodeSent value)? codeSent,
    TResult Function(EnterCode value)? enterCode,
    TResult Function(VerifyOTP value)? verifyOTP,
    TResult Function(ShowError value)? showError,
    TResult Function(GuestSignIn value)? guestSignIn,
    required TResult orElse(),
  }) {
    if (guestSignIn != null) {
      return guestSignIn(this);
    }
    return orElse();
  }
}

abstract class GuestSignIn implements SignInEvent {
  const factory GuestSignIn() = _$GuestSignInImpl;
}

/// @nodoc
mixin _$SignInState {
  PhoneNumber? get phoneNumber => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  FirebaseAuthException? get firebaseAuthException =>
      throw _privateConstructorUsedError;
  bool get codeSent => throw _privateConstructorUsedError;
  String? get smsCode => throw _privateConstructorUsedError;
  String? get verificationId => throw _privateConstructorUsedError;
  int? get resendToken => throw _privateConstructorUsedError;
  bool get codeAutoRetrievalTimeout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call(
      {PhoneNumber? phoneNumber,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      FirebaseAuthException? firebaseAuthException,
      bool codeSent,
      String? smsCode,
      String? verificationId,
      int? resendToken,
      bool codeAutoRetrievalTimeout});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
    Object? firebaseAuthException = freezed,
    Object? codeSent = null,
    Object? smsCode = freezed,
    Object? verificationId = freezed,
    Object? resendToken = freezed,
    Object? codeAutoRetrievalTimeout = null,
  }) {
    return _then(_value.copyWith(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, String>>,
      firebaseAuthException: freezed == firebaseAuthException
          ? _value.firebaseAuthException
          : firebaseAuthException // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      codeSent: null == codeSent
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      smsCode: freezed == smsCode
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: freezed == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      codeAutoRetrievalTimeout: null == codeAutoRetrievalTimeout
          ? _value.codeAutoRetrievalTimeout
          : codeAutoRetrievalTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PhoneNumber? phoneNumber,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<AuthFailure, String>> authFailureOrSuccessOption,
      FirebaseAuthException? firebaseAuthException,
      bool codeSent,
      String? smsCode,
      String? verificationId,
      int? resendToken,
      bool codeAutoRetrievalTimeout});
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? showErrorMessages = null,
    Object? isSubmitting = null,
    Object? authFailureOrSuccessOption = null,
    Object? firebaseAuthException = freezed,
    Object? codeSent = null,
    Object? smsCode = freezed,
    Object? verificationId = freezed,
    Object? resendToken = freezed,
    Object? codeAutoRetrievalTimeout = null,
  }) {
    return _then(_$SignInStateImpl(
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber?,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      authFailureOrSuccessOption: null == authFailureOrSuccessOption
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, String>>,
      firebaseAuthException: freezed == firebaseAuthException
          ? _value.firebaseAuthException
          : firebaseAuthException // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      codeSent: null == codeSent
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      smsCode: freezed == smsCode
          ? _value.smsCode
          : smsCode // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationId: freezed == verificationId
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String?,
      resendToken: freezed == resendToken
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      codeAutoRetrievalTimeout: null == codeAutoRetrievalTimeout
          ? _value.codeAutoRetrievalTimeout
          : codeAutoRetrievalTimeout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl implements _SignInState {
  _$SignInStateImpl(
      {required this.phoneNumber,
      required this.showErrorMessages,
      required this.isSubmitting,
      required this.authFailureOrSuccessOption,
      required this.firebaseAuthException,
      required this.codeSent,
      required this.smsCode,
      required this.verificationId,
      required this.resendToken,
      required this.codeAutoRetrievalTimeout});

  @override
  final PhoneNumber? phoneNumber;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<AuthFailure, String>> authFailureOrSuccessOption;
  @override
  final FirebaseAuthException? firebaseAuthException;
  @override
  final bool codeSent;
  @override
  final String? smsCode;
  @override
  final String? verificationId;
  @override
  final int? resendToken;
  @override
  final bool codeAutoRetrievalTimeout;

  @override
  String toString() {
    return 'SignInState(phoneNumber: $phoneNumber, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption, firebaseAuthException: $firebaseAuthException, codeSent: $codeSent, smsCode: $smsCode, verificationId: $verificationId, resendToken: $resendToken, codeAutoRetrievalTimeout: $codeAutoRetrievalTimeout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                other.authFailureOrSuccessOption ==
                    authFailureOrSuccessOption) &&
            (identical(other.firebaseAuthException, firebaseAuthException) ||
                other.firebaseAuthException == firebaseAuthException) &&
            (identical(other.codeSent, codeSent) ||
                other.codeSent == codeSent) &&
            (identical(other.smsCode, smsCode) || other.smsCode == smsCode) &&
            (identical(other.verificationId, verificationId) ||
                other.verificationId == verificationId) &&
            (identical(other.resendToken, resendToken) ||
                other.resendToken == resendToken) &&
            (identical(
                    other.codeAutoRetrievalTimeout, codeAutoRetrievalTimeout) ||
                other.codeAutoRetrievalTimeout == codeAutoRetrievalTimeout));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      phoneNumber,
      showErrorMessages,
      isSubmitting,
      authFailureOrSuccessOption,
      firebaseAuthException,
      codeSent,
      smsCode,
      verificationId,
      resendToken,
      codeAutoRetrievalTimeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  factory _SignInState(
      {required final PhoneNumber? phoneNumber,
      required final bool showErrorMessages,
      required final bool isSubmitting,
      required final Option<Either<AuthFailure, String>>
          authFailureOrSuccessOption,
      required final FirebaseAuthException? firebaseAuthException,
      required final bool codeSent,
      required final String? smsCode,
      required final String? verificationId,
      required final int? resendToken,
      required final bool codeAutoRetrievalTimeout}) = _$SignInStateImpl;

  @override
  PhoneNumber? get phoneNumber;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<AuthFailure, String>> get authFailureOrSuccessOption;
  @override
  FirebaseAuthException? get firebaseAuthException;
  @override
  bool get codeSent;
  @override
  String? get smsCode;
  @override
  String? get verificationId;
  @override
  int? get resendToken;
  @override
  bool get codeAutoRetrievalTimeout;
  @override
  @JsonKey(ignore: true)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
