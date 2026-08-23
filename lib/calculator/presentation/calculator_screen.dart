import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:rb_jewellers/calculator/application/bloc/calculator_bloc.dart';

import '../../app/domain/core/constants.dart';
import '../../app/presentation/widgets/common_server_error_widget.dart';
import '../domain/gold_price.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  Widget dismissKeyboardOnTap(BuildContext context, {required Widget child}) {
    return GestureDetector(
      // 1. Tap anywhere → hide keyboard
      onTap: () => _hideKeyboard(context),

      // 2. (Optional) Long-press also hides it
      onLongPress: () => _hideKeyboard(context),

      // 3. Do **not** intercept taps that are meant for buttons / scroll
      behavior: HitTestBehavior.translucent,

      child: child,
    );
  }

  /// Internal – unfocus the current node (works on iOS & Android)
  void _hideKeyboard(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    } else {
      // If the focused widget is inside a Form, unfocus the node first
      currentFocus.focusedChild?.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return dismissKeyboardOnTap(
      context,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              GoldPriceBanner(),
              PriceCalculator(),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceCalculator extends StatelessWidget {
  const PriceCalculator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        print('goldPrice ${state.goldPrice}');
        print('calculatedQuantity ${state.calculatedQuantity}');
        print('calculatedMakingCharges ${state.calculatedMakingCharges}');
        print('calculatedGST ${state.calculatedGST}');
        print('calculatedPrice ${state.calculatedPrice}');
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              _gradientCard(
                Column(
                  children: [
                    Text(
                      'Calculate Gold Price',
                      style: titleTextBold,
                    ),
                    thickSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Buy in grams',
                            style: standardTextBold,
                          ),
                          Text(
                            'Buy in rupees',
                            style: standardTextBold,
                          ),
                        ],
                      ),
                    ),
                    thinSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: screenWidth / 3,
                              child: AppTextField(
                                autoFocus: false,
                                maxLines: 1,
                                controller: state.editingQty
                                    ? null
                                    : TextEditingController(
                                        text: state.calculatedQuantity),
                                textStyle: largeTextBold,
                                textAlign: TextAlign.center,
                                fillColor: Colors.transparent,
                                enableBorder: true,
                                borderColor: primaryColor,
                                focusedBorderColor: secondaryColor,
                                textInputType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d*')),
                                ],
                                textInputAction: TextInputAction.done,
                                suffixText: 'GM',
                                suffixTextStyle: largeTextBold,
                                onChangedCallBack: (v) {
                                  print('gram $v');
                                  context.read<CalculatorBloc>().add(
                                      CalculatorEvent.calculateGoldPrice(
                                          v.toString()));
                                }, /*(v) => context
                                    .read<CalculatorBloc>()
                                    .add(CalculatorEvent.calculateGoldPrice(v)),*/
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '=',
                          style: titleTextBold.copyWith(
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: screenWidth / 3,
                              child: AppTextField(
                                autoFocus: false,
                                maxLines: 1,
                                controller: state.editingPrice
                                    ? null
                                    : TextEditingController(
                                        text: double.tryParse(
                                                state.calculatedPrice)
                                            ?.toStringAsFixed(0)),
                                textStyle: largeTextBold,
                                textAlign: TextAlign.center,
                                fillColor: Colors.transparent,
                                enableBorder: true,
                                borderColor: primaryColor,
                                focusedBorderColor: secondaryColor,
                                textInputType:
                                    const TextInputType.numberWithOptions(
                                        decimal: false),
                                textInputAction: TextInputAction.done,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d*\.?\d*')),
                                ],
                                prefixText: rupeeSymbol,
                                prefixTextStyle: largeTextBold,
                                onChangedCallBack: (v) {
                                  print('price $v');
                                  context.read<CalculatorBloc>().add(
                                      CalculatorEvent.calculateGoldQuantity(v));
                                }, /*(v) => context
                                    .read<CalculatorBloc>()
                                    .add(CalculatorEvent.calculateGoldQuantity(
                                        v)),*/
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    thickSpace,
                  ],
                ),
              ),
              thickSpace,
              thickSpace,
              _gradientCard(Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text('Quantity', style: largeText),
                      ),
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text(
                          '${double.tryParse(state.calculatedQuantity)?.toStringAsFixed(3) ?? '0.00'} gm',
                          textAlign: TextAlign.end,
                          style: largeTextBold,
                        ),
                      ),
                    ],
                  ),
                  thickSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text('Value', style: largeText),
                      ),
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text(
                          '$rupeeSymbol ${((double.tryParse(state.goldPrice.price22) ?? 0) * (double.tryParse(state.calculatedQuantity) ?? 0)).toStringAsFixed(2)}',
                          textAlign: TextAlign.end,
                          style: largeTextBold,
                        ),
                      ),
                    ],
                  ),
                  thickSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text(
                          'Making Charges(${state.goldPrice.makingChargesPercent}%)',
                          style: largeText,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text(
                          '$rupeeSymbol ${((double.tryParse(state.calculatedQuantity) ?? 0) * (double.tryParse(state.calculatedMakingCharges) ?? 0)).toStringAsFixed(2)}',
                          textAlign: TextAlign.end,
                          style: largeTextBold,
                        ),
                      ),
                    ],
                  ),
                  thickSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text('GST(${state.goldPrice.gst}%)',
                            style: largeText),
                      ),
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text(
                          state.calculatedQuantity == ''
                              ? '$rupeeSymbol 0.00'
                              : '$rupeeSymbol ${double.tryParse(state.calculatedGST)?.toStringAsFixed(2)}',
                          textAlign: TextAlign.end,
                          style: largeTextBold,
                        ),
                      ),
                    ],
                  ),
                  thickSpace,
                  Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text('Total Amount(Includes GST)',
                            style: largeTextBold),
                      ),
                      SizedBox(
                        width: screenWidth / 2 - 30,
                        child: Text(
                          '$rupeeSymbol ${double.tryParse(state.calculatedPrice)?.toStringAsFixed(0) ?? '0.00'}',
                          textAlign: TextAlign.end,
                          style: largeTextBold,
                        ),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        );
      },
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
}

class GoldPriceBanner extends StatelessWidget {
  const GoldPriceBanner({
    this.isFromHome = false,
    super.key,
  });

  final bool isFromHome;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return state.goldResponseFailureOrSuccessOption.fold(() => Container(),
            (either) {
          return either.fold(
            (failure) => SizedBox(
              height: screenHeight / 4,
              width: screenWidth,
              child: CommonServerErrorWidget(
                failure.map(
                  failureWithMessage: (e) => e.toString(),
                  unexpected: (e) => 'Unexpected Error\nContact Support',
                  insufficientPermission: (e) => 'insufficientPermission',
                  firestoreFailure: (e) => 'firestoreFailure',
                  networkFailure: (e) => 'networkFailure',
                ),
                () => context.read<CalculatorBloc>().add(
                      const CalculatorEvent.getGoldPrice(),
                    ),
                textColorReceived: backgroundColor,
              ),
            ),
            (GoldPrice goldPrice) => GoldPriceBannerCard(
                goldPrice: goldPrice, isFromHome: isFromHome),
          );
        });
      },
    );
  }
}

class GoldPriceBannerCard extends StatelessWidget {
  const GoldPriceBannerCard({
    super.key,
    required this.isFromHome,
    required this.goldPrice,
  });

  final bool isFromHome;
  final GoldPrice goldPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isFromHome ? null : secondaryColor,
        gradient: isFromHome
            ? RadialGradient(
                radius: 2, //0.8,
                colors: [
                  gradientStartColor,
                  gradientEndColor,
                ],
              )
            : null,
      ),
      child: Column(
        children: [
          Text(
            '22 KT ${goldPrice.title22}',
            style: largeText,
          ),
          thickSpace,
          Text(
            'Todays Gold Price: $rupeeSymbol${goldPrice.price22}/gm',
            style: titleTextBold,
          ),
        ],
      ),
    );
  }
}
