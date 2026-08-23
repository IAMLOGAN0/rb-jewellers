import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';

class ProductBannerWidget extends StatefulWidget {
  const ProductBannerWidget({super.key, required this.productBanner});

  final List<String> productBanner;
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ProductBannerWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      thinSpace,
      CarouselSlider.builder(
        carouselController: _controller,
        itemCount: widget.productBanner.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            CachedNetworkImage(
          imageUrl: widget.productBanner[itemIndex],
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
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              const Center(child: Icon(Icons.error)),
        ),
        options: CarouselOptions(
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 0.96,
          aspectRatio: 1.0,
          initialPage: 0,
        ),
      ),
      thickSpace,
      SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: widget.productBanner.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  border: _current == entry.key
                      ? Border.all(
                          color: secondaryColor,
                        )
                      : null,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: entry.value,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => Container(
                    margin: const EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    margin: const EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    child: const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    ]);
  }
}
