import 'package:flutter/material.dart';

import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_common_widgets/widget_my_header.dart';

/// Сливер-заголовок для главного экрана
class WidgetMySliverAppBar extends SliverPersistentHeaderDelegate {
  WidgetMySliverAppBar({
    required this.expandedHeight,
  });

  final double expandedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double headerFontSize =
        (MediaQuery.of(context).size.width > 330) ? 32 : 25;
    return Stack(
      children: [
        // Первоначальный заголовок
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: Container(
            color: Theme.of(context).canvasColor,
            padding: const EdgeInsets.only(top: 40, bottom: 10, left: 50, right: 20),
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: headerFontSize,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                text: UiStrings.listOfInterestingPlaces,
              ),
            ),
          ),
        ),

        // Постоянный заголовок
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            color: Theme.of(context).canvasColor,
            child: const Center(
              child: WidgetMyHeader(header: UiStrings.listOfInterestingPlaces),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
