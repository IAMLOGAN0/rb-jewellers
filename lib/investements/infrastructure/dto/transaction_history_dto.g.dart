// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_history_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionHistoryDtoImpl _$$TransactionHistoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionHistoryDtoImpl(
      transactionId: json['transactionId'] as String,
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      amount: (json['amount'] as num).toDouble(),
      goldPrice: (json['goldPrice'] as num?)?.toDouble(),
      noOfInstallment: (json['noOfInstallment'] as num?)?.toDouble(),
      qty: (json['qty'] as num?)?.toDouble(),
      balanceAmount: (json['balanceAmount'] as num?)?.toDouble(),
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      installmentPaying: (json['installmentPaying'] as num?)?.toInt(),
      paymentMethod: json['paymentMethod'] as String,
      transactionType: json['transactionType'] as String,
      status: json['status'] as String,
      description: json['description'] as String?,
      userId: json['userId'] as String?,
      planId: json['planId'] as String,
    );

Map<String, dynamic> _$$TransactionHistoryDtoImplToJson(
        _$TransactionHistoryDtoImpl instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'transactionDate': instance.transactionDate.toIso8601String(),
      'amount': instance.amount,
      'goldPrice': instance.goldPrice,
      'noOfInstallment': instance.noOfInstallment,
      'qty': instance.qty,
      'balanceAmount': instance.balanceAmount,
      'totalAmount': instance.totalAmount,
      'installmentPaying': instance.installmentPaying,
      'paymentMethod': instance.paymentMethod,
      'transactionType': instance.transactionType,
      'status': instance.status,
      'description': instance.description,
      'userId': instance.userId,
      'planId': instance.planId,
    };
