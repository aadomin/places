import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';
import 'package:places/ui/screens/main_1_places_list/widget_my_sliver_app_bar.dart';
import 'package:places/ui/screens/main_1_places_list/widget_new_place_button.dart';
import 'package:places/ui/screens/main_1_places_list/widget_searching_header.dart';
import 'package:places/ui_interactors/place_interactor.dart';
import 'package:places/ui_my_app/enums.dart';
import 'package:places/ui_my_app/my_scroll_physics.dart';
import 'package:places/ui_widgets/place_card.dart';
import 'package:provider/provider.dart';

class WidgetMainList extends StatelessWidget {
  WidgetMainList({
    required this.filteredPlacesSnapshot,
    Key? key,
  }) : super(key: key);

  final List<Place> filteredPlacesSnapshot;

  final FocusNode focusNode1 = FocusNode();

  static const criticalWidth = 800.0;

  @override
  Widget build(BuildContext context) {
    if (filteredPlacesSnapshot.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return CustomScrollView(
      physics: MyScrollPhysics.physics,
      slivers: [
        // Свой AppBar
        SliverPersistentHeader(
          delegate: WidgetMySliverAppBar(expandedHeight: 150.0),
          pinned: true,
        ),

        // Заголовок "Поиск"
        WidgetSearchingHeader(focusNode1: focusNode1),

        //
        // ОСНОВНОЙ СПИСОК
        // для маленьких экранов
        //
        if (MediaQuery.of(context).size.width <= criticalWidth)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: PlaceCard(
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
                      placeInteractor
                          .removeFromFavorites(filteredPlacesSnapshot[i].id);
                    } else {
                      placeInteractor
                          .addToFavorites(filteredPlacesSnapshot[i].id);
                    }
                  },
                  onDeleteAtAll: () {
                    placeInteractor.removeAtAll(filteredPlacesSnapshot[i].id);
                  },
                ),
              ),
              childCount: filteredPlacesSnapshot.length,
            ),
          ),
        //
        // для больших экранов
        //
        if (MediaQuery.of(context).size.width > criticalWidth)
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
                  child: PlaceCard(
                    place: filteredPlacesSnapshot[i],
                    placeCardType: PlaceCardType.general,
                    onTap: () {
                      onTap(context, filteredPlacesSnapshot[i].id);
                    },
                    onAddToWished: () {
                      if (filteredPlacesSnapshot[i].wished) {
                        placeInteractor
                            .removeFromFavorites(filteredPlacesSnapshot[i].id);
                      } else {
                        placeInteractor
                            .addToFavorites(filteredPlacesSnapshot[i].id);
                      }
                    },
                    onDeleteAtAll: () {
                      placeInteractor.removeAtAll(filteredPlacesSnapshot[i].id);
                    },
                  ),
                ),
            ]),
          ),
      ],
    );
  }

  void onTap(BuildContext context, int id) {
    context.read<PlaceInteractor>().showModalDetailsScreen(context, id);
  }
}
