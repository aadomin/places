import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../common.dart';

import '../elements/sight_card.dart';
import '../models/my_places_model.dart';

import '../res/text_styles.dart';
import '../../domain/sight.dart';

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

    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.monochrome_photos,
                color: Colors.grey.shade300,
                size: 40,
              ),
              Text('Пусто',
                  style: tsVisitingScreenNoItemsHeader,
                  textAlign: TextAlign.center),
              Text(
                'Отмечайте понравившиеся места \nи они появятся здесь',
                style: tsVisitingScreenNoItemsText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: _listOfItems
                  .asMap()
                  .entries
                  .map((i) => SightCard(
                        i.value,
                        placeCardType: SightCardType.seen,
                        onTap: () {
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
        ),
      ],
    );
  }
}
