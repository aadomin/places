import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_image_paths.dart';

///
/// Иконки (кнопки) в карточке места
///
class WidgetPlaceCardIcons extends StatelessWidget {
  const WidgetPlaceCardIcons({
    required this.placeCardType,
    this.onToggleWished,
    this.onAddToCalendar,
    this.onDeleteFromWished,
    this.onShare,
    this.onDeleteFromSeen,
    this.isLiked,
    Key? key,
  }) : super(key: key);

  final PlaceCardType placeCardType;

  final VoidCallback? onToggleWished;

  final VoidCallback? onAddToCalendar;
  final VoidCallback? onDeleteFromWished;

  final VoidCallback? onShare;
  final VoidCallback? onDeleteFromSeen;
  final bool? isLiked;

  @override
  Widget build(BuildContext context) {
    switch (placeCardType) {
      case PlaceCardType.general:
        final bool isHeartFilled = isLiked!;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onToggleWished,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  isHeartFilled
                      ? UiImagePaths.heart_filled
                      : UiImagePaths.heart,
                  height: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      case PlaceCardType.wished:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onAddToCalendar,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  UiImagePaths.calendar,
                  height: 22,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 4),
            InkWell(
              onTap: onDeleteFromWished,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  UiImagePaths.close,
                  height: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      case PlaceCardType.seen:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onShare,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  UiImagePaths.share,
                  height: 22,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 4),
            InkWell(
              onTap: onDeleteFromSeen,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(
                  UiImagePaths.close,
                  height: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
    }
  }
}
