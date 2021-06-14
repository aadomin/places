import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../common.dart';

import '../elements/sight_card.dart';
import '../models/my_places_model.dart';

import '../res/text_styles.dart';

class TabWished extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> _listOfWishedPlaces = context
        .watch<MyPlacesModel>()
        .wishedPlaces
        .map((i) => SightCard(
              i,
              placeCardType: SightCardType.wished,
            ))
        .toList();

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
              children: _listOfWishedPlaces,
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
