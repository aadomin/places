import 'package:flutter/material.dart';

import 'package:places/enums.dart';
import 'package:places/ui/widgets/my_image_widget.dart';
import 'package:places/ui/widgets/sight_card_icons.dart';

import 'package:places/data/models/place.dart';

class SightCard extends StatelessWidget {
  const SightCard({
    required this.sight,
    required this.placeCardType,
    required this.onTap,
    required this.onDeleteFromList,
    required this.onAddToCalendar,
    Key? key,
  }) : super(key: key);

  final Sight sight;
  final SightCardType placeCardType;
  final VoidCallback onTap;
  final VoidCallback onDeleteFromList;

  final VoidCallback onAddToCalendar;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
          padding: const EdgeInsets.only(bottom: 16),
          //margin: const EdgeInsets.only(bottom: 16),
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
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
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
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
                    padding: const EdgeInsets.only(top: 4, right: 16, left: 16),
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
              //
              Container(
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Text(
                  sight.type,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              //
              // Icons on the top of card
              //
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(16),
                child: WidgetSightCardIcons(
                  placeCardType: placeCardType,
                  onDeleteFromList: onDeleteFromList,
                  onAddToCalendar: onAddToCalendar,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
