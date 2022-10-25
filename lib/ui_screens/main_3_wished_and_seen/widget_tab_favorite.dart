import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/domain_entities/place.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/my_circle_progress_indicator.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/widget_empty_list.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_di.dart';
import 'package:places/ui_widgets_commons/widget_place_card.dart';
import 'package:provider/provider.dart';

/// Экран "Избранные и посещенные", вкладка "Избранные"
class WidgetTabFavorite extends StatefulWidget {
  const WidgetTabFavorite({
    required this.favoritePlaces,
    required this.isLoading,
    required this.onRemoveFromFavorites,
    Key? key,
  }) : super(key: key);

  final List<Place> favoritePlaces;
  final bool isLoading;
  final void Function(int) onRemoveFromFavorites;

  @override
  _WidgetTabFavoriteState createState() => _WidgetTabFavoriteState();
}

class _WidgetTabFavoriteState extends State<WidgetTabFavorite> {
  @override
  Widget build(BuildContext context) {
    final List<Place> ___listOfItems = widget.favoritePlaces;

    final ___popupManager = context.read<DI>().popupManager;

    if (widget.isLoading) {
      return const Center(
          child: MyCircleProgressIndicator(isBigAndColorful: false));
    }
    if (___listOfItems.isEmpty) {
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
            children: ___listOfItems
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
                            ___popupManager.showPopupSchedulePlace(
                              context,
                              i.value.id,
                            );
                          },
                          onDeleteFromWished: () {
                            widget.onRemoveFromFavorites(
                                ___listOfItems[i.key].id);
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
