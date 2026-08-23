// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressDtoImpl _$$AddressDtoImplFromJson(Map<String, dynamic> json) =>
    _$AddressDtoImpl(
      locality: json['locality'] as String,
      postOffice: json['postOffice'] as String,
      city: json['city'] as String,
      landmark: json['landmark'] as String,
      policeStation: json['policeStation'] as String,
      district: json['district'] as String,
      pin: json['pin'] as String,
    );

Map<String, dynamic> _$$AddressDtoImplToJson(_$AddressDtoImpl instance) =>
    <String, dynamic>{
      'locality': instance.locality,
      'postOffice': instance.postOffice,
      'city': instance.city,
      'landmark': instance.landmark,
      'policeStation': instance.policeStation,
      'district': instance.district,
      'pin': instance.pin,
    };
