import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/product_category.dart';

part 'product_category_dto.freezed.dart';
part 'product_category_dto.g.dart';

@freezed
abstract class ProductCategoryDto with _$ProductCategoryDto {
  const ProductCategoryDto._();

  const factory ProductCategoryDto({
    required String id,
    required String title,
    required String description,
    required String categoryImageUrl,
    required String sexCategory,
    required String? position,
  }) = _ProductCategoryDto;

  factory ProductCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryDtoFromJson(json);

  factory ProductCategoryDto.fromDomain(ProductCategory category) {
    return ProductCategoryDto(
      id: category.id,
      title: category.title,
      description: category.description,
      categoryImageUrl: category.categoryImageUrl,
      sexCategory: category.sexCategory,
      position: category.position,
    );
  }

  factory ProductCategoryDto.fromFirestore(DocumentSnapshot doc) {
    return ProductCategoryDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }

  ProductCategory toDomain() {
    return ProductCategory(
      id: id,
      title: title,
      description: description,
      categoryImageUrl: categoryImageUrl,
      sexCategory: sexCategory,
      position: position,
    );
  }
}
