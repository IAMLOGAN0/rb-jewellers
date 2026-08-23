// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'golden_secure_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoldenSecureDtoImpl _$$GoldenSecureDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$GoldenSecureDtoImpl(
      id: json['id'] as String,
      planId: json['planId'] as String,
      userId: json['userId'] as String,
      address: json['address'] as Map<String, dynamic>,
      name: json['name'] as String,
      contactNumber: json['contactNumber'] as String,
      whatsappNumber: json['whatsappNumber'] as String,
      emailAddress: json['emailAddress'] as String?,
      dateOfBirth: json['dateOfBirth'] == null
          ? null
          : DateTime.parse(json['dateOfBirth'] as String),
      dateOfAnniversary: json['dateOfAnniversary'] == null
          ? null
          : DateTime.parse(json['dateOfAnniversary'] as String),
      schemeType: json['schemeType'] as String,
      noOfInstallment: (json['noOfInstallment'] as num).toInt(),
      totalBookedGold: (json['totalBookedGold'] as num).toDouble(),
      totalBookingAmount: (json['totalBookingAmount'] as num).toDouble(),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
      adminComment: json['adminComment'] as String,
      isTermsAndConditonsAccepted: json['isTermsAndConditonsAccepted'] as bool,
      transactionHistory: (json['transactionHistory'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      goldBookingHistory: (json['goldBookingHistory'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$$GoldenSecureDtoImplToJson(
        _$GoldenSecureDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'userId': instance.userId,
      'address': instance.address,
      'name': instance.name,
      'contactNumber': instance.contactNumber,
      'whatsappNumber': instance.whatsappNumber,
      'emailAddress': instance.emailAddress,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
      'dateOfAnniversary': instance.dateOfAnniversary?.toIso8601String(),
      'schemeType': instance.schemeType,
      'noOfInstallment': instance.noOfInstallment,
      'totalBookedGold': instance.totalBookedGold,
      'totalBookingAmount': instance.totalBookingAmount,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
      'adminComment': instance.adminComment,
      'isTermsAndConditonsAccepted': instance.isTermsAndConditonsAccepted,
      'transactionHistory': instance.transactionHistory,
      'goldBookingHistory': instance.goldBookingHistory,
    };
