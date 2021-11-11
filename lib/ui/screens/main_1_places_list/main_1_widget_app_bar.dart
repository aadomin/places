import 'package:flutter/material.dart';

import 'package:places/ui_my_app/ui_strings.dart';
import 'package:places/ui_widgets/headers.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  MySliverAppBar({
    required this.expandedHeight,
  });

  final double expandedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      children: [
        // Первоначальный заголовок
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: Container(
            color: Theme.of(context).canvasColor,
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 10,
              left: 50,
            ),
            width: 350,
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 34,
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
