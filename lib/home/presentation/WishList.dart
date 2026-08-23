import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/domain/core/constants.dart';
import '../../app/presentation/widgets/common_result_empty_widget.dart';
import '../../app/presentation/widgets/common_server_error_widget.dart';
import '../../calculator/application/bloc/calculator_bloc.dart';
import '../../calculator/infrastructure/gold_repository.dart';
import '../../products/application/bloc/product_bloc.dart';
import '../../products/domain/product.dart';
import '../../products/domain/product_category.dart';
import '../../products/presentation/product_detail_screen.dart';

class WishList extends StatefulWidget {
  const WishList({super.key, required this.productBloc});

  final ProductBloc productBloc;

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  bool isLike = false;
  List<String> idList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isIdSelected();
  }

  isIdSelected() async {
    final prefs = await SharedPreferences.getInstance();
    idList.clear();
    idList = prefs.getStringList('id_list') ?? [];
    print('init idList ${idList.length}');
    setState(() {});
  }

  Future<void> toggleIdInPrefs(String id) async {
    print('click id ${id}');
    final prefs = await SharedPreferences.getInstance();

    // Load the list (default to empty if null)
    // List<String> idList = prefs.getStringList('id_list') ?? [];

    if (idList.contains(id)) {
      idList.remove(id);
      print('if');
    }

    await prefs.setStringList('id_list', idList);
    print("length >> ${idList.length}");
    setState(() {
      // isIdSelected(widget.productCategory.id);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Material(
          color: secondaryColor,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: primaryColor,
            ),
          ),
        ),
        titleSpacing: 0,
        title: Text(
          'Wish List',
          style: titleText,
        ),
        backgroundColor: secondaryColor, // Customize as needed
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: widget.productBloc,
        builder: (context, state) {
          // final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
          return state.productCategoryResponseFailureOrSuccessOption.fold(
            () => Container(),
            (either) {
              return either.fold(
                (failure) => SizedBox(
                  height: screenHeight / 4,
                  width: screenWidth,
                  child: CommonServerErrorWidget(
                    'Failure',
                    () => context.read<ProductBloc>().add(
                          const ProductEvent.getProductCategories(),
                        ),
                  ),
                ),
                (List<ProductCategory> category) {
                  List<Product> product = [];
                  List<Product> showProduct = [];
                  product = state.allProducts;

                  for (int i = 0; i < product.length; i++) {
                    for (int j = 0; j < idList.length; j++) {
                      if (idList.contains(product[i].id)) {
                        showProduct.add(product[i]);
                        break;
                      }
                    }
                  }
                  print('idList${idList.length}');
                  print('showProduct${showProduct.length}');
                  print('showProduct ${showProduct[0].id}');
                  return showProduct.isEmpty
                      ? SizedBox(
                          height: screenHeight / 4,
                          width: screenWidth,
                          child: CommonResultsEmptyWidget(
                            msg: 'No Product Found',
                            buttonHandler: () =>
                                context.read<ProductBloc>().add(
                                      const ProductEvent.getProductCategories(),
                                    ),
                          ),
                        )
                      // : Padding(
                      //     padding: const EdgeInsets.only(left: 8.0, right: 8),
                      //     child: GridView.builder(
                      //       gridDelegate:
                      //           const SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2, // Number of columns
                      //         crossAxisSpacing: 8.0, // Spacing between columns
                      //         mainAxisSpacing: 8.0, // Spacing between rows
                      //         childAspectRatio:
                      //             3 / 4, // Aspect ratio of each card
                      //       ),
                      //       itemCount: product.length,
                      //       padding: const EdgeInsets.all(8),
                      //       itemBuilder: (context, index) {
                      //
                      //         return InkWell(
                      //           onTap: () => Get.to(
                      //             () => ProductDetailsScreen(
                      //               product: product[index],
                      //             ),
                      //           ),
                      //           child: Card(
                      //             elevation: 3,
                      //             color: primaryColor,
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(12),
                      //             ),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(8.0),
                      //               child: Column(
                      //                 crossAxisAlignment:
                      //                     CrossAxisAlignment.center,
                      //                 children: [
                      //                   Expanded(
                      //                       child: Stack(
                      //                     children: [
                      //                       ClipRRect(
                      //                         borderRadius:
                      //                             BorderRadius.circular(
                      //                           8,
                      //                         ),
                      //                         child: CachedNetworkImage(
                      //                           imageUrl:
                      //                               product[index].bannerUrl,
                      //                           imageBuilder:
                      //                               (context, imageProvider) =>
                      //                                   Container(
                      //                             width: double.infinity,
                      //                             height: double.infinity,
                      //                             decoration: BoxDecoration(
                      //                               borderRadius:
                      //                                   BorderRadius.circular(
                      //                                       8),
                      //                               image: DecorationImage(
                      //                                 image: imageProvider,
                      //                                 fit: BoxFit.cover,
                      //                               ),
                      //                             ),
                      //                           ),
                      //                           placeholder: (context, url) =>
                      //                               Container(
                      //                             margin:
                      //                                 const EdgeInsets.all(8),
                      //                             width: double.infinity,
                      //                             height: double.infinity,
                      //                             child: const Center(
                      //                               child:
                      //                                   CircularProgressIndicator(),
                      //                             ),
                      //                           ),
                      //                           errorWidget:
                      //                               (context, url, error) =>
                      //                                   Container(
                      //                             margin:
                      //                                 const EdgeInsets.all(8),
                      //                             width: double.infinity,
                      //                             height: double.infinity,
                      //                             child: const Center(
                      //                               child: Icon(Icons.error),
                      //                             ),
                      //                           ),
                      //                         ),
                      //                       ),
                      //                       // Positioned(
                      //                       //   right: 0,
                      //                       //   child: InkWell(
                      //                       //     onTap: () async {
                      //                       //       await toggleIdInPrefs(widget.product.id);
                      //                       //       setState(() {
                      //                       //
                      //                       //       });
                      //                       //     },
                      //                       //     child: Image.asset(
                      //                       //       isLike
                      //                       //           ? 'assets/icons/ic_heart_fill.png'
                      //                       //           : 'assets/icons/ic_heart.png',
                      //                       //       width: 22,
                      //                       //       height: 22,
                      //                       //     ),
                      //                       //   ),
                      //                       // ),
                      //                     ],
                      //                   )),
                      //                   thickSpace,
                      //                   Text(
                      //                     product[index].title,
                      //                     style: largeTextDark,
                      //                     maxLines: 1,
                      //                     overflow: TextOverflow.ellipsis,
                      //                   ),
                      //                   thinSpace,
                      //                   Text(
                      //                     product[index]
                      //                                     .productCategory
                      //                                     .sexCategory
                      //                                     .toString() ==
                      //                                 'Silver' ||
                      //                             product[index]
                      //                                     .productCategory
                      //                                     .sexCategory
                      //                                     .toString() ==
                      //                                 'Diamond'
                      //                         ? 'MRP ₹ ${product[index].price} gm'
                      //                         : 'Wt. ${product[index].price} gm',
                      //                     style: standardText.copyWith(
                      //                       color: secondaryColor,
                      //                     ),
                      //                     maxLines: 1,
                      //                     overflow: TextOverflow.ellipsis,
                      //                   ),
                      //                   thinSpace,
                      //                   // ProductPriceCalculator(price: product[index].price)
                      //                   // ProductPriceCalculator(
                      //                   //     product[index].price)
                      //
                      //                   // BlocBuilder<CalculatorBloc,
                      //                   //     CalculatorState>(
                      //                   //   builder: (context, calcState) {
                      //                   //     final price =
                      //                   //         calcState.calculatedPrice;
                      //                   //     return Text(
                      //                   //       'Wt. ${price} gm',
                      //                   //       style: standardText.copyWith(
                      //                   //         color: secondaryColor,
                      //                   //       ),
                      //                   //       maxLines: 1,
                      //                   //       overflow: TextOverflow.ellipsis,
                      //                   //     );
                      //                   //   },
                      //                   // )
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   );

                      : Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8),
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              // Number of columns
                              crossAxisSpacing: 8.0,
                              // Spacing between columns
                              mainAxisSpacing: 8.0,
                              // Spacing between rows
                              childAspectRatio:
                                  3 / 4, // Aspect ratio of each card
                            ),
                            itemCount: showProduct.length,
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Get.to(() => ProductDetailsScreen(product: showProduct[index]));
                                },
                                child: Card(
                                  elevation: 3,
                                  color: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                8,
                                              ),
                                              child: CachedNetworkImage(
                                                imageUrl: showProduct[index]
                                                    .bannerUrl,
                                                imageBuilder:
                                                    (context, imageProvider) =>
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
                                            Positioned(
                                              right: 0,
                                              child: InkWell(
                                                onTap: () async {
                                                  await toggleIdInPrefs(
                                                      showProduct[index].id);
                                                  setState(() {});
                                                },
                                                child: Image.asset(
                                                  'assets/icons/ic_heart_fill.png',
                                                  width: 22,
                                                  height: 22,
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                        thickSpace,
                                        Text(
                                          showProduct[index].title,
                                          style: largeTextDark,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        thinSpace,
                                        Text(
                                          showProduct[index]
                                                          .productCategory
                                                          .sexCategory
                                                          .toString() ==
                                                      'Silver' ||
                                                  showProduct[index]
                                                          .productCategory
                                                          .sexCategory
                                                          .toString() ==
                                                      'Diamond'
                                              ? 'MRP ₹${showProduct[index].price}'
                                              : 'Wt: ${showProduct[index].price} gm',
                                          style: standardText.copyWith(
                                            color: secondaryColor,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        thinSpace,
                                        // ProductPriceCalculator(price: product[index].price)
                                        // ProductPriceCalculator(
                                        //     product[index].price)

                                        // BlocBuilder<CalculatorBloc,
                                        //     CalculatorState>(
                                        //   builder: (context, calcState) {
                                        //     final price =
                                        //         calcState.calculatedPrice;
                                        //     return Text(
                                        //       'Wt. ${price} gm',
                                        //       style: standardText.copyWith(
                                        //         color: secondaryColor,
                                        //       ),
                                        //       maxLines: 1,
                                        //       overflow: TextOverflow.ellipsis,
                                        //     );
                                        //   },
                                        // )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                },
              );
            },
          );
        },
      ),
    );
  }
}
