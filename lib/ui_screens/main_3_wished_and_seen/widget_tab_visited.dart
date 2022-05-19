import 'package:flutter/material.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/widget_empty_list.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_cubit.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_di.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_widgets_commons/widget_place_card.dart';
import 'package:places/domain_models/place.dart';

/// Экран "Избранные и посещенные", вкладка "Посещенные"
class WidgetTabVisited extends StatefulWidget {
  const WidgetTabVisited({
    required this.visitedPlaces,
    Key? key,
  }) : super(key: key);

  final List<Place> visitedPlaces;

  @override
  _WidgetTabVisitedState createState() => _WidgetTabVisitedState();
}

class _WidgetTabVisitedState extends State<WidgetTabVisited> {
  @override
  Widget build(BuildContext context) {
    final List<Place> _visitedPlaces = widget.visitedPlaces;

    if (_visitedPlaces.isEmpty) {
      return const WidgetEmptyList(
        imagePath: UiImagePaths.emptySeenTab,
        headerLine: UiStrings.empty,
        commentLine: UiStrings.markSeenPlacesAndItWillAppearHere,
      );
    } else {
      return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView(
            physics: MyScrollPhysics.physics,
            children: _visitedPlaces
                .asMap()
                .entries
                .map(
                  (i) => Column(
                    children: [
                      WidgetPlaceCard(
                        place: i.value,
                        placeCardType: PlaceCardType.seen,
                        onTap: () {
                          onTapOnCard(i.value.id);
                        },
                        onShare: () {
                          // TODO(me): реализовать sharing
                        },
                        onDeleteFromSeen: () {
                          context
                              .read<ScreenMain3FavAndVisitCubit>()
                              .removeFromVisited(_visitedPlaces[i.key].id);
                        },
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      );
    }
  }

  void onTapOnCard(int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => createScreenPlaceDetails(
        context: context,
        placeId: id,
      ),
    );
  }
}
