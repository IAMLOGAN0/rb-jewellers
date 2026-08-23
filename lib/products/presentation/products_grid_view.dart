import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_result_empty_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_server_error_widget.dart';
import 'package:rb_jewellers/products/domain/product.dart';
import 'package:rb_jewellers/products/domain/product_category.dart';
import 'package:rb_jewellers/products/presentation/product_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../calculator/application/bloc/calculator_bloc.dart';
import '../../calculator/infrastructure/gold_repository.dart';
import '../application/bloc/product_bloc.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView(this.productCategory,
      {super.key, required this.productBloc});

  final ProductCategory productCategory;
  final ProductBloc productBloc;

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  bool isLike = false;
  String filetValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata();
  }

  Future<void> toggleIdInPrefs(String id) async {
    print('click id ${id}');
    final prefs = await SharedPreferences.getInstance();

    // Load the list (default to empty if null)
    List<String> idList = prefs.getStringList('id_list') ?? [];

    if (idList.contains(id)) {
      idList.remove(id);
      print('if');
    } else {
      idList.add(id);
      print('else');
    }

    await prefs.setStringList('id_list', idList);
    print("length >> ${idList.length}");
    setState(() {
      // isIdSelected(widget.productCategory.id);
    });
  }

  Future<bool> isIdSelected(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> idList = prefs.getStringList('id_list') ?? [];
    isLike = idList.contains(id);
    /*print('isLike $isLike');
    setState(() {});*/
    return isLike;
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
            child: const Icon(Icons.arrow_back_ios),
          ),
        ),
        titleSpacing: 0,
        title: Text(
          widget.productCategory.title,
          style: titleTextDark,
        ),
        backgroundColor: secondaryColor,
        // Customize as needed

        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu item click
              
              filetValue = value;
              print("Selected: $value");
              setState(() {});
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  value: 'Price',
                  child: Column(children: [
                    Text('Filter',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Divider(),
                  ]),
                ),
                const PopupMenuItem(
                  value: 'Low',
                  child: Text('Price Low to High'),
                ),
                const PopupMenuItem(
                  value: 'High',
                  child: Text('Price High to Low'),
                ),
              ];
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        bloc: widget.productBloc
          ..add(ProductEvent.getProductsInCategory(widget.productCategory.id)),
        builder: (context, state) {
          return state.productResponseFailureOrSuccessOption.fold(
            () => Container(),
            (either) {
              return either.fold(
                  (failure) => SizedBox(
                        height: screenHeight / 4,
                        width: screenWidth,
                        child: CommonServerErrorWidget(
                          'Failure',
                          () => context.read<ProductBloc>().add(
                                ProductEvent.getProductsInCategory(
                                    widget.productCategory.id),
                              ),
                        ),
                      ), (List<Product> sortedProducts) {
                List<Product> product = List.from(sortedProducts);
                product.sort((a, b) => b.createdAt.compareTo(a.createdAt));

                if (filetValue == 'Low') {
                  product.sort((a, b) {
                    double priceA = double.tryParse(a.price.toString()) ?? 0;
                    double priceB = double.tryParse(b.price.toString()) ?? 0;
                    return priceA.compareTo(priceB); // low to high
                  });
                } else if (filetValue == 'High') {
                  product.sort((a, b) {
                    double priceA = double.tryParse(a.price.toString()) ?? 0;
                    double priceB = double.tryParse(b.price.toString()) ?? 0;
                    return priceB.compareTo(priceA); // high to low
                  });
                }

                return product.isEmpty
                    ? SizedBox(
                        height: screenHeight / 4,
                        width: screenWidth,
                        child: CommonResultsEmptyWidget(
                          msg: 'No Products Found',
                          buttonHandler: () => context.read<ProductBloc>().add(
                                const ProductEvent.getProductCategories(),
                              ),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of columns
                            crossAxisSpacing: 8.0, // Spacing between columns
                            mainAxisSpacing: 8.0, // Spacing between rows
                            childAspectRatio:
                                3 / 4, // Aspect ratio of each card
                          ),
                          itemCount: product.length,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            // context.read<CalculatorBloc>().add(
                            //     CalculatorEvent.calculateGoldPrice(
                            //         product[index].price));
                            // String price = state1.calculatedPrice;

                            // await isIdSelected(product[index].id);
                            // product.sort((a, b) => b.createdAt.compareTo(a.createdAt));
                            return ProductTile(product: product[index]);
                          },
                        ),
                      );
              });
            },
          );
        },
      ),
    );
  }
}

class ProductPriceCalculator extends StatelessWidget {
  const ProductPriceCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Text(
          'Wt. ${state.calculatedPrice} gm',
          style: standardText.copyWith(
            color: secondaryColor,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}

class ProductTile extends StatefulWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool isLike = false;

  @override
  void initState() {
    super.initState();
    isIdSelected(widget.product.id);
  }

  Future<void> toggleIdInPrefs(String id) async {
    print('click id ${id}');
    final prefs = await SharedPreferences.getInstance();

    // Load the list (default to empty if null)
    List<String> idList = prefs.getStringList('id_list') ?? [];

    if (idList.contains(id)) {
      idList.remove(id);
      print('if');
    } else {
      idList.add(id);
      print('else');
    }

    await prefs.setStringList('id_list', idList);
    print("length >> ${idList.length}");
    setState(() {
      isIdSelected(widget.product.id);
    });
  }

  isIdSelected(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> idList = prefs.getStringList('id_list') ?? [];
    isLike = idList.contains(id);
    print('isLike $isLike');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, calcState) {
        double calculatedPrice = 0.0;
        if (widget.product.productCategory.sexCategory.toString() == 'Gold' &&
            calcState.goldPrice.price22.isNotEmpty) {
          double qty = double.tryParse(widget.product.price) ?? 0.0;
          double pricePerGram =
              double.tryParse(calcState.goldPrice.price22) ?? 0.0;
          double makingChargesPercent =
              double.tryParse(calcState.goldPrice.makingChargesPercent) ?? 0.0;
          double gstPercent = double.tryParse(calcState.goldPrice.gst) ?? 0.0;

          double makingCharges = pricePerGram * (makingChargesPercent / 100);
          calculatedPrice = (pricePerGram + makingCharges) *
              qty *
              (1 + (gstPercent / 100));
        }

        return InkWell(
      onTap: () => Get.to(
        () => ProductDetailsScreen(
          product: widget.product,
        ),
      ),
      child: Card(
        elevation: 3,
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      8,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.product.bannerUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                        margin: const EdgeInsets.all(8),
                        width: double.infinity,
                        height: double.infinity,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        margin: const EdgeInsets.all(8),
                        width: double.infinity,
                        height: double.infinity,
                        child: const Center(
                          child: Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   right: 0,
                  //   child: InkWell(
                  //     onTap: () async {
                  //       await toggleIdInPrefs(widget.product.id);
                  //       setState(() {
                  //
                  //       });
                  //     },
                  //     child: Image.asset(
                  //       isLike
                  //           ? 'assets/icons/ic_heart_fill.png'
                  //           : 'assets/icons/ic_heart.png',
                  //       width: 22,
                  //       height: 22,
                  //     ),
                  //   ),
                  // ),
                ],
              )),
              thickSpace,
              Text(
                widget.product.title,
                style: largeTextDark,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              thinSpace,
              Text(
                widget.product.productCategory.sexCategory.toString() ==
                            'Silver' ||
                        widget.product.productCategory.sexCategory.toString() ==
                            'Diamond'
                    ? 'MRP ₹ ${widget.product.price}'
                    : 'Wt: ${widget.product.price} gm',
                style: standardText.copyWith(
                  color: secondaryColor,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              thinSpace,
              widget.product.productCategory.sexCategory.toString() == 'Gold'
                  ? Text(
                      'MRP ₹ ${calculatedPrice.toStringAsFixed(0)}',
                      style: standardText.copyWith(
                        color: secondaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Container(),

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
    );
  }
}
