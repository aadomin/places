import 'package:flutter/material.dart';

import '../my_enums.dart';

class WidgetSightCardIcons extends StatelessWidget {
  const WidgetSightCardIcons({
    Key? key,
    required this.placeCardType,
    required this.onDeleteFromList,
    required this.onAddToCalendar,
  }) : super(key: key);

  final void Function() onDeleteFromList;
  final SightCardType placeCardType;
  final VoidCallback onAddToCalendar;

  @override
  Widget build(BuildContext context) {
    switch (placeCardType) {
      case SightCardType.general:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.favorite_outline, color: Colors.white),
                onTap: () {
                  print('Wish, calendar');
                },
              ),
            ),
          ],
        );
      case SightCardType.wished:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.calendar_today, color: Colors.white),
                onTap: onAddToCalendar,
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.close, color: Colors.white),
                onTap: onDeleteFromList,
              ),
            ),
          ],
        );
      case SightCardType.seen:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.share, color: Colors.white),
                onTap: () {
                  print('Seen, share');
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              child: InkWell(
                child: Icon(Icons.close, color: Colors.white),
                onTap: onDeleteFromList,
              ),
            ),
          ],
        );
    }
  }
}
