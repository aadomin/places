import 'dart:async';
import 'package:places/main.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_widgets/network_error_widget.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/enums.dart';
import 'package:places/ui_my_app/routes.dart';
import 'package:places/ui_my_app/ui_strings.dart';
import 'package:places/ui_my_app/my_scroll_physics.dart';
import 'package:places/ui/screens/main_1_places_list/main_1_widget_app_bar.dart';
import 'package:places/ui_widgets/place_card.dart';

import 'package:places/domain_models/place.dart';
import 'package:places/ui_interactors/place_interactor.dart';

class PlacesListScreen extends StatefulWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  _PlacesListScreenState createState() => _PlacesListScreenState();
}

class _PlacesListScreenState extends State<PlacesListScreen> {
  static const criticalWidth = 800.0;

  final FocusNode focusNode1 = FocusNode();

  final _placesListController = StreamController<List<Place>>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Place> filteredPlaces =
        context.watch<PlaceInteractor>().filteredPlaces;

    _placesListController.sink.add(filteredPlaces);

    return Scaffold(
      body: StreamBuilder<List<Place>>(
        stream: _placesListController.stream,
        builder: (context, snapshot) {
          final List<Place> filteredPlacesSnapshot = snapshot.data!;
          return placeInteractor.isRequestDoneWithError
              ? const NetworkErrorWidget()
              : Stack(
                  children: [
                    filteredPlacesSnapshot.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomScrollView(
                            physics: MyScrollPhysics.physics,
                            slivers: [
                              // Свой AppBar
                              SliverPersistentHeader(
                                delegate: MySliverAppBar(expandedHeight: 150.0),
                                pinned: true,
                              ),

                              // Поиск
                              _searchingHeader(context),

                              //
                              // ОСНОВНОЙ СПИСОК
                              // для маленьких экранов
                              //
                              if (MediaQuery.of(context).size.width <=
                                  criticalWidth)
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, i) => Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: PlaceCard(
                                        place: filteredPlacesSnapshot[i],
                                        placeCardType: PlaceCardType.general,
                                        isLiked:
                                            filteredPlacesSnapshot[i].wished,
                                        onTap: () {
                                          onTap(
                                            context,
                                            filteredPlacesSnapshot[i].id,
                                          );
                                        },
                                        onAddToWished: () {
                                          if (filteredPlacesSnapshot[i]
                                              .wished) {
                                            placeInteractor.removeFromFavorites(
                                                filteredPlacesSnapshot[i].id);
                                          } else {
                                            placeInteractor.addToFavorites(
                                                filteredPlacesSnapshot[i].id);
                                          }
                                        },
                                        onDeleteAtAll: () {
                                          placeInteractor.removeAtAll(
                                              filteredPlacesSnapshot[i].id);
                                        },
                                      ),
                                    ),
                                    childCount: filteredPlacesSnapshot.length,
                                  ),
                                ),
                              //
                              // для больших экранов
                              //
                              if (MediaQuery.of(context).size.width >
                                  criticalWidth)
                                SliverGrid(
                                  gridDelegate:
                                      SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: criticalWidth,
                                    // удачная формула соотношения
                                    childAspectRatio:
                                        MediaQuery.of(context).size.width /
                                            criticalWidth *
                                            1.55,
                                  ),
                                  delegate: SliverChildListDelegate([
                                    for (var i = 0;
                                        i < filteredPlacesSnapshot.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: PlaceCard(
                                          place: filteredPlacesSnapshot[i],
                                          placeCardType: PlaceCardType.general,
                                          onTap: () {
                                            onTap(context,
                                                filteredPlacesSnapshot[i].id);
                                          },
                                          onAddToWished: () {
                                            if (filteredPlacesSnapshot[i]
                                                .wished) {
                                              placeInteractor
                                                  .removeFromFavorites(
                                                      filteredPlacesSnapshot[i]
                                                          .id);
                                            } else {
                                              placeInteractor.addToFavorites(
                                                  filteredPlacesSnapshot[i].id);
                                            }
                                          },
                                          onDeleteAtAll: () {
                                            placeInteractor.removeAtAll(
                                                filteredPlacesSnapshot[i].id);
                                          },
                                        ),
                                      ),
                                  ]),
                                ),
                            ],
                          ),

                    // Кнопка НОВОЕ МЕСТО
                    _newPlaceButton(context),
                  ],
                );
        },
      ),
    );
  }

  // Заголовок "Поиск"
  Widget _searchingHeader(BuildContext context) {
    return SliverToBoxAdapter(
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
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
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Кнопка НОВОЕ МЕСТО
  Widget _newPlaceButton(BuildContext context) {
    return Padding(
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
    );
  }

  void onTap(BuildContext context, int id) {
    context.read<PlaceInteractor>().showModalDetailsScreen(context, id);
  }

  @override
  void dispose() {
    super.dispose();
    _placesListController.close();
  }
}
