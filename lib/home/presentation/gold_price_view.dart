import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_server_error_widget.dart';
import 'package:rb_jewellers/calculator/application/bloc/calculator_bloc.dart';
import 'package:rb_jewellers/calculator/domain/gold_price.dart';

import '../../app/domain/core/constants.dart';

class GoldPriceBannerHome extends StatelessWidget {
  const GoldPriceBannerHome({
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
            (GoldPrice goldPrice) => AutoFadingGoldPrices(
              goldPrice: goldPrice,
            ),
          );
        });
      },
    );
  }
}

class AutoFadingGoldPrices extends StatefulWidget {
  final GoldPrice goldPrice;

  const AutoFadingGoldPrices({super.key, required this.goldPrice});

  @override
  AutoFadingGoldPricesState createState() => AutoFadingGoldPricesState();
}

class AutoFadingGoldPricesState extends State<AutoFadingGoldPrices> {
  final List<String> categories = ['24', '22', '18']; // Categories to display
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider.builder(
        carouselController: _controller,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            GoldPriceBannerCard(
          isFromHome: true,
          category: categories[itemIndex],
          price: categories[itemIndex] == '24'
              ? widget.goldPrice.price24
              : categories[itemIndex] == '22'
                  ? widget.goldPrice.price22
                  : widget.goldPrice.price18,
          title: categories[itemIndex] == '24'
              ? widget.goldPrice.title24
              : categories[itemIndex] == '22'
                  ? widget.goldPrice.title22
                  : widget.goldPrice.title18,
          goldPrice: widget.goldPrice,
        ),
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1, //0.96,
          aspectRatio: 4,
          initialPage: 0,
        ),
      ),
      Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: categories.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 8.0,
                height: 8.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        // (
                        // Theme.of(context).brightness ==
                        //     Brightness.dark
                        // ?
                        Colors.white
                            // : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ),
    ]);

    // AnimatedSwitcher(
    //   duration: const Duration(milliseconds: 500),
    //   child: GoldPriceBannerCard(
    //     key: ValueKey<String>(category),
    //     isFromHome: true,
    //     category: category,
    //     price: price,
    //     goldPrice: widget.goldPrice,
    //   ),
    // );
  }
}

class GoldPriceBannerCard extends StatelessWidget {
  const GoldPriceBannerCard({
    super.key,
    required this.isFromHome,
    required this.goldPrice,
    required this.category,
    required this.price,
    required this.title,
  });

  final bool isFromHome;
  final GoldPrice goldPrice;
  final String category;
  final String price;
  final String title;

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
          RichText(
            text: TextSpan(
              text: '$category KT ',
              style: largeText.copyWith(
                fontWeight: FontWeight.bold,
                // fontSize: 20,
                // color: Colors.yellow,
              ),
              children: [
                TextSpan(
                  text: title,
                  style: largeText,
                ),
              ],
            ),
          ),
          // Text(
          //   goldPrice.title,
          //   style: largeText,
          // ),
        //  thinSpace,
          Text(
            'Todays Gold Price: $rupeeSymbol$price/gm',
            style: titleTextBold,
          ),
        ],
      ),
    );
  }
}
