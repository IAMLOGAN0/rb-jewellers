// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_offline_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PayOfflineDtoImpl _$$PayOfflineDtoImplFromJson(Map<String, dynamic> json) =>
    _$PayOfflineDtoImpl(
      id: json['id'] as String,
      planId: json['planId'] as String,
      planName: json['planName'] as String,
      userId: json['userId'] as String,
      amount: (json['amount'] as num).toDouble(),
      createdAt: json['createdAt'] as String,
      status: json['status'] as bool,
      qty: json['qty'] as String?,
      goldPrice: json['goldPrice'] as String?,
    );

Map<String, dynamic> _$$PayOfflineDtoImplToJson(_$PayOfflineDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'planName': instance.planName,
      'userId': instance.userId,
      'amount': instance.amount,
      'createdAt': instance.createdAt,
      'status': instance.status,
      'qty': instance.qty,
      'goldPrice': instance.goldPrice,
    };
