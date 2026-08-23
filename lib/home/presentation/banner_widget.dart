import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_result_empty_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_server_error_widget.dart';
import 'package:rb_jewellers/home/application/bloc/home_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../domain/banners.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<BannerWidget> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return state.bannersResponseFailureOrSuccessOption.fold(
          () => Container(),
          (either) {
            return either.fold(
              (failure) => SizedBox(
                height: screenHeight / 4,
                width: screenWidth,
                child: CommonServerErrorWidget('Failure', () {}),
              ),
              (List<Banners> banners) => banners.isEmpty
                  ? SizedBox(
                      height: screenHeight / 4,
                      width: screenWidth,
                      child: const CommonResultsEmptyWidget(msg: 'No Banners'))
                  : Stack(children: [
                      CarouselSlider.builder(
                        carouselController: _controller,
                        itemCount: banners.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            InkWell(
                          onTap: () async => await launchUrl(
                              Uri.parse(banners[itemIndex].url)),
                          child:
                              //Image.network(banners[itemIndex].bannerUrl),
                              CachedNetworkImage(
                            imageUrl: banners[itemIndex].bannerUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) =>
                                const Center(child: Icon(Icons.error)),
                          ),
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
                          aspectRatio: 2.0,
                          initialPage: 0,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: banners.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 8.0,
                                height: 8.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color:
                                        // (
                                        // Theme.of(context).brightness ==
                                        //     Brightness.dark
                                        // ?
                                        Colors.white
                                            // : Colors.black)
                                            .withOpacity(_current == entry.key
                                                ? 0.9
                                                : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ]),
            );
          },
        );
      },
    );
  }
}
