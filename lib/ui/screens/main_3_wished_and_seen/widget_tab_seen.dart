import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/enums.dart';
import 'package:places/ui_my_app/my_scroll_physics.dart';
import 'package:places/ui_widgets/place_card.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/widget_empty_list.dart';
import 'package:places/ui/screens/place_details_screen/screen_place_details.dart';

import 'package:places/domain_models/place.dart';
import 'package:places/ui_interactors/place_interactor.dart';

class WidgetTabSeen extends StatefulWidget {
  const WidgetTabSeen({Key? key}) : super(key: key);
  @override
  _WidgetTabSeenState createState() => _WidgetTabSeenState();
}

class _WidgetTabSeenState extends State<WidgetTabSeen> {
  @override
  Widget build(BuildContext context) {
    final List<Place> _listOfItems =
        context.watch<PlaceInteractor>().getVisitedPlaces;

    if (_listOfItems.isEmpty) {
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
            children: _listOfItems
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
                              .read<PlaceInteractor>()
                              .removeFromVisited(_listOfItems[i.key].id);
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
