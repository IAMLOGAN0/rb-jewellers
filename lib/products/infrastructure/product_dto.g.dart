// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductDtoImpl _$$ProductDtoImplFromJson(Map<String, dynamic> json) =>
    _$ProductDtoImpl(
      id: json['id'] as String,
      productCategory: json['productCategory'] as Map<String, dynamic>,
      bannerUrl: json['bannerUrl'] as String,
      imageUrlList: (json['imageUrlList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      title: json['title'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      createdAt: json['createdAt'] as String,
    );

Map<String, dynamic> _$$ProductDtoImplToJson(_$ProductDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productCategory': instance.productCategory,
      'bannerUrl': instance.bannerUrl,
      'imageUrlList': instance.imageUrlList,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'createdAt': instance.createdAt,
    };
