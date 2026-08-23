// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileDtoImpl _$$ProfileDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDtoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      mariatialStatus: json['mariatialStatus'] as String,
      anniversaryDate: json['anniversaryDate'] == null
          ? null
          : DateTime.parse(json['anniversaryDate'] as String),
      location: json['location'] as String,
      phoneNumber: json['phoneNumber'] as String,
      couponCode: json['couponCode'] as String,
      couponRedeemed: json['couponRedeemed'] as bool,
    );

Map<String, dynamic> _$$ProfileDtoImplToJson(_$ProfileDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'mariatialStatus': instance.mariatialStatus,
      'anniversaryDate': instance.anniversaryDate?.toIso8601String(),
      'location': instance.location,
      'phoneNumber': instance.phoneNumber,
      'couponCode': instance.couponCode,
      'couponRedeemed': instance.couponRedeemed,
    };
