import 'package:flutter/material.dart';

import 'package:places/enums.dart';

class WidgetPlaceCardIcons extends StatelessWidget {
  const WidgetPlaceCardIcons({
    required this.placeCardType,
    this.onAddToWished,
    this.onAddToCalendar,
    this.onDeleteFromWished,
    this.onShare,
    this.onDeleteFromSeen,
    Key? key,
  }) : super(key: key);

  final PlaceCardType placeCardType;

  final VoidCallback? onAddToWished;

  final VoidCallback? onAddToCalendar;
  final VoidCallback? onDeleteFromWished;

  final VoidCallback? onShare;
  final VoidCallback? onDeleteFromSeen;

  @override
  Widget build(BuildContext context) {
    switch (placeCardType) {
      case PlaceCardType.general:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: onAddToWished,
                child: const Icon(Icons.favorite_outline, color: Colors.white),
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
