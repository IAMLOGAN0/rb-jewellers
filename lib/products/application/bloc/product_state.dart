part of 'product_bloc.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState({
    required bool isLoading,
    required String searchQuery,
    required List<ProductCategory> allCategories,
    required List<Product> allProducts,
    required List<ProductCategory> goldCategories,
    required List<ProductCategory> silverCategories,
    required List<ProductCategory> daimondCategories,
    required List<ProductCategory> categoriesSearchResult,
    required List<Product> productsSearchResult,
    required Option<Either<AppFailures, List<ProductCategory>>>
        productCategoryResponseFailureOrSuccessOption,
    required Option<Either<AppFailures, List<Product>>>
        productResponseFailureOrSuccessOption,
  }) = _ProductState;

  factory ProductState.initial() => ProductState(
        isLoading: false,
        searchQuery: '',
        allProducts: [],
        allCategories: [],
        goldCategories: [],
        silverCategories: [],
        daimondCategories: [],
        categoriesSearchResult: [],
        productsSearchResult: [],
        productResponseFailureOrSuccessOption: none(),
        productCategoryResponseFailureOrSuccessOption: none(),
      );
}
