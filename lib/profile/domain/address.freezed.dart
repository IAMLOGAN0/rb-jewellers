// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Address {
  String get locality => throw _privateConstructorUsedError;
  String get postOffice => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get landmark => throw _privateConstructorUsedError;
  String get policeStation => throw _privateConstructorUsedError;
  String get district => throw _privateConstructorUsedError;
  String get pin => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {String locality,
      String postOffice,
      String city,
      String landmark,
      String policeStation,
      String district,
      String pin});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locality = null,
    Object? postOffice = null,
    Object? city = null,
    Object? landmark = null,
    Object? policeStation = null,
    Object? district = null,
    Object? pin = null,
  }) {
    return _then(_value.copyWith(
      locality: null == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String,
      postOffice: null == postOffice
          ? _value.postOffice
          : postOffice // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      landmark: null == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String,
      policeStation: null == policeStation
          ? _value.policeStation
          : policeStation // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String locality,
      String postOffice,
      String city,
      String landmark,
      String policeStation,
      String district,
      String pin});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locality = null,
    Object? postOffice = null,
    Object? city = null,
    Object? landmark = null,
    Object? policeStation = null,
    Object? district = null,
    Object? pin = null,
  }) {
    return _then(_$AddressImpl(
      locality: null == locality
          ? _value.locality
          : locality // ignore: cast_nullable_to_non_nullable
              as String,
      postOffice: null == postOffice
          ? _value.postOffice
          : postOffice // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      landmark: null == landmark
          ? _value.landmark
          : landmark // ignore: cast_nullable_to_non_nullable
              as String,
      policeStation: null == policeStation
          ? _value.policeStation
          : policeStation // ignore: cast_nullable_to_non_nullable
              as String,
      district: null == district
          ? _value.district
          : district // ignore: cast_nullable_to_non_nullable
              as String,
      pin: null == pin
          ? _value.pin
          : pin // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddressImpl extends _Address {
  const _$AddressImpl(
      {required this.locality,
      required this.postOffice,
      required this.city,
      required this.landmark,
      required this.policeStation,
      required this.district,
      required this.pin})
      : super._();

  @override
  final String locality;
  @override
  final String postOffice;
  @override
  final String city;
  @override
  final String landmark;
  @override
  final String policeStation;
  @override
  final String district;
  @override
  final String pin;

  @override
  String toString() {
    return 'Address(locality: $locality, postOffice: $postOffice, city: $city, landmark: $landmark, policeStation: $policeStation, district: $district, pin: $pin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.locality, locality) ||
                other.locality == locality) &&
            (identical(other.postOffice, postOffice) ||
                other.postOffice == postOffice) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.landmark, landmark) ||
                other.landmark == landmark) &&
            (identical(other.policeStation, policeStation) ||
                other.policeStation == policeStation) &&
            (identical(other.district, district) ||
                other.district == district) &&
            (identical(other.pin, pin) || other.pin == pin));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locality, postOffice, city,
      landmark, policeStation, district, pin);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);
}

abstract class _Address extends Address {
  const factory _Address(
      {required final String locality,
      required final String postOffice,
      required final String city,
      required final String landmark,
      required final String policeStation,
      required final String district,
      required final String pin}) = _$AddressImpl;
  const _Address._() : super._();

  @override
  String get locality;
  @override
  String get postOffice;
  @override
  String get city;
  @override
  String get landmark;
  @override
  String get policeStation;
  @override
  String get district;
  @override
  String get pin;
  @override
  @JsonKey(ignore: true)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
