import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../domain/core/constants.dart';

class ShimmerLoadingScreen extends StatelessWidget {
  const ShimmerLoadingScreen({Key? key, required this.widget})
      : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: primaryAccentColor,
        highlightColor: primaryColor,
        period: const Duration(milliseconds: 500),
        child: widget);
  }
}
