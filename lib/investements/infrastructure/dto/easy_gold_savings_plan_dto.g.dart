// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'easy_gold_savings_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EasyGoldSavingsPlanDtoImpl _$$EasyGoldSavingsPlanDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$EasyGoldSavingsPlanDtoImpl(
      id: json['id'] as String,
      planId: json['planId'] as String,
      userId: json['userId'] as String,
      address: json['address'] as Map<String, dynamic>,
      name: json['name'] as String,
      contactNumber: json['contactNumber'] as String,
      whatsappNumber: json['whatsappNumber'] as String,
      emailAddress: json['emailAddress'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      dateOfAnniversary: json['dateOfAnniversary'] == null
          ? null
          : DateTime.parse(json['dateOfAnniversary'] as String),
      schemeType: json['schemeType'] as String,
      amount: (json['amount'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      nextInstallmentDate: json['nextInstallmentDate'] == null
          ? null
          : DateTime.parse(json['nextInstallmentDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
      adminComment: json['adminComment'] as String,
      noOfInstallmentsPaid: (json['noOfInstallmentsPaid'] as num).toInt(),
      balanceAmount: (json['balanceAmount'] as num).toDouble(),
      isTermsAndConditonsAccepted: json['isTermsAndConditonsAccepted'] as bool,
      transactionHistory: (json['transactionHistory'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$EasyGoldSavingsPlanDtoImplToJson(
        _$EasyGoldSavingsPlanDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'userId': instance.userId,
      'address': instance.address,
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'whatsappNumber': instance.whatsappNumber,
      'emailAddress': instance.emailAddress,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'dateOfAnniversary': instance.dateOfAnniversary?.toIso8601String(),
      'schemeType': instance.schemeType,
      'amount': instance.amount,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'nextInstallmentDate': instance.nextInstallmentDate?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'adminComment': instance.adminComment,
      'noOfInstallmentsPaid': instance.noOfInstallmentsPaid,
      'balanceAmount': instance.balanceAmount,
      'isTermsAndConditonsAccepted': instance.isTermsAndConditonsAccepted,
      'transactionHistory': instance.transactionHistory,
    };
