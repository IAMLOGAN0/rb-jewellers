import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_category.dart';

part 'product.freezed.dart';

@freezed
abstract class Product implements _$Product {
  const Product._();

  const factory Product({
    required String id,
    required ProductCategory productCategory,
    required String bannerUrl,
    required List<String> imageUrlList,
    required String title,
    required String price,
    required String description,
    required String createdAt,
  }) = _Product;

  factory Product.empty() => Product(
        id: '',
        productCategory: ProductCategory.empty(),
        bannerUrl: '',
        imageUrlList: [],
        title: '',
        price: '',
        description: '',
        createdAt: '',
      );
}
