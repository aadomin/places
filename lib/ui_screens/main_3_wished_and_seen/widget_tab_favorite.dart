import 'package:flutter/material.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';
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

/// Экран "Избранные и посещенные", вкладка "Избранные"
class WidgetTabFavorite extends StatefulWidget {
  const WidgetTabFavorite({
    required this.favoritePlaces,
    Key? key,
  }) : super(key: key);

  final List<Place> favoritePlaces;

  @override
  _WidgetTabFavoriteState createState() => _WidgetTabFavoriteState();
}

class _WidgetTabFavoriteState extends State<WidgetTabFavorite> {
  @override
  Widget build(BuildContext context) {
    final List<Place> _listOfItems = widget.favoritePlaces;

    final __popupManager = context.read<PopupManager>();

    if (_listOfItems.isEmpty) {
      return const WidgetEmptyList(
        imagePath: UiImagePaths.emptyFavoriteTab,
        headerLine: UiStrings.empty,
        commentLine: UiStrings.markFavotivePlacesAndItWillAppearHere,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: WidgetPlaceCard(
                          place: i.value,
                          placeCardType: PlaceCardType.wished,
                          onTap: () {
                            onTapOnCard(i.value.id);
                          },
                          onAddToCalendar: () {
                            __popupManager.showPopupSchedulePlace(
                              context,
                              i.value.id,
                            );
                          },
                          onDeleteFromWished: () {
                            context
                                .read<ScreenMain3FavAndVisitCubit>()
                                .removeFromFavorites(_listOfItems[i.key].id);
                          },
                        ),
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
