// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$KYCDtoImpl _$$KYCDtoImplFromJson(Map<String, dynamic> json) => _$KYCDtoImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      aadharFront: json['aadharFront'] as String,
      aadharBack: json['aadharBack'] as String,
      panFront: json['panFront'] as String,
      panBack: json['panBack'] as String,
    );

Map<String, dynamic> _$$KYCDtoImplToJson(_$KYCDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'aadharFront': instance.aadharFront,
      'aadharBack': instance.aadharBack,
      'panFront': instance.panFront,
      'panBack': instance.panBack,
    };
