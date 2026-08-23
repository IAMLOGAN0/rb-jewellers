// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gold_booking_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoldBookingHistory {
  DateTime get transactionDate => throw _privateConstructorUsedError;
  double get bookedQty => throw _privateConstructorUsedError;
  double get goldRate => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoldBookingHistoryCopyWith<GoldBookingHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldBookingHistoryCopyWith<$Res> {
  factory $GoldBookingHistoryCopyWith(
          GoldBookingHistory value, $Res Function(GoldBookingHistory) then) =
      _$GoldBookingHistoryCopyWithImpl<$Res, GoldBookingHistory>;
  @useResult
  $Res call(
      {DateTime transactionDate,
      double bookedQty,
      double goldRate,
      double totalAmount,
      String status});
}

/// @nodoc
class _$GoldBookingHistoryCopyWithImpl<$Res, $Val extends GoldBookingHistory>
    implements $GoldBookingHistoryCopyWith<$Res> {
  _$GoldBookingHistoryCopyWithImpl(this._value, this._then);

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
abstract class _$$GoldBookingHistoryImplCopyWith<$Res>
    implements $GoldBookingHistoryCopyWith<$Res> {
  factory _$$GoldBookingHistoryImplCopyWith(_$GoldBookingHistoryImpl value,
          $Res Function(_$GoldBookingHistoryImpl) then) =
      __$$GoldBookingHistoryImplCopyWithImpl<$Res>;
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
class __$$GoldBookingHistoryImplCopyWithImpl<$Res>
    extends _$GoldBookingHistoryCopyWithImpl<$Res, _$GoldBookingHistoryImpl>
    implements _$$GoldBookingHistoryImplCopyWith<$Res> {
  __$$GoldBookingHistoryImplCopyWithImpl(_$GoldBookingHistoryImpl _value,
      $Res Function(_$GoldBookingHistoryImpl) _then)
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
    return _then(_$GoldBookingHistoryImpl(
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

class _$GoldBookingHistoryImpl extends _GoldBookingHistory {
  const _$GoldBookingHistoryImpl(
      {required this.transactionDate,
      required this.bookedQty,
      required this.goldRate,
      required this.totalAmount,
      required this.status})
      : super._();

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
    return 'GoldBookingHistory(transactionDate: $transactionDate, bookedQty: $bookedQty, goldRate: $goldRate, totalAmount: $totalAmount, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldBookingHistoryImpl &&
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

  @override
  int get hashCode => Object.hash(
      runtimeType, transactionDate, bookedQty, goldRate, totalAmount, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoldBookingHistoryImplCopyWith<_$GoldBookingHistoryImpl> get copyWith =>
      __$$GoldBookingHistoryImplCopyWithImpl<_$GoldBookingHistoryImpl>(
          this, _$identity);
}

abstract class _GoldBookingHistory extends GoldBookingHistory {
  const factory _GoldBookingHistory(
      {required final DateTime transactionDate,
      required final double bookedQty,
      required final double goldRate,
      required final double totalAmount,
      required final String status}) = _$GoldBookingHistoryImpl;
  const _GoldBookingHistory._() : super._();

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
  _$$GoldBookingHistoryImplCopyWith<_$GoldBookingHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
