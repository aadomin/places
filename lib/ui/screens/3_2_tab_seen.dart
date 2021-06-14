import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../common.dart';

import '../elements/sight_card.dart';
import '../models/my_places_model.dart';

import '../../domain/sight.dart';

import '3_3_empty_list.dart';

class TabSeen extends StatefulWidget {
  @override
  _TabSeenState createState() => _TabSeenState();
}

class _TabSeenState extends State<TabSeen> {
  List<Sight> _listOfItems;
  @override
  Widget build(BuildContext context) {
    if (_listOfItems == null)
      _listOfItems = context.watch<MyPlacesModel>().seenPlaces;

    if (_listOfItems.isEmpty) {
      return WidgetEmptyList('Отмечайте посещенные места \nи они появятся здесь');
    } else {
      return Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(
            children: _listOfItems
                .asMap()
                .entries
                .map((i) => SightCard(
                      i.value,
                      placeCardType: SightCardType.seen,
                      onDeleteFromList: () {
                        setState(() {
                          // реализовать потом удаление в модели
                          // context.watch<MyPlacesModel>().delFromSeen(i.key);
                          _listOfItems.removeAt(i.key);
                        });
                      },
                    ))
                .toList(),
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
      );
    }
  }
}

