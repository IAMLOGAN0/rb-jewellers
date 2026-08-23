// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'future_gold_savings_plan_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FutureGoldSavingsPlanDtoImpl _$$FutureGoldSavingsPlanDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$FutureGoldSavingsPlanDtoImpl(
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
      amountPaid: (json['amountPaid'] as num).toDouble(),
      balanceAmount: (json['balanceAmount'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      goldBookingStatus: json['goldBookingStatus'] as bool,
      status: json['status'] as String,
      adminComment: json['adminComment'] as String,
      isGoldPriceBooked: json['isGoldPriceBooked'] as bool,
      goldQuantityBooked: (json['goldQuantityBooked'] as num).toDouble(),
      totalPriceForBookedQty:
          (json['totalPriceForBookedQty'] as num).toDouble(),
      goldPrice: json['goldPrice'] as Map<String, dynamic>,
      noOfInstallmentsPaid: (json['noOfInstallmentsPaid'] as num).toInt(),
      isTermsAndConditonsAccepted: json['isTermsAndConditonsAccepted'] as bool,
      transactionHistory: (json['transactionHistory'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      goldBookingHistory: (json['goldBookingHistory'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$FutureGoldSavingsPlanDtoImplToJson(
        _$FutureGoldSavingsPlanDtoImpl instance) =>
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
      'amountPaid': instance.amountPaid,
      'balanceAmount': instance.balanceAmount,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'goldBookingStatus': instance.goldBookingStatus,
      'status': instance.status,
      'adminComment': instance.adminComment,
      'isGoldPriceBooked': instance.isGoldPriceBooked,
      'goldQuantityBooked': instance.goldQuantityBooked,
      'totalPriceForBookedQty': instance.totalPriceForBookedQty,
      'goldPrice': instance.goldPrice,
      'noOfInstallmentsPaid': instance.noOfInstallmentsPaid,
      'isTermsAndConditonsAccepted': instance.isTermsAndConditonsAccepted,
      'transactionHistory': instance.transactionHistory,
      'goldBookingHistory': instance.goldBookingHistory,
    };
