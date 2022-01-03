import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_blocs/places_cubit.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/enums.dart';
import 'package:places/ui_my_app/my_scroll_physics.dart';
import 'package:places/ui_widgets/place_card.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/widget_empty_list.dart';
import 'package:places/ui/screens/place_details_screen/screen_place_details.dart';

import 'package:places/domain_models/place.dart';

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
        commentLine: 'Отмечайте понравившиеся места \nи они появятся здесь',
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
                      PlaceCard(
                        place: i.value,
                        placeCardType: PlaceCardType.seen,
                        onTap: () {
                          onTapOnCard(i.value.id);
                        },
                        onShare: () {
                          //TODO implement sharing
                        },
                        onDeleteFromSeen: () {
                          context
                              .read<PlacesCubit>()
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
      builder: (_) => ScreenPlaceDetails(
        placeId: id,
      ),
    );
  }
}
