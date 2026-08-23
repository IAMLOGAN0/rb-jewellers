// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Profile {
  UniqueId get id => throw _privateConstructorUsedError;
  Name get name =>
      throw _privateConstructorUsedError; // required EmailAddress email,
  DateTime get dateOfBirth => throw _privateConstructorUsedError;
  String get mariatialStatus => throw _privateConstructorUsedError;
  DateTime? get anniversaryDate => throw _privateConstructorUsedError;
  String get location =>
      throw _privateConstructorUsedError; // required Address address,
  PhoneNumber get phoneNumber => throw _privateConstructorUsedError;
  String get couponCode => throw _privateConstructorUsedError;
  bool get couponRedeemed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {UniqueId id,
      Name name,
      DateTime dateOfBirth,
      String mariatialStatus,
      DateTime? anniversaryDate,
      String location,
      PhoneNumber phoneNumber,
      String couponCode,
      bool couponRedeemed});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? mariatialStatus = null,
    Object? anniversaryDate = freezed,
    Object? location = null,
    Object? phoneNumber = null,
    Object? couponCode = null,
    Object? couponRedeemed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mariatialStatus: null == mariatialStatus
          ? _value.mariatialStatus
          : mariatialStatus // ignore: cast_nullable_to_non_nullable
              as String,
      anniversaryDate: freezed == anniversaryDate
          ? _value.anniversaryDate
          : anniversaryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      couponRedeemed: null == couponRedeemed
          ? _value.couponRedeemed
          : couponRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      Name name,
      DateTime dateOfBirth,
      String mariatialStatus,
      DateTime? anniversaryDate,
      String location,
      PhoneNumber phoneNumber,
      String couponCode,
      bool couponRedeemed});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? dateOfBirth = null,
    Object? mariatialStatus = null,
    Object? anniversaryDate = freezed,
    Object? location = null,
    Object? phoneNumber = null,
    Object? couponCode = null,
    Object? couponRedeemed = null,
  }) {
    return _then(_$ProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      dateOfBirth: null == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime,
      mariatialStatus: null == mariatialStatus
          ? _value.mariatialStatus
          : mariatialStatus // ignore: cast_nullable_to_non_nullable
              as String,
      anniversaryDate: freezed == anniversaryDate
          ? _value.anniversaryDate
          : anniversaryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      couponCode: null == couponCode
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String,
      couponRedeemed: null == couponRedeemed
          ? _value.couponRedeemed
          : couponRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ProfileImpl extends _Profile {
  const _$ProfileImpl(
      {required this.id,
      required this.name,
      required this.dateOfBirth,
      required this.mariatialStatus,
      required this.anniversaryDate,
      required this.location,
      required this.phoneNumber,
      required this.couponCode,
      required this.couponRedeemed})
      : super._();

  @override
  final UniqueId id;
  @override
  final Name name;
// required EmailAddress email,
  @override
  final DateTime dateOfBirth;
  @override
  final String mariatialStatus;
  @override
  final DateTime? anniversaryDate;
  @override
  final String location;
// required Address address,
  @override
  final PhoneNumber phoneNumber;
  @override
  final String couponCode;
  @override
  final bool couponRedeemed;

  @override
  String toString() {
    return 'Profile(id: $id, name: $name, dateOfBirth: $dateOfBirth, mariatialStatus: $mariatialStatus, anniversaryDate: $anniversaryDate, location: $location, phoneNumber: $phoneNumber, couponCode: $couponCode, couponRedeemed: $couponRedeemed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.mariatialStatus, mariatialStatus) ||
                other.mariatialStatus == mariatialStatus) &&
            (identical(other.anniversaryDate, anniversaryDate) ||
                other.anniversaryDate == anniversaryDate) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.couponRedeemed, couponRedeemed) ||
                other.couponRedeemed == couponRedeemed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      dateOfBirth,
      mariatialStatus,
      anniversaryDate,
      location,
      phoneNumber,
      couponCode,
      couponRedeemed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);
}

abstract class _Profile extends Profile {
  const factory _Profile(
      {required final UniqueId id,
      required final Name name,
      required final DateTime dateOfBirth,
      required final String mariatialStatus,
      required final DateTime? anniversaryDate,
      required final String location,
      required final PhoneNumber phoneNumber,
      required final String couponCode,
      required final bool couponRedeemed}) = _$ProfileImpl;
  const _Profile._() : super._();

  @override
  UniqueId get id;
  @override
  Name get name;
  @override // required EmailAddress email,
  DateTime get dateOfBirth;
  @override
  String get mariatialStatus;
  @override
  DateTime? get anniversaryDate;
  @override
  String get location;
  @override // required Address address,
  PhoneNumber get phoneNumber;
  @override
  String get couponCode;
  @override
  bool get couponRedeemed;
  @override
  @JsonKey(ignore: true)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
