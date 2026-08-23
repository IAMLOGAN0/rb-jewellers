import 'package:dartz/dartz.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/products/domain/product.dart';
import 'package:rb_jewellers/products/domain/product_category.dart';

abstract class IProductRepository {
  Future<Either<AppFailures, List<ProductCategory>>> getProductCatogories();
  Future<Either<AppFailures, List<Product>>> getAllProducts();
  Future<Either<AppFailures, List<Product>>> getProductsInCategory(
      String categoryId);
}
