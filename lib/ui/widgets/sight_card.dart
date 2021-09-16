import 'package:flutter/material.dart';

import 'package:places/enums.dart';
import 'package:places/ui/my_app/ui_strings.dart';
import 'package:places/ui/widgets/my_image_widget.dart';
import 'package:places/ui/widgets/sight_card_icons.dart';

import 'package:places/data/models/place.dart';

class SightCard extends StatelessWidget {
  const SightCard({
    required this.sight,
    required this.placeCardType,
    required this.onTap,
    this.onAddToWished,
    this.onAddToCalendar,
    this.onDeleteFromWished,
    this.onShare,
    this.onDeleteFromSeen,
    this.onDeleteAtAll,
    Key? key,
  }) : super(key: key);

  final Sight sight;
  final SightCardType placeCardType;

  final VoidCallback onTap;

  final VoidCallback? onAddToWished;
  final VoidCallback? onAddToCalendar;
  final VoidCallback? onDeleteFromWished;
  final VoidCallback? onShare;
  final VoidCallback? onDeleteFromSeen;
  final VoidCallback? onDeleteAtAll;

  @override
  Widget build(BuildContext context) {
    void Function(DismissDirection _) onDismissedAction;

    late String textWhenDeletion;
    switch (placeCardType) {
      case SightCardType.general:
        textWhenDeletion = UiStrings.delAtAll;
        onDismissedAction = (DismissDirection _) => onDeleteAtAll?.call();
        break;
      case SightCardType.seen:
        textWhenDeletion = UiStrings.delFromSeen;
        onDismissedAction = (DismissDirection _) => onDeleteFromSeen?.call();
        break;
      case SightCardType.wished:
        textWhenDeletion = UiStrings.delFromWished;
        onDismissedAction = (DismissDirection _) => onDeleteFromWished?.call();
        break;
    }

    return InkWell(
      onTap: onTap,
      child: Dismissible(
        key: ValueKey(sight.id),
        onDismissed: onDismissedAction,
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
                  textWhenDeletion,
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
                  textWhenDeletion,
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
                  onDeleteFromSeen: onDeleteFromSeen,
                  onDeleteFromWished: onDeleteFromWished,
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
