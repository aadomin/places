import 'package:flutter/material.dart';

import 'package:places/enums.dart';

class WidgetSightCardIcons extends StatelessWidget {
  const WidgetSightCardIcons({
    required this.placeCardType,
    required this.onDeleteFromList,
    required this.onAddToCalendar,
    Key? key,
  }) : super(key: key);

  final void Function() onDeleteFromList;
  final SightCardType placeCardType;
  final VoidCallback? onAddToCalendar;

  @override
  Widget build(BuildContext context) {
    switch (placeCardType) {
      case SightCardType.general:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: () {
                  // print('Wish, calendar');
                },
                child: const Icon(Icons.favorite_outline, color: Colors.white),
              ),
            ),
          ],
        );
      case SightCardType.wished:
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
                onTap: onDeleteFromList,
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        );
      case SightCardType.seen:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: () {
                  // print('Seen, share');
                },
                child: const Icon(Icons.share, color: Colors.white),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: onDeleteFromList,
                child: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ],
        );
    }
  }
}
