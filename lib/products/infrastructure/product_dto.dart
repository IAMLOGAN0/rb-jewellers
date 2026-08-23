import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/product.dart';
import 'product_category_dto.dart';

part 'product_dto.freezed.dart';

part 'product_dto.g.dart';

@freezed
abstract class ProductDto with _$ProductDto {
  const ProductDto._();

  const factory ProductDto({
    required String id,
    required Map productCategory,
    required String bannerUrl,
    required List<String> imageUrlList,
    required String title,
    required String price,
    required String description,
    required String createdAt,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  factory ProductDto.fromDomain(Product product) {
    return ProductDto(
      id: product.id,
      productCategory:
          ProductCategoryDto.fromDomain(product.productCategory).toJson(),
      bannerUrl: product.bannerUrl,
      imageUrlList: product.imageUrlList,
      title: product.title,
      price: product.price,
      description: product.description,
      createdAt: product.createdAt,
    );
  }

  factory ProductDto.fromFirestore(DocumentSnapshot doc) {
    // print("uuuid >> ${doc.id}");
    return ProductDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }

  Product toDomain() {
    return Product(
      id: id,
      productCategory: ProductCategoryDto.fromJson(
              Map<String, dynamic>.from(productCategory))
          .toDomain(),
      bannerUrl: bannerUrl,
      imageUrlList: imageUrlList,
      title: title,
      price: price,
      description: description,
      createdAt: createdAt,
    );

  }
}
