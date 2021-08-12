import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/screens/main_screen/my_places_model.dart';
import 'package:places/ui/widgets/sight_card.dart';

import 'package:places/ui/my_app/routes.dart';
import 'package:places/ui/my_enums.dart';

import 'package:places/ui/widgets/headers.dart';
import 'package:places/ui/res/UiStrings.dart';

import 'package:places/ui/my_scroll_physics.dart';

class SightListScreen extends StatelessWidget {
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
                delegate: _MySliverAppBar(expandedHeight: 150.0),
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
                          prefixIcon: Icon(Icons.search, size: 15),
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

              // ОСНОВНОЙ СПИСОК
              SliverList(
                delegate: SliverChildListDelegate([
                  for (var i = 0;
                      i <
                          context
                              .watch<MyPlacesModel>()
                              .interestingPlaces
                              .length;
                      i++)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SightCard(
                        context.watch<MyPlacesModel>().interestingPlaces[i],
                        placeCardType: SightCardType.general,
                        onDeleteFromList: () {},
                      ),
                    ),
                ]),
              ),
            ],
          ),

          // Кнопка НОВОЕ МЕСТО
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
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
    );
  }
}

class _MySliverAppBar extends SliverPersistentHeaderDelegate {
  _MySliverAppBar({@required this.expandedHeight});

  final double expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        // Первоначальный заголовок
        Opacity(
          opacity: 1 - shrinkOffset / expandedHeight,
          child: Container(
            color: Theme.of(context).canvasColor,
            padding: EdgeInsets.only(
              top: 40,
              bottom: 10,
              left: 50,
            ),
            width: 350,
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                text: UiStrings.listOfInterestingPlaces,
              ),
            ),
          ),
        ),

        // Постоянный заголовок
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            color: Theme.of(context).canvasColor,
            child: Center(
              child: WidgetMyHeader(header: UiStrings.listOfInterestingPlaces),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
