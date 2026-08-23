// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductCategoryDtoImpl _$$ProductCategoryDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductCategoryDtoImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      categoryImageUrl: json['categoryImageUrl'] as String,
      sexCategory: json['sexCategory'] as String,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$$ProductCategoryDtoImplToJson(
        _$ProductCategoryDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'categoryImageUrl': instance.categoryImageUrl,
      'sexCategory': instance.sexCategory,
      'position': instance.position,
    };
