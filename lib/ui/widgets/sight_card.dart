import 'package:flutter/material.dart';
import '../../domain/sight.dart';
import '../my_enums.dart';
import '../my_app/routes.dart';
import 'image.dart';

import 'sight_card_icons.dart';

class SightCard extends StatelessWidget {
  final Sight sight;
  final Function onDeleteFromList;
  final SightCardType placeCardType;
  final Key key;

  SightCard(
    this.sight, {
    this.key,
    this.placeCardType = SightCardType.general,
    this.onDeleteFromList,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ROUTE_DETAILS);
      },
      child: Dismissible(
        key: ObjectKey(sight),
        onDismissed: (direction) {
          onDeleteFromList();
        },
        background: Container(
          alignment: Alignment.centerLeft,
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restore_from_trash,
                    color: Theme.of(context).canvasColor),
                Text(
                  'Удалить',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.restore_from_trash,
                    color: Theme.of(context).canvasColor),
                Text(
                  'Удалить',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 16),
          margin: EdgeInsets.only(bottom: 16),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: MyImageWidget(
                        url: sight.url,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 16, right: 16, left: 16),
                    alignment: Alignment.topLeft,
                    child: Text(
                      sight.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4, right: 16, left: 16),
                    alignment: Alignment.topLeft,
                    child: Text(
                      sight.details,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                ],
              ),
              //
              // Type of place on the top of card
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  sight.type,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                width: double.infinity,
              ),
              //
              // Icons on the top of card
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(16),
                child: WidgetSightCardIcons(
                    placeCardType: placeCardType,
                    onDeleteFromList: onDeleteFromList),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
