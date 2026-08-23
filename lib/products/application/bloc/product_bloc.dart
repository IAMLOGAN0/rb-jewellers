import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/products/domain/i_product_repository.dart';
import 'package:rb_jewellers/products/domain/product.dart';
import 'package:rb_jewellers/products/domain/product_category.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final IProductRepository productRepository;

  ProductBloc(this.productRepository) : super(ProductState.initial()) {
    on<_Search>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        searchQuery: event.query,
      ));
      final allCategories = state.allCategories;
      final allProducts = state.allProducts;

      // Convert the search query to lowercase for case-insensitive comparison
      final query = event.query.toLowerCase();

      // Filter the categories that match the search query
      final filteredCategories = allCategories.where((category) {
        final title = category.title
            .toLowerCase(); // Assuming 'title' is the searchable field
        return title.contains(query);
      }).toList();

      // Filter the products that match the search query
      final filteredProducts = allProducts.where((product) {
        final title = product.title
            .toLowerCase(); // Assuming 'title' is the searchable field
        return title.contains(query);
      }).toList();

      // Emit the updated state with the filtered search results and stop loading
      emit(state.copyWith(
        isLoading: false,
        categoriesSearchResult: filteredCategories,
        productsSearchResult: filteredProducts,
      ));
    });

    on<_GetProductCategories>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        productCategoryResponseFailureOrSuccessOption: none(),
      ));
      Either<AppFailures, List<ProductCategory>> failureOrSuccess;
      failureOrSuccess = await productRepository.getProductCatogories();

      Either<AppFailures, List<Product>> allProductsFailureOrSuccess;
      allProductsFailureOrSuccess = await productRepository.getAllProducts();

      List<ProductCategory>? allCategories;
      List<Product>? allProducts;
      List<ProductCategory> goldCategories = [];
      List<ProductCategory> silverCategories = [];
      List<ProductCategory> daimondCategories = [];

      failureOrSuccess.fold(
        (l) {
          allCategories = [];
        },
        (r) {
          allCategories = r;
          for (var productCategory in r) {
            print('category ${productCategory.sexCategory}');
            if (productCategory.sexCategory == 'Gold') {
              goldCategories.add(productCategory);
            } else if (productCategory.sexCategory == 'Silver') {
              silverCategories.add(productCategory);
              print("productCategory------${productCategory}");
            }else if (productCategory.sexCategory == "Diamond"){
              daimondCategories.add(productCategory);
            }
          }
        },
      );

      allProductsFailureOrSuccess.fold(
        (l) {
          allProducts = [];
        },
        (r) {
          allProducts = r;
        },
      );

      emit(state.copyWith(
        isLoading: false,
        allCategories: allCategories!,
        allProducts: allProducts!,
        goldCategories: goldCategories,
        silverCategories: silverCategories,
        daimondCategories: daimondCategories,
        productCategoryResponseFailureOrSuccessOption:
            optionOf(failureOrSuccess),
      ));
    });

    on<_GetProductsInCategory>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        productResponseFailureOrSuccessOption: none(),
      ));
      Either<AppFailures, List<Product>> failureOrSuccess;
      failureOrSuccess =
          await productRepository.getProductsInCategory(event.categoryId);

      // List<ProductCategory> mensCategories = [];
      // List<ProductCategory> womensCategories = [];

      // failureOrSuccess.fold(
      //   (l) {
      //     // Handle failure case if necessary
      //   },
      //   (r) {
      //     for (var productCategory in r) {
      //       if (productCategory.sexCategory == 'SILVER') {
      //         mensCategories.add(productCategory);
      //       } else if (productCategory.sexCategory == 'GOLD') {
      //         womensCategories.add(productCategory);
      //       }
      //     }
      //   },
      // );

      emit(state.copyWith(
        isLoading: false,
        // mensCategories: mensCategories,
        // womensCategories: womensCategories,
        productResponseFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });
  }
}
