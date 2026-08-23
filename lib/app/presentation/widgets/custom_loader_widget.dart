import 'package:flutter/cupertino.dart';

import '../../domain/core/constants.dart';

enum LoaderType {
  threeDot,
  circular,
}

class CustomLoader extends StatefulWidget {
  final Color? activeColor;
  final Color? color;
  final LoaderType loaderType;

  const CustomLoader({
    Key? key,
    this.activeColor,
    this.color,
    required this.loaderType,
  }) : super(key: key);

  @override
  CustomLoaderState createState() => CustomLoaderState();
}

class CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.loaderType == LoaderType.circular
        ? CupertinoActivityIndicator(
            color: widget.activeColor,
            radius: 12,
          )
        : AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _getColor(index),
                    ),
                  );
                }),
              );
            },
          );
  }

  Color _getColor(int index) {
    final ColorTween colorTween = ColorTween(
      begin: widget.color ?? primaryAccentColor,
      end: widget.activeColor ?? secondaryAccentColor,
    );

    return colorTween.evaluate(
      AlwaysStoppedAnimation(
        (index * 0.33) + _controller.value,
      ),
    )!;
  }
}
