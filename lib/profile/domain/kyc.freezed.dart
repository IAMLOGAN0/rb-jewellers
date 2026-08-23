// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$KYC {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get aadharFront => throw _privateConstructorUsedError;
  String get aadharBack => throw _privateConstructorUsedError;
  String get panFront => throw _privateConstructorUsedError;
  String get panBack => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KYCCopyWith<KYC> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KYCCopyWith<$Res> {
  factory $KYCCopyWith(KYC value, $Res Function(KYC) then) =
      _$KYCCopyWithImpl<$Res, KYC>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String aadharFront,
      String aadharBack,
      String panFront,
      String panBack});
}

/// @nodoc
class _$KYCCopyWithImpl<$Res, $Val extends KYC> implements $KYCCopyWith<$Res> {
  _$KYCCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? aadharFront = null,
    Object? aadharBack = null,
    Object? panFront = null,
    Object? panBack = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      aadharFront: null == aadharFront
          ? _value.aadharFront
          : aadharFront // ignore: cast_nullable_to_non_nullable
              as String,
      aadharBack: null == aadharBack
          ? _value.aadharBack
          : aadharBack // ignore: cast_nullable_to_non_nullable
              as String,
      panFront: null == panFront
          ? _value.panFront
          : panFront // ignore: cast_nullable_to_non_nullable
              as String,
      panBack: null == panBack
          ? _value.panBack
          : panBack // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KYCImplCopyWith<$Res> implements $KYCCopyWith<$Res> {
  factory _$$KYCImplCopyWith(_$KYCImpl value, $Res Function(_$KYCImpl) then) =
      __$$KYCImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String aadharFront,
      String aadharBack,
      String panFront,
      String panBack});
}

/// @nodoc
class __$$KYCImplCopyWithImpl<$Res> extends _$KYCCopyWithImpl<$Res, _$KYCImpl>
    implements _$$KYCImplCopyWith<$Res> {
  __$$KYCImplCopyWithImpl(_$KYCImpl _value, $Res Function(_$KYCImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? aadharFront = null,
    Object? aadharBack = null,
    Object? panFront = null,
    Object? panBack = null,
  }) {
    return _then(_$KYCImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      aadharFront: null == aadharFront
          ? _value.aadharFront
          : aadharFront // ignore: cast_nullable_to_non_nullable
              as String,
      aadharBack: null == aadharBack
          ? _value.aadharBack
          : aadharBack // ignore: cast_nullable_to_non_nullable
              as String,
      panFront: null == panFront
          ? _value.panFront
          : panFront // ignore: cast_nullable_to_non_nullable
              as String,
      panBack: null == panBack
          ? _value.panBack
          : panBack // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$KYCImpl extends _KYC {
  const _$KYCImpl(
      {required this.id,
      required this.userId,
      required this.aadharFront,
      required this.aadharBack,
      required this.panFront,
      required this.panBack})
      : super._();

  @override
  final String id;
  @override
  final String userId;
  @override
  final String aadharFront;
  @override
  final String aadharBack;
  @override
  final String panFront;
  @override
  final String panBack;

  @override
  String toString() {
    return 'KYC(id: $id, userId: $userId, aadharFront: $aadharFront, aadharBack: $aadharBack, panFront: $panFront, panBack: $panBack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KYCImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.aadharFront, aadharFront) ||
                other.aadharFront == aadharFront) &&
            (identical(other.aadharBack, aadharBack) ||
                other.aadharBack == aadharBack) &&
            (identical(other.panFront, panFront) ||
                other.panFront == panFront) &&
            (identical(other.panBack, panBack) || other.panBack == panBack));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, aadharFront, aadharBack, panFront, panBack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KYCImplCopyWith<_$KYCImpl> get copyWith =>
      __$$KYCImplCopyWithImpl<_$KYCImpl>(this, _$identity);
}

abstract class _KYC extends KYC {
  const factory _KYC(
      {required final String id,
      required final String userId,
      required final String aadharFront,
      required final String aadharBack,
      required final String panFront,
      required final String panBack}) = _$KYCImpl;
  const _KYC._() : super._();

  @override
  String get id;
  @override
  String get userId;
  @override
  String get aadharFront;
  @override
  String get aadharBack;
  @override
  String get panFront;
  @override
  String get panBack;
  @override
  @JsonKey(ignore: true)
  _$$KYCImplCopyWith<_$KYCImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
