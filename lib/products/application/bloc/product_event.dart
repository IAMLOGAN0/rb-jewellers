part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.getProductCategories() = _GetProductCategories;
  const factory ProductEvent.getProductsInCategory(String categoryId) =_GetProductsInCategory;
  const factory ProductEvent.search(String query) = _Search;
}
