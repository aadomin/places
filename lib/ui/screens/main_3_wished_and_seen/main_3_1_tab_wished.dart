import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/enums.dart';
import 'package:places/ui_my_app/my_scroll_physics.dart';
import 'package:places/ui_widgets/place_card.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/main_3_3_empty_list.dart';
import 'package:places/ui/screens/place_details_screen/place_details_screen.dart';

import 'package:places/domain_models/place.dart';
import 'package:places/ui_interactors/place_interactor.dart';

class TabWished extends StatefulWidget {
  const TabWished({Key? key}) : super(key: key);

  @override
  _TabWishedState createState() => _TabWishedState();
}

class _TabWishedState extends State<TabWished> {
  @override
  Widget build(BuildContext context) {
    final List<Place> _listOfItems =
        context.watch<PlaceInteractor>().getFavoritesPlaces;

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
                        placeCardType: PlaceCardType.wished,
                        onTap: () {
                          onTapOnCard(i.value.id);
                        },
                        onAddToCalendar: () {
                          context.read<PlaceInteractor>().schedulePlace(
                                context,
                                i.value.id,
                              );
                        },
                        onDeleteFromWished: () {
                          context
                              .read<PlaceInteractor>()
                              .removeFromFavorites(_listOfItems[i.key].id);
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
      builder: (_) => PlaceDetailsScreen(
        placeId: id,
      ),
    );
  }
}
