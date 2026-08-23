// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold_booking_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GoldBookingHistoryDto _$GoldBookingHistoryDtoFromJson(
    Map<String, dynamic> json) {
  return _GoldBookingHistoryDto.fromJson(json);
}

/// @nodoc
mixin _$GoldBookingHistoryDto {
  DateTime get transactionDate => throw _privateConstructorUsedError;
  double get bookedQty => throw _privateConstructorUsedError;
  double get goldRate => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoldBookingHistoryDtoCopyWith<GoldBookingHistoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldBookingHistoryDtoCopyWith<$Res> {
  factory $GoldBookingHistoryDtoCopyWith(GoldBookingHistoryDto value,
          $Res Function(GoldBookingHistoryDto) then) =
      _$GoldBookingHistoryDtoCopyWithImpl<$Res, GoldBookingHistoryDto>;
  @useResult
  $Res call(
      {DateTime transactionDate,
      double bookedQty,
      double goldRate,
      double totalAmount,
      String status});
}

/// @nodoc
class _$GoldBookingHistoryDtoCopyWithImpl<$Res,
        $Val extends GoldBookingHistoryDto>
    implements $GoldBookingHistoryDtoCopyWith<$Res> {
  _$GoldBookingHistoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? bookedQty = null,
    Object? goldRate = null,
    Object? totalAmount = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookedQty: null == bookedQty
          ? _value.bookedQty
          : bookedQty // ignore: cast_nullable_to_non_nullable
              as double,
      goldRate: null == goldRate
          ? _value.goldRate
          : goldRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GoldBookingHistoryDtoImplCopyWith<$Res>
    implements $GoldBookingHistoryDtoCopyWith<$Res> {
  factory _$$GoldBookingHistoryDtoImplCopyWith(
          _$GoldBookingHistoryDtoImpl value,
          $Res Function(_$GoldBookingHistoryDtoImpl) then) =
      __$$GoldBookingHistoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime transactionDate,
      double bookedQty,
      double goldRate,
      double totalAmount,
      String status});
}

/// @nodoc
class __$$GoldBookingHistoryDtoImplCopyWithImpl<$Res>
    extends _$GoldBookingHistoryDtoCopyWithImpl<$Res,
        _$GoldBookingHistoryDtoImpl>
    implements _$$GoldBookingHistoryDtoImplCopyWith<$Res> {
  __$$GoldBookingHistoryDtoImplCopyWithImpl(_$GoldBookingHistoryDtoImpl _value,
      $Res Function(_$GoldBookingHistoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? bookedQty = null,
    Object? goldRate = null,
    Object? totalAmount = null,
    Object? status = null,
  }) {
    return _then(_$GoldBookingHistoryDtoImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      bookedQty: null == bookedQty
          ? _value.bookedQty
          : bookedQty // ignore: cast_nullable_to_non_nullable
              as double,
      goldRate: null == goldRate
          ? _value.goldRate
          : goldRate // ignore: cast_nullable_to_non_nullable
              as double,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GoldBookingHistoryDtoImpl extends _GoldBookingHistoryDto {
  const _$GoldBookingHistoryDtoImpl(
      {required this.transactionDate,
      required this.bookedQty,
      required this.goldRate,
      required this.totalAmount,
      required this.status})
      : super._();

  factory _$GoldBookingHistoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoldBookingHistoryDtoImplFromJson(json);

  @override
  final DateTime transactionDate;
  @override
  final double bookedQty;
  @override
  final double goldRate;
  @override
  final double totalAmount;
  @override
  final String status;

  @override
  String toString() {
    return 'GoldBookingHistoryDto(transactionDate: $transactionDate, bookedQty: $bookedQty, goldRate: $goldRate, totalAmount: $totalAmount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldBookingHistoryDtoImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.bookedQty, bookedQty) ||
                other.bookedQty == bookedQty) &&
            (identical(other.goldRate, goldRate) ||
                other.goldRate == goldRate) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, transactionDate, bookedQty, goldRate, totalAmount, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoldBookingHistoryDtoImplCopyWith<_$GoldBookingHistoryDtoImpl>
      get copyWith => __$$GoldBookingHistoryDtoImplCopyWithImpl<
          _$GoldBookingHistoryDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoldBookingHistoryDtoImplToJson(
      this,
    );
  }
}

abstract class _GoldBookingHistoryDto extends GoldBookingHistoryDto {
  const factory _GoldBookingHistoryDto(
      {required final DateTime transactionDate,
      required final double bookedQty,
      required final double goldRate,
      required final double totalAmount,
      required final String status}) = _$GoldBookingHistoryDtoImpl;
  const _GoldBookingHistoryDto._() : super._();

  factory _GoldBookingHistoryDto.fromJson(Map<String, dynamic> json) =
      _$GoldBookingHistoryDtoImpl.fromJson;

  @override
  DateTime get transactionDate;
  @override
  double get bookedQty;
  @override
  double get goldRate;
  @override
  double get totalAmount;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$GoldBookingHistoryDtoImplCopyWith<_$GoldBookingHistoryDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
