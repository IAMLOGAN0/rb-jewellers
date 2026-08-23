// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_offline_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayOfflineDto _$PayOfflineDtoFromJson(Map<String, dynamic> json) {
  return _PayOfflineDto.fromJson(json);
}

/// @nodoc
mixin _$PayOfflineDto {
  String get id => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  String? get qty => throw _privateConstructorUsedError;
  String? get goldPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayOfflineDtoCopyWith<PayOfflineDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayOfflineDtoCopyWith<$Res> {
  factory $PayOfflineDtoCopyWith(
          PayOfflineDto value, $Res Function(PayOfflineDto) then) =
      _$PayOfflineDtoCopyWithImpl<$Res, PayOfflineDto>;
  @useResult
  $Res call(
      {String id,
      String planId,
      String planName,
      String userId,
      double amount,
      String createdAt,
      bool status,
      String? qty,
      String? goldPrice});
}

/// @nodoc
class _$PayOfflineDtoCopyWithImpl<$Res, $Val extends PayOfflineDto>
    implements $PayOfflineDtoCopyWith<$Res> {
  _$PayOfflineDtoCopyWithImpl(this._value, this._then);

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
    Object? status = null,
    Object? qty = freezed,
    Object? goldPrice = freezed,
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String?,
      goldPrice: freezed == goldPrice
          ? _value.goldPrice
          : goldPrice // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayOfflineDtoImplCopyWith<$Res>
    implements $PayOfflineDtoCopyWith<$Res> {
  factory _$$PayOfflineDtoImplCopyWith(
          _$PayOfflineDtoImpl value, $Res Function(_$PayOfflineDtoImpl) then) =
      __$$PayOfflineDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String planId,
      String planName,
      String userId,
      double amount,
      String createdAt,
      bool status,
      String? qty,
      String? goldPrice});
}

/// @nodoc
class __$$PayOfflineDtoImplCopyWithImpl<$Res>
    extends _$PayOfflineDtoCopyWithImpl<$Res, _$PayOfflineDtoImpl>
    implements _$$PayOfflineDtoImplCopyWith<$Res> {
  __$$PayOfflineDtoImplCopyWithImpl(
      _$PayOfflineDtoImpl _value, $Res Function(_$PayOfflineDtoImpl) _then)
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
    Object? status = null,
    Object? qty = freezed,
    Object? goldPrice = freezed,
  }) {
    return _then(_$PayOfflineDtoImpl(
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
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String?,
      goldPrice: freezed == goldPrice
          ? _value.goldPrice
          : goldPrice // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayOfflineDtoImpl extends _PayOfflineDto {
  const _$PayOfflineDtoImpl(
      {required this.id,
      required this.planId,
      required this.planName,
      required this.userId,
      required this.amount,
      required this.createdAt,
      required this.status,
      required this.qty,
      required this.goldPrice})
      : super._();

  factory _$PayOfflineDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayOfflineDtoImplFromJson(json);

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
  final bool status;
  @override
  final String? qty;
  @override
  final String? goldPrice;

  @override
  String toString() {
    return 'PayOfflineDto(id: $id, planId: $planId, planName: $planName, userId: $userId, amount: $amount, createdAt: $createdAt, status: $status, qty: $qty, goldPrice: $goldPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayOfflineDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.goldPrice, goldPrice) ||
                other.goldPrice == goldPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, planId, planName, userId,
      amount, createdAt, status, qty, goldPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PayOfflineDtoImplCopyWith<_$PayOfflineDtoImpl> get copyWith =>
      __$$PayOfflineDtoImplCopyWithImpl<_$PayOfflineDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayOfflineDtoImplToJson(
      this,
    );
  }
}

abstract class _PayOfflineDto extends PayOfflineDto {
  const factory _PayOfflineDto(
      {required final String id,
      required final String planId,
      required final String planName,
      required final String userId,
      required final double amount,
      required final String createdAt,
      required final bool status,
      required final String? qty,
      required final String? goldPrice}) = _$PayOfflineDtoImpl;
  const _PayOfflineDto._() : super._();

  factory _PayOfflineDto.fromJson(Map<String, dynamic> json) =
      _$PayOfflineDtoImpl.fromJson;

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
  bool get status;
  @override
  String? get qty;
  @override
  String? get goldPrice;
  @override
  @JsonKey(ignore: true)
  _$$PayOfflineDtoImplCopyWith<_$PayOfflineDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
