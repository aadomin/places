import 'package:flutter/material.dart';
import 'package:places/data/models/place.dart';
import 'package:provider/provider.dart';

import 'package:places/enums.dart';
import 'package:places/ui/my_app/routes.dart';
import 'package:places/ui/my_app/ui_strings.dart';
import 'package:places/ui/my_app/my_scroll_physics.dart';
import 'package:places/ui/screens/main_1_places_list/main_1_widget_app_bar.dart';
import 'package:places/ui/widgets/place_card.dart';

import 'package:places/data/interactors/place_interactor.dart';

class PlacesListScreen extends StatelessWidget {
  PlacesListScreen({Key? key}) : super(key: key);

  final FocusNode focusNode1 = FocusNode();

  static const criticalWidth = 800.0;

  @override
  Widget build(BuildContext context) {
    final List<Place> filteredPlaces =
        context.watch<PlaceInteractor>().filteredPlaces;

    final placeInteractor = Provider.of<PlaceInteractor>(context);

    return Scaffold(
      body: Stack(
        children: [
          filteredPlaces.isEmpty
              ? Center(child: const CircularProgressIndicator())
              : CustomScrollView(
                  physics: MyScrollPhysics.physics,
                  slivers: [
                    // Свой AppBar
                    SliverPersistentHeader(
                      delegate: MySliverAppBar(expandedHeight: 150.0),
                      pinned: true,
                    ),

                    // Поиск
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Stack(
                          children: [
                            TextField(
                              focusNode: focusNode1,
                              readOnly: true,
                              onTap: () {
                                focusNode1.unfocus();
                                Navigator.pushNamed(context, ROUTE_SEARCH);
                              },
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search, size: 15),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                hintText: UiStrings.searching,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: () {
                                  focusNode1.unfocus();
                                  Navigator.pushNamed(context, ROUTE_FILTER);
                                },
                                icon: Icon(
                                  Icons.settings,
                                  size: 15,
                                  color: Theme.of(context).accentColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

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
                              place: filteredPlaces[i],
                              placeCardType: PlaceCardType.general,
                              onTap: () {
                                onTap(context, filteredPlaces[i].id);
                              },
                              onAddToWished: () {
                                if (filteredPlaces[i].wished) {
                                  placeInteractor.removeFromFavorites(
                                      filteredPlaces[i].id);
                                } else {
                                  placeInteractor
                                      .addToFavorites(filteredPlaces[i].id);
                                }
                              },
                              onDeleteAtAll: () {
                                placeInteractor
                                    .removeAtAll(filteredPlaces[i].id);
                              },
                            ),
                          ),
                          childCount: filteredPlaces.length,
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
                          childAspectRatio: MediaQuery.of(context).size.width /
                              criticalWidth *
                              1.55,
                        ),
                        delegate: SliverChildListDelegate([
                          for (var i = 0; i < filteredPlaces.length; i++)
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: PlaceCard(
                                place: filteredPlaces[i],
                                placeCardType: PlaceCardType.wished,
                                onTap: () {
                                  onTap(context, filteredPlaces[i].id);
                                },
                                onAddToWished: () {
                                  if (filteredPlaces[i].wished) {
                                    placeInteractor.removeFromFavorites(
                                        filteredPlaces[i].id);
                                  } else {
                                    placeInteractor
                                        .addToFavorites(filteredPlaces[i].id);
                                  }
                                },
                                onDeleteAtAll: () {
                                  placeInteractor
                                      .removeAtAll(filteredPlaces[i].id);
                                },
                              ),
                            ),
                        ]),
                      ),
                  ],
                ),

          //
          // Кнопка НОВОЕ МЕСТО
          //
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ROUTE_ADD);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(UiStrings.newPlace),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      // отладка
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          (context as Element).markNeedsBuild();
        },
      ),
    );
  }

  void onTap(BuildContext context, int id) {
    context.read<PlaceInteractor>().showModalDetailsScreen(context, id);
  }
}
