// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_price_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoldPriceDtoImpl _$$GoldPriceDtoImplFromJson(Map<String, dynamic> json) =>
    _$GoldPriceDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      title24: json['title24'] as String,
      title22: json['title22'] as String,
      title18: json['title18'] as String,
      price24: json['price24'] as String,
      price22: json['price22'] as String,
      price18: json['price18'] as String,
      makingChargesPercent: json['makingChargesPercent'] as String,
      gst: json['gst'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$GoldPriceDtoImplToJson(_$GoldPriceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'title24': instance.title24,
      'title22': instance.title22,
      'title18': instance.title18,
      'price24': instance.price24,
      'price22': instance.price22,
      'price18': instance.price18,
      'makingChargesPercent': instance.makingChargesPercent,
      'gst': instance.gst,
      'dateTime': instance.dateTime.toIso8601String(),
    };
