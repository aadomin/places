import 'package:flutter/material.dart';

import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';
import 'package:places/ui_screens/main_1_places_list/widget_my_sliver_app_bar.dart';
import 'package:places/ui_screens/main_1_places_list/widget_new_place_button.dart';
import 'package:places/ui_screens/main_1_places_list/widget_searching_header.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_widgets_commons/widget_place_card.dart';

/// Экран 1. Список мест - узкий вариант
/// Первый из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
/// Данный класс описывает ГЛАВНОЕ состояние экрана
///
class ScreenMain1PlacesNarrow extends StatelessWidget {
  ScreenMain1PlacesNarrow({
    required this.filteredPlacesSnapshot,
    Key? key,
  }) : super(key: key);

  final List<Place> filteredPlacesSnapshot;

  final FocusNode focusNode1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: MyScrollPhysics.physics,
            slivers: [
              // Свой AppBar
              SliverPersistentHeader(
                delegate: WidgetMySliverAppBar(expandedHeight: 150.0),
                pinned: true,
              ),

              // Заголовок "Поиск"
              WidgetSearchingHeader(focusNode1: focusNode1),

              // ОСНОВНОЙ СПИСОК узкий вариат (в один столбец)
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, i) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: WidgetPlaceCard(
                      place: filteredPlacesSnapshot[i],
                      placeCardType: PlaceCardType.general,
                      isLiked: filteredPlacesSnapshot[i].wished,
                      onTap: () {
                        onTap(
                          context,
                          filteredPlacesSnapshot[i].id,
                        );
                      },
                      onAddToWished: () {
                        if (filteredPlacesSnapshot[i].wished) {
                          placeVM.removeFromFavorites(
                              filteredPlacesSnapshot[i].id);
                        } else {
                          placeVM
                              .addToFavorites(filteredPlacesSnapshot[i].id);
                        }
                      },
                      onDeleteAtAll: () {
                        placeVM
                            .removeAtAll(filteredPlacesSnapshot[i].id);
                      },
                    ),
                  ),
                  childCount: filteredPlacesSnapshot.length,
                ),
              ),
            ],
          ),
          // Кнопка внизу
          const WidgetNewPlaceButton(),
        ],
      ),
    );
  }

  void onTap(BuildContext context, int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => ScreenPlaceDetails(
        placeId: id,
      ),
    );
  }
}
