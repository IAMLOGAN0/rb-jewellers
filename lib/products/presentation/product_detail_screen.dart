import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/products/domain/product.dart';
import 'package:rb_jewellers/products/presentation/product_banner_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/domain/core/constants.dart';
import '../../authentication/presentation/widget/phone_number_form.dart';
import '../../calculator/application/bloc/calculator_bloc.dart';
import '../../calculator/infrastructure/gold_repository.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  // final CalculatorBloc calculatorBloc;

  const ProductDetailsScreen({
    Key? key,
    required this.product,
    // required this.calculatorBloc,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isLike = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata();
    // uploadDataOnFirebase();
    isIdSelected(widget.product.id);
    print('gram ${widget.product.price.toString()}');
    Future.microtask(() {
      context.read<CalculatorBloc>().add(
            CalculatorEvent.calculateGoldPrice(
                widget.product.price.toString().trim()),
          );
    });
  }

  Future<void> uploadDataOnFirebase() async {
    try {
      bool newUser = true;
      // final AuthService _auth = AuthService();
      // final user = await _auth.signInAsGuest();
      final user = '123';
      final collection = FirebaseFirestore.instance.collection('user_tokens');

      final snapshot = await collection.get();

      // print('snapshot.docs >> ${snapshot.docs}');
      // for (var doc in snapshot.docs) {
      //   final data = doc.data();
      //   final userId = data['userId'];

      CollectionReference products =
          FirebaseFirestore.instance.collection('user_tokens');
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      String? token = await messaging.getToken();
      await products.add({
        'userId': user,
        'fcmToken': token,
        'lastUpdated': DateTime.now(),
      });

      // if (userId == user) {
      //   await collection.add(products);
      //   newUser = false;
      // print('✅ Deleted document with ID: ${doc.id}');
      // }
      // }

      // if (newUser) {
      //   final AuthService _auth = AuthService();
      //   final user = await _auth.signInAsGuest();
      //
      //   print('uid >> ${user!.uid.toString()}');
      //   FirebaseMessaging messaging = FirebaseMessaging.instance;
      //   String? token = await messaging.getToken();
      //   print('token >> ${token}');
      //   CollectionReference products =
      //   FirebaseFirestore.instance.collection('user_tokens');
      //   await products.add({
      //     'userId': user.uid.toString(),
      //     'fcmToken': token,
      //     'lastUpdated': DateTime.now(),
      //   });
      // }
    } catch (e) {
      print('Exception $e');
    }
    // }
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
    // print('uuid >>> ${widget.product.id}');
    // context.read<CalculatorBloc>().add(
    //     CalculatorEvent.calculateGoldPrice(
    //         product.price));

    // return MultiBlocProvider(
    //     providers: [
    //       BlocProvider(
    //           create: (context) => CalculatorBloc(GoldRepository())
    //             ..add(
    //                 CalculatorEvent.calculateGoldPrice(widget.product.price))),
    //       // other blocs...
    //     ],
    //     child: BlocBuilder<CalculatorBloc, CalculatorState>(
    //       builder: (context, state) {
    //         // double price = widget.product.price as double;
    //
    //         // context.read<CalculatorBloc>().add(
    //         //     CalculatorEvent.calculateGoldPrice(
    //         //         widget.product.price.toString().trim()));
    //         // setState(() {
    //         //
    //         // });
    //         print('price >> ${state.calculatedPrice}');
    //         return Scaffold(
    //           appBar: AppBar(
    //             leading: Material(
    //               color: secondaryColor,
    //               child: InkWell(
    //                 onTap: () {
    //                   Get.back();
    //                 },
    //                 child: Icon(
    //                   Icons.arrow_back_ios,
    //                   color: primaryColor,
    //                 ),
    //               ),
    //             ),
    //             titleSpacing: 0,
    //             title: Text(
    //               '${widget.product.title} Details',
    //               style: titleText,
    //             ),
    //             actions: [
    //               InkWell(
    //                 onTap: () async {
    //                   await toggleIdInPrefs(widget.product.id);
    //                 },
    //                 child: Image.asset(
    //                   isLike
    //                       ? 'assets/icons/ic_heart_fill.png'
    //                       : 'assets/icons/ic_heart.png',
    //                   width: 30,
    //                   height: 30,
    //                 ),
    //               ),
    //               const SizedBox(
    //                 width: 20,
    //               )
    //             ],
    //             backgroundColor: secondaryColor, // Customize as needed
    //           ),
    //           body: SingleChildScrollView(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 widget.product.imageUrlList.isNotEmpty
    //                     ? ProductBannerWidget(
    //                         productBanner: widget.product.imageUrlList,
    //                       )
    //                     : CachedNetworkImage(
    //                         imageUrl: widget.product.bannerUrl,
    //                         imageBuilder: (context, imageProvider) => Container(
    //                           margin: const EdgeInsets.all(8),
    //                           width: screenWidth,
    //                           height: screenWidth,
    //                           decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(15),
    //                             image: DecorationImage(
    //                               image: imageProvider,
    //                               fit: BoxFit.cover,
    //                             ),
    //                           ),
    //                         ),
    //                         placeholder: (context, url) => Container(
    //                           margin: const EdgeInsets.all(8),
    //                           width: screenWidth,
    //                           height: screenWidth,
    //                           child: const Center(
    //                             child: CircularProgressIndicator(),
    //                           ),
    //                         ),
    //                         errorWidget: (context, url, error) => Container(
    //                           margin: const EdgeInsets.all(8),
    //                           width: screenWidth,
    //                           height: screenWidth,
    //                           child: const Center(
    //                             child: Icon(Icons.error),
    //                           ),
    //                         ),
    //                       ),
    //                 thickSpace,
    //                 thickSpace,
    //                 thickSpace,
    //
    //                 Column(
    //                   children: [
    //                     SizedBox(
    //                       width: screenWidth / 3,
    //                       child: AppTextField(
    //                         autoFocus: false,
    //                         maxLines: 1,
    //                         controller: state.editingQty
    //                             ? null
    //                             : TextEditingController(text: state.calculatedQuantity),
    //                         textStyle: largeTextBold,
    //                         textAlign: TextAlign.center,
    //                         fillColor: Colors.transparent,
    //                         enableBorder: true,
    //                         borderColor: primaryColor,
    //                         focusedBorderColor: secondaryColor,
    //                         textInputType:
    //                         const TextInputType.numberWithOptions(),
    //                         inputFormatters: [
    //                           FilteringTextInputFormatter.allow(
    //                               RegExp(r'^\d*\.?\d*')),
    //                         ],
    //                         suffixText: 'GM',
    //                         suffixTextStyle: largeTextBold,
    //                         onChangedCallBack: (v) {
    //                           print('gram $v');
    //                           context
    //                               .read<CalculatorBloc>()
    //                               .add(CalculatorEvent.calculateGoldPrice(v.toString()));
    //                         },/*(v) => context
    //                                 .read<CalculatorBloc>()
    //                                 .add(CalculatorEvent.calculateGoldPrice(v)),*/
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 // Product Title
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 16),
    //                   child:
    //                       Text(widget.product.title, style: titleTextBoldDark),
    //                 ),
    //
    //                 // Product Price
    //                 Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 16),
    //                   child: Text(
    //                     widget.product.productCategory.sexCategory.toString() ==
    //                                 'Silver' ||
    //                             widget.product.productCategory.sexCategory
    //                                     .toString() ==
    //                                 'Diamond'
    //                         ? 'MRP ₹ ${widget.product.price} gm'
    //                         : '$rupeeSymbol${state.calculatedPrice}',
    //                     /*'Wt. ${product.price} gm',*/
    //                     style: largeTextBold.copyWith(
    //                       color: secondaryColor,
    //                     ),
    //                   ),
    //                 ),
    //                 thickSpace, thickSpace,
    //
    //                 // Product Description
    //                 if (widget.product.description != '' &&
    //                     widget.product.description.isNotEmpty) ...[
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 16),
    //                     child: Text(
    //                       'Description',
    //                       style: standardTextDarkBold,
    //                     ),
    //                   ),
    //                   thinSpace,
    //                   Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 16),
    //                     child: Text(
    //                       widget.product.description,
    //                       style: standardTextDark.copyWith(
    //                         color: primaryAccentColor,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //
    //                 const SizedBox(height: 32),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ));

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
          '${widget.product.title} Details',
          style: titleText,
        ),
        actions: [
          InkWell(
            onTap: () async {
              await toggleIdInPrefs(widget.product.id);
            },
            child: Image.asset(
              isLike
                  ? 'assets/icons/ic_heart_fill.png'
                  : 'assets/icons/ic_heart.png',
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
        backgroundColor: secondaryColor, // Customize as needed
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, calcState) {
          double qty = 0.0;
          double pricePerGram = 0.0;
          double makingChargesPercent = 0.0;
          double gstPercent = 0.0;
          double makingCharges = 0.0;
          double gstAmount = 0.0;
          double calculatedPrice = 0.0;
          
          if (widget.product.productCategory.sexCategory.toString() == 'Gold' &&
              calcState.goldPrice.price22.isNotEmpty) {
            qty = double.tryParse(widget.product.price) ?? 0.0;
            pricePerGram = (double.tryParse(calcState.goldPrice.price22) ?? 0.0) * qty;
            makingChargesPercent =
                double.tryParse(calcState.goldPrice.makingChargesPercent) ?? 0.0;
            gstPercent = double.tryParse(calcState.goldPrice.gst) ?? 0.0;

            makingCharges = pricePerGram * (makingChargesPercent / 100);
            gstAmount = (pricePerGram + makingCharges) * (gstPercent / 100);
            calculatedPrice =
                (pricePerGram + makingCharges) * (1 + (gstPercent / 100));
          }

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.product.imageUrlList.isNotEmpty
                    ? ProductBannerWidget(
                        productBanner: widget.product.imageUrlList,
                      )
                    : CachedNetworkImage(
                        imageUrl: widget.product.bannerUrl,
                        imageBuilder: (context, imageProvider) => Container(
                          margin: const EdgeInsets.all(8),
                          width: screenWidth,
                          height: screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          margin: const EdgeInsets.all(8),
                          width: screenWidth,
                          height: screenWidth,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          margin: const EdgeInsets.all(8),
                          width: screenWidth,
                          height: screenWidth,
                          child: const Center(
                            child: Icon(Icons.error),
                          ),
                        ),
                      ),
                thickSpace,
                thickSpace, thickSpace,

                // Product Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(widget.product.title, style: titleTextBoldDark),
                ),

                // Product Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    widget.product.productCategory.sexCategory.toString() ==
                                'Silver' ||
                            widget.product.productCategory.sexCategory.toString() ==
                                'Diamond'
                        ? 'MRP ₹ ${int.tryParse(widget.product.price)?.toStringAsFixed(0)}'
                        : 'Wt: ${widget.product.price} gm',
                    /*'Wt. ${product.price} gm',*/
                    style: largeTextBold.copyWith(
                      color: secondaryColor,
                    ),
                  ),
                ),
                thickSpace,
                thickSpace,
                widget.product.productCategory.sexCategory.toString() == 'Gold'
                    ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text('Calculate Gold Price',
                            style: titleTextBoldDark),
                      ),
                      thinSpace,
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('Quantity',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text('${widget.product.price} gm',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      thinSpace,
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('Value',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                '$rupeeSymbol ${pricePerGram.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      thinSpace,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                'Making Charges(${makingChargesPercent.toStringAsFixed(2)}%)',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                '$rupeeSymbol ${makingCharges.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      thinSpace,
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                'GST(${gstPercent..toStringAsFixed(1)}%)',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                '$rupeeSymbol ${gstAmount.toStringAsFixed(2)}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      thinSpace,
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text('Total Amount(Includes GST)',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                                '$rupeeSymbol ${calculatedPrice.toStringAsFixed(0)}',
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                          ),
                        ],
                      )
                    ],
                  )
                : Container(),
            thickSpace,
            thickSpace,
            thickSpace,
            // Product Description
            if (widget.product.description != '' &&
                widget.product.description.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Description',
                  style: standardTextDarkBold,
                ),
              ),
              thinSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.product.description,
                  style: standardTextDark.copyWith(
                    color: primaryAccentColor,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 32),
          ],
        ),
      );
      },
      ),
    );
  }

  Widget _gradientCard(Widget child) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.8,
          colors: [
            gradientStartColor,
            gradientEndColor,
          ],
          // stops: [0.5, 1.0], // Position of the gradient transition
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // Shadow color with opacity
            offset: const Offset(0, 4), // Horizontal and vertical offset
            blurRadius: 10, // Softness of the shadow
            spreadRadius: 2, // Size of the shadow
          ),
        ],
      ),
      child: child,
    );
  }

  void getdata() {
    context
        .read<CalculatorBloc>()
        .add(CalculatorEvent.calculateGoldPrice(widget.product.price));
    setState(() {});
  }
}
