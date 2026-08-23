import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_result_empty_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_server_error_widget.dart';
import 'package:rb_jewellers/products/application/bloc/product_bloc.dart';

import '../domain/product_category.dart';
import 'products_grid_view.dart';

class ProductCategoryGridView extends StatelessWidget {
  const ProductCategoryGridView({
    super.key,
    this.isFromHome = false,
    this.sexCategory,
  });

  final bool isFromHome;
  final String? sexCategory;


  @override
  Widget build(BuildContext context) {
    print('check sexCategory ${sexCategory}');
    print('check isFromHome ${isFromHome}');
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final productBloc = BlocProvider.of<ProductBloc>(context);
        return state.productCategoryResponseFailureOrSuccessOption.fold(
              () => Container(),
              (either) {
            return either.fold(
                  (failure) =>
                  SizedBox(
                    height: screenHeight / 4,
                    width: screenWidth,
                    child: CommonServerErrorWidget(
                      'Failure',
                          () =>
                          context.read<ProductBloc>().add(
                            const ProductEvent.getProductCategories(),
                          ),
                    ),
                  ),
                  (List<ProductCategory> category) {
                List<ProductCategory> productCategory = [];
                if (sexCategory != null) {
                  if (sexCategory == 'Gold') {
                    // print("allProducts.length=>${state.allProducts.length}");
                    // print("sexCategory_SILVER=>${sexCategory}");
                    // print("state.mensCategories=>${state.goldCategories}");
                    productCategory = state.goldCategories;
                  } else if (sexCategory == 'Silver') {
                    // print("sexCategory_GOLD=>${sexCategory}");
                    productCategory = state.silverCategories;
                    // print("state.womensCategories=>${state.silverCategories}");
                    //
                    // print("productCategory11111----${productCategory}");
                  }
                  else if (sexCategory == 'Diamond') {
                    productCategory = state.daimondCategories;
                  }
                } else {
                  productCategory = category;
                }

                return productCategory.isEmpty
                    ? SizedBox(
                  height: screenHeight / 4,
                  width: screenWidth,
                  child: CommonResultsEmptyWidget(
                    msg: 'No Categories Found',
                    buttonHandler: () =>
                        context.read<ProductBloc>().add(
                          const ProductEvent.getProductCategories(),
                        ),
                  ),
                )
                    : GridView.builder(
                  shrinkWrap: true,
                  physics: isFromHome
                      ? const NeverScrollableScrollPhysics()
                      : const AlwaysScrollableScrollPhysics(),
                  // scrollDirection: Axis.horizontal, // Set horizontal scrolling
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0, // Spacing between columns
                    mainAxisSpacing: 8.0, // Spacing between rows
                    childAspectRatio:
                    1 / 1.3, // Adjust aspect ratio to fit the layout
                  ),
                  itemCount: productCategory.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () =>
                          Get.to(
                                () =>
                                ProductGridView(
                                  productCategory[index],
                                  productBloc: productBloc,
                                ),
                          ),
                      child: Card(
                        elevation: 3,
                        color: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                    8,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: productCategory[index]
                                        .categoryImageUrl,
                                    imageBuilder:
                                        (context, imageProvider) =>
                                        Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                    placeholder: (context, url) =>
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: const Center(
                                            child:
                                            CircularProgressIndicator(),
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: const Center(
                                            child: Icon(Icons.error),
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                              thinSpace,
                              Text(
                                productCategory[index].title,
                                style: smallText.copyWith(
                                  color: backgroundColor.shade800,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              // thinSpace,
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
