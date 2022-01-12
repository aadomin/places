import 'package:flutter/material.dart';

import 'package:places/ui_commons/enums.dart';

/// Иконки (кнопки) в карточке места
class WidgetPlaceCardIcons extends StatelessWidget {
  const WidgetPlaceCardIcons({
    required this.placeCardType,
    this.onAddToWished,
    this.onAddToCalendar,
    this.onDeleteFromWished,
    this.onShare,
    this.onDeleteFromSeen,
    this.isLiked,
    Key? key,
  }) : super(key: key);

  final PlaceCardType placeCardType;

  final VoidCallback? onAddToWished;

  final VoidCallback? onAddToCalendar;
  final VoidCallback? onDeleteFromWished;

  final VoidCallback? onShare;
  final VoidCallback? onDeleteFromSeen;
  final bool? isLiked;

  @override
  Widget build(BuildContext context) {
    // final int i = 3;
    // if (i > 2) return Center();
    switch (placeCardType) {
      case PlaceCardType.general:
        final bool isHeartFilled = isLiked!;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: onAddToWished,
                child: Icon(
                  isHeartFilled ? Icons.favorite : Icons.favorite_outline,
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
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: onAddToCalendar,
                child: const Icon(Icons.calendar_today, color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: onDeleteFromWished,
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        );
      case PlaceCardType.seen:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: onShare,
                child: const Icon(Icons.share, color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: onDeleteFromSeen,
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        );
    }
  }
}
