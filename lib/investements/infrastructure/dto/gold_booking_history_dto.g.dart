// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_booking_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoldBookingHistoryDtoImpl _$$GoldBookingHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GoldBookingHistoryDtoImpl(
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      bookedQty: (json['bookedQty'] as num).toDouble(),
      goldRate: (json['goldRate'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$$GoldBookingHistoryDtoImplToJson(
        _$GoldBookingHistoryDtoImpl instance) =>
    <String, dynamic>{
      'transactionDate': instance.transactionDate.toIso8601String(),
      'bookedQty': instance.bookedQty,
      'goldRate': instance.goldRate,
      'totalAmount': instance.totalAmount,
      'status': instance.status,
    };
