import 'package:flutter/material.dart';
import 'package:places/ui_widgets_commons/my_infinite_rotator.dart';
import 'package:places/ui_commons/ui_image_paths.dart';

/// Custom  loading indicator
class MyCircleProgressIndicator extends StatelessWidget {
  const MyCircleProgressIndicator({
    required this.isBigAndColorful,
    Key? key,
  }) : super(key: key);

  final bool isBigAndColorful;

  @override
  Widget build(BuildContext context) {
    return MyInfiniteRotator(
      child: isBigAndColorful
          ? Image.asset(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? UiImagePaths.loaderBigWhite
                  : UiImagePaths.loaderBigBlack,
            )
          : Image.asset(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? UiImagePaths.loaderSmallWhite
                  : UiImagePaths.loaderSmallBlack,
              width: 50,
              height: 50,
            ),
    );
  }
}

