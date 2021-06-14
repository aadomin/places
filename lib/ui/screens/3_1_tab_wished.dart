import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../common.dart';

import '../elements/sight_card.dart';
import '../models/my_places_model.dart';
import '../../domain/sight.dart';

import '3_3_empty_list.dart';

class TabWished extends StatefulWidget {
  @override
  _TabWishedState createState() => _TabWishedState();
}

class _TabWishedState extends State<TabWished> {
  List<Sight> _listOfItems;
  @override
  Widget build(BuildContext context) {
    if (_listOfItems == null)
      _listOfItems = context.watch<MyPlacesModel>().wishedPlaces;

    if (_listOfItems.isEmpty) {
      return WidgetEmptyList(
          'Отмечайте понравившиеся места \nи они появятся здесь');
    } else {
      return Container(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: _listOfItems
                  .asMap()
                  .entries
                  .map((i) => SightCard(
                        i.value,
                        // key: GlobalKey(),
                        placeCardType: SightCardType.wished,
                        onDeleteFromList: () {
                          setState(() {
                            // реализовать потом удаление в модели
                            // context.watch<MyPlacesModel>().delFromWished(i.key);
                            _listOfItems.removeAt(i.key);
                          });
                        },
                      ))
                  .toList(),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
      );
    }
  }
}
