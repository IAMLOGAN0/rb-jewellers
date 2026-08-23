import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_result_empty_widget.dart';

import '../application/bloc/product_bloc.dart';
import '../domain/product.dart';
import '../domain/product_category.dart';
import 'product_detail_screen.dart';
import 'products_grid_view.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
    this.isFromHome = false,
    // required this.productBloc,
  });

  final bool isFromHome;

  // final ProductCategory productCategory;
  // final ProductBloc productBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        List<Product> product = state.productsSearchResult;
        List<ProductCategory> productCategory = state.categoriesSearchResult;
        final productBloc = BlocProvider.of<ProductBloc>(context);
        return Scaffold(
          body: SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: state.searchQuery.isEmpty || state.searchQuery == ''
                ? Center(
                    child: Text(
                      'Search For Categories or Products',
                      style: largeTextDark,
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Products',
                          style: largeTextDarkBold,
                        ),
                      ),
                      state.productsSearchResult.isEmpty
                          ? SizedBox(
                              height: screenHeight / 4,
                              width: screenWidth,
                              child: const CommonResultsEmptyWidget(
                                msg: 'No Products Found',
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: product.length,
                                padding: const EdgeInsets.all(8),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: CachedNetworkImage(
                                        imageUrl: product[index].bannerUrl,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: 60, // Adjust width for image
                                          height: 60, // Adjust height for image
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Center(
                                            child: Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      product[index].title,
                                      style: largeTextDark,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    subtitle: Text(
                                      'Wt. ${product[index].price} gm',
                                      style: standardText.copyWith(
                                        color: secondaryColor,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color:
                                          secondaryColor, // Add icon if you want to navigate to detail
                                    ),
                                    onTap: () => Get.to(
                                      () => ProductDetailsScreen(
                                        product: product[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Categories',
                          style: largeTextDarkBold,
                        ),
                      ),
                      productCategory.isEmpty
                          ? SizedBox(
                              height: screenHeight / 4,
                              width: screenWidth,
                              child: const CommonResultsEmptyWidget(
                                msg: 'No Categories Found',
                              ),
                            )
                          : SizedBox(
                              height: screenHeight * .18,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: isFromHome
                                    ? const NeverScrollableScrollPhysics()
                                    : const AlwaysScrollableScrollPhysics(),
                                scrollDirection:
                                    Axis.horizontal, // Set horizontal scrolling
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,

                                  crossAxisSpacing:
                                      8.0, // Spacing between columns
                                  mainAxisSpacing: 8.0, // Spacing between rows
                                  childAspectRatio:
                                      1.4, // Adjust aspect ratio to fit the layout
                                ),
                                itemCount: productCategory.length,
                                padding: const EdgeInsets.all(8),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () => Get.to(
                                      () => ProductGridView(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  8,
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      productCategory[index]
                                                          .categoryImageUrl,
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      image: DecorationImage(
                                                        image: imageProvider,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  placeholder: (context, url) =>
                                                      Container(
                                                    margin:
                                                        const EdgeInsets.all(8),
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child: const Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Container(
                                                    margin:
                                                        const EdgeInsets.all(8),
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
                              ),
                            ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
