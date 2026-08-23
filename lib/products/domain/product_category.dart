import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';

@freezed
abstract class ProductCategory implements _$ProductCategory {
  const ProductCategory._();

  const factory ProductCategory({
    required String id,
    required String title,
    required String categoryImageUrl,
    required String description,
    required String sexCategory,
    required String? position,
  }) = _ProductCategory;

  factory ProductCategory.empty() =>
      const ProductCategory(
        id: '',
        title: '',
        categoryImageUrl: '',
        sexCategory: '',
        description: '',
        position: '',
      );
}
