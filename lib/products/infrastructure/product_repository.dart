import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/products/domain/product.dart';
import 'package:rb_jewellers/products/domain/product_category.dart';
import 'package:rb_jewellers/products/infrastructure/product_dto.dart';
import 'package:rb_jewellers/products/infrastructure/product_category_dto.dart';

import '../domain/i_product_repository.dart';

class ProductRepository implements IProductRepository {
  final CollectionReference _productCategories =
      FirebaseFirestore.instance.collection('product_categories');

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');

  @override
  Future<Either<AppFailures, List<Product>>> getProductsInCategory(
      String categoryId) async {
    // try {
    final QuerySnapshot snapshot = await _products
        .where('productCategory.id', isEqualTo: categoryId)
        .get();

    // Convert the query results to Product objects
    final List<Product> products = snapshot.docs.map((doc) {
      final productDto = ProductDto.fromFirestore(doc);
      return productDto.toDomain();
    }).toList();

    return right(products);
    // } catch (e) {
    //   return handleException(e);
    // }
  }

  @override
  Future<Either<AppFailures, List<ProductCategory>>>
      getProductCatogories() async {
    try {
      final QuerySnapshot snapshot = await _productCategories.get();

      // print('position >> ${snapshot.docs}');
      // Convert the query results to ProductCategory objects
      List<ProductCategory> categories = snapshot.docs.map((doc) {
        final categoryDto = ProductCategoryDto.fromFirestore(doc);
        return categoryDto.toDomain();
      }).toList();

      // print('position 1 >> ${categories[0].position.toString()}');
      categories = List<ProductCategory>.from(categories)
        ..sort((a, b) => int.parse(a.position.toString())
            .compareTo(int.parse(b.position.toString())));
      return right(categories);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, List<Product>>> getAllProducts() async {
    try {
      final QuerySnapshot snapshot = await _products.get();

      // print('snapshot ${snapshot.size}');
      final List<Product> products = snapshot.docs.map((doc) {
        final productDto = ProductDto.fromFirestore(doc);

        // print("Loaded product: ${productDto.title}, uuid: ${productDto.uuid}");
        // final product = productDto.toDomain();

        // Inject the UUID manually if your Product model allows it
        // print("uuid >> ${doc.id}");
        // print('doc $doc');
        // return product.copyWith(uuid: doc.id);
        // print('doc $doc');
        return productDto.toDomain();
      }).toList();

      products.sort((a, b) {
        DateTime dateA = DateTime.parse(a.createdAt.toString());
        DateTime dateB = DateTime.parse(b.createdAt.toString());
        return dateB.compareTo(dateA); // newest first
      });

      // print('products $products');
      return right(products);
    } catch (e) {
      print('Exception >> $e');
      return handleException(e);
    }
  }

  // Create a new product category and upload the image
  Future<Either<AppFailures, Unit>> createProductCategory(
      File categoryImage, ProductCategory productCategory) async {
    try {
      // Generate a unique ID for the Product Category document
      final categoryId = _productCategories.doc().id;

      // Upload the category image to Firestore Storage
      final Reference storageRef =
          FirebaseStorage.instance.ref().child('categories/$categoryId.jpg');
      final UploadTask uploadTask = storageRef.putFile(categoryImage);
      final TaskSnapshot storageSnapshot = await uploadTask;

      // Get the download URL of the uploaded image
      final String categoryImageUrl =
          await storageSnapshot.ref.getDownloadURL();

      // Create ProductCategory DTO and save to Firestore
      final categoryDto = ProductCategoryDto.fromDomain(productCategory)
          .copyWith(categoryImageUrl: categoryImageUrl);
      await _productCategories.doc(categoryId).set(categoryDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  Future<Either<AppFailures, Unit>> createProduct({
    required File productImage, // Optional, for bannerUrl
    required List<File>? productImages, // Optional, for imageUrlList
    required Product product,
  }) async {
    // try {
    // Validate if the category exists
    final categorySnapshot =
        await _productCategories.doc(product.productCategory.id).get();
    if (!categorySnapshot.exists) {
      return left(const AppFailures.failureWithMessage('Category not exists'));
    }

    // Generate a unique ID for the Product document
    final productId = _products.doc().id;

    String? bannerUrl;
    List<String> imageUrlList = [];

    // Upload banner image (if available)
    final Reference storageRef =
        FirebaseStorage.instance.ref().child('products/$productId/banner.jpg');
    final UploadTask uploadTask = storageRef.putFile(productImage);
    final TaskSnapshot storageSnapshot = await uploadTask;
    bannerUrl = await storageSnapshot.ref.getDownloadURL();

    // Upload additional product images (if available)
    if (productImages != null && productImages.isNotEmpty) {
      for (var i = 0; i < productImages.length; i++) {
        final Reference storageRef = FirebaseStorage.instance
            .ref()
            .child('products/$productId/image_$i.jpg');
        final UploadTask uploadTask = storageRef.putFile(productImages[i]);
        final TaskSnapshot storageSnapshot = await uploadTask;
        final String imageUrl = await storageSnapshot.ref.getDownloadURL();
        imageUrlList.add(imageUrl);
      }
    }
    // Create Product DTO and save to Firestore
    final productDto = ProductDto.fromDomain(product).copyWith(
      bannerUrl: bannerUrl,
      imageUrlList: imageUrlList,
    );
    await _products.doc(productId).set(productDto.toJson());

    return right(unit);
    // } catch (e) {
    //   return handleException(e);
    // }
  }
}
