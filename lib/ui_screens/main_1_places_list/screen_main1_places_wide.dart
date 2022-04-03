import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_route_vm.dart';
import 'package:places/ui_screens/main_1_places_list/widget_my_sliver_app_bar.dart';
import 'package:places/ui_screens/main_1_places_list/widget_new_place_button.dart';
import 'package:places/ui_screens/main_1_places_list/widget_searching_header.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/my_scroll_physics.dart';
import 'package:places/ui_screens/place_details_screen/screen_place_details_di.dart';
import 'package:places/ui_widgets_commons/widget_place_card.dart';
import 'package:provider/provider.dart';

/// Экран 1. Список мест - широкий вариант в два столбца
/// Первый из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
/// Данный класс описывает ГЛАВНОЕ состояние экрана
///
class ScreenMain1PlacesWide extends StatelessWidget {
  ScreenMain1PlacesWide(
    this.___viewModel, {
    required this.filteredPlacesSnapshot,
    required this.criticalWidth,
    Key? key,
  }) : super(key: key);

  final ScreenMain1PlacesRouteVM ___viewModel;

  final List<Place> filteredPlacesSnapshot;

  final double criticalWidth;

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

              // ОСНОВНОЙ СПИСОК широкий вариат (в два столбеца)
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: criticalWidth,
                  // удачная формула соотношения
                  childAspectRatio:
                      MediaQuery.of(context).size.width / criticalWidth * 1.55,
                ),
                delegate: SliverChildListDelegate([
                  for (var i = 0; i < filteredPlacesSnapshot.length; i++)
                    Padding(
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
                        onToggleWished: () {
                          // ТУТВОПРОС
                          if (filteredPlacesSnapshot[i].wished) {
                            ___viewModel.onRemoveFromFavorites(
                                filteredPlacesSnapshot[i].id);
                          } else {
                            ___viewModel
                                .onAddToFavorites(filteredPlacesSnapshot[i].id);
                          }
                        },
                        onDeleteAtAll: () {
                          ___viewModel
                              .onRemoveAtAll(filteredPlacesSnapshot[i].id);
                        },
                      ),
                    ),
                ]),
              ),
            ],
          ),
          const WidgetNewPlaceButton(),
        ],
      ),
    );
  }

  void onTap(BuildContext context, int id) {
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
