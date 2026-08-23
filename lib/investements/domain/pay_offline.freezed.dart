// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_offline.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PayOffline {
  String get id => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String? get qty => throw _privateConstructorUsedError;
  String? get goldPrice => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PayOfflineCopyWith<PayOffline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayOfflineCopyWith<$Res> {
  factory $PayOfflineCopyWith(
          PayOffline value, $Res Function(PayOffline) then) =
      _$PayOfflineCopyWithImpl<$Res, PayOffline>;
  @useResult
  $Res call(
      {String id,
      String planId,
      String planName,
      String userId,
      double amount,
      String createdAt,
      String? qty,
      String? goldPrice,
      bool status});
}

/// @nodoc
class _$PayOfflineCopyWithImpl<$Res, $Val extends PayOffline>
    implements $PayOfflineCopyWith<$Res> {
  _$PayOfflineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? planName = null,
    Object? userId = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? qty = freezed,
    Object? goldPrice = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String?,
      goldPrice: freezed == goldPrice
          ? _value.goldPrice
          : goldPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayOfflineImplCopyWith<$Res>
    implements $PayOfflineCopyWith<$Res> {
  factory _$$PayOfflineImplCopyWith(
          _$PayOfflineImpl value, $Res Function(_$PayOfflineImpl) then) =
      __$$PayOfflineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String planId,
      String planName,
      String userId,
      double amount,
      String createdAt,
      String? qty,
      String? goldPrice,
      bool status});
}

/// @nodoc
class __$$PayOfflineImplCopyWithImpl<$Res>
    extends _$PayOfflineCopyWithImpl<$Res, _$PayOfflineImpl>
    implements _$$PayOfflineImplCopyWith<$Res> {
  __$$PayOfflineImplCopyWithImpl(
      _$PayOfflineImpl _value, $Res Function(_$PayOfflineImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? planName = null,
    Object? userId = null,
    Object? amount = null,
    Object? createdAt = null,
    Object? qty = freezed,
    Object? goldPrice = freezed,
    Object? status = null,
  }) {
    return _then(_$PayOfflineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String?,
      goldPrice: freezed == goldPrice
          ? _value.goldPrice
          : goldPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PayOfflineImpl extends _PayOffline {
  const _$PayOfflineImpl(
      {required this.id,
      required this.planId,
      required this.planName,
      required this.userId,
      required this.amount,
      required this.createdAt,
      required this.qty,
      required this.goldPrice,
      required this.status})
      : super._();

  @override
  final String id;
  @override
  final String planId;
  @override
  final String planName;
  @override
  final String userId;
  @override
  final double amount;
  @override
  final String createdAt;
  @override
  final String? qty;
  @override
  final String? goldPrice;
  @override
  final bool status;

  @override
  String toString() {
    return 'PayOffline(id: $id, planId: $planId, planName: $planName, userId: $userId, amount: $amount, createdAt: $createdAt, qty: $qty, goldPrice: $goldPrice, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayOfflineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.goldPrice, goldPrice) ||
                other.goldPrice == goldPrice) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, planId, planName, userId,
      amount, createdAt, qty, goldPrice, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayOfflineImplCopyWith<_$PayOfflineImpl> get copyWith =>
      __$$PayOfflineImplCopyWithImpl<_$PayOfflineImpl>(this, _$identity);
}

abstract class _PayOffline extends PayOffline {
  const factory _PayOffline(
      {required final String id,
      required final String planId,
      required final String planName,
      required final String userId,
      required final double amount,
      required final String createdAt,
      required final String? qty,
      required final String? goldPrice,
      required final bool status}) = _$PayOfflineImpl;
  const _PayOffline._() : super._();

  @override
  String get id;
  @override
  String get planId;
  @override
  String get planName;
  @override
  String get userId;
  @override
  double get amount;
  @override
  String get createdAt;
  @override
  String? get qty;
  @override
  String? get goldPrice;
  @override
  bool get status;
  @override
  @JsonKey(ignore: true)
  _$$PayOfflineImplCopyWith<_$PayOfflineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
