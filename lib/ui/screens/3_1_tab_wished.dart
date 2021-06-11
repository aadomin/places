import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../common.dart';

import '../elements/sight_card.dart';
import '../models/my_places_model.dart';

import '../res/text_styles.dart';
import '../../domain/sight.dart';

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
                        // key: GlobalKey(),
                        placeCardType: SightCardType.wished,
                        onTap: () {
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
          decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
          ),
        ),
      ],
    );
  }
}
