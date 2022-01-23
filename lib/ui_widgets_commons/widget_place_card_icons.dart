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
    switch (placeCardType) {
      case PlaceCardType.general:
        final bool isHeartFilled = isLiked!;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onAddToWished,
              child: Container(
                padding: const EdgeInsets.all(8),
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
            InkWell(
              onTap: onAddToCalendar,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.calendar_today, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: onDeleteFromWished,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.close, color: Colors.white),
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
                child: const Icon(Icons.share, color: Colors.white),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: onDeleteFromSeen,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        );
    }
  }
}
