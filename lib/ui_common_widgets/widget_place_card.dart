import 'package:flutter/material.dart';

import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_common_widgets/widget_my_image.dart';
import 'package:places/ui_common_widgets/widget_place_card_icons.dart';

import 'package:places/domain_models/place.dart';

/// Карточка места
class WidgetPlaceCard extends StatelessWidget {
  const WidgetPlaceCard({
    required this.place,
    required this.placeCardType,
    required this.onTap,
    this.onAddToWished,
    this.onAddToCalendar,
    this.onDeleteFromWished,
    this.onShare,
    this.onDeleteFromSeen,
    this.onDeleteAtAll,
    this.isLiked,
    Key? key,
  }) : super(key: key);

  final Place place;
  final PlaceCardType placeCardType;

  final VoidCallback onTap;

  final VoidCallback? onAddToWished;
  final VoidCallback? onAddToCalendar;
  final VoidCallback? onDeleteFromWished;
  final VoidCallback? onShare;
  final VoidCallback? onDeleteFromSeen;
  final VoidCallback? onDeleteAtAll;

  final bool? isLiked;

  @override
  Widget build(BuildContext context) {
    void Function(DismissDirection _) onDismissedAction;

    late String textWhenDeletion;
    switch (placeCardType) {
      case PlaceCardType.general:
        textWhenDeletion = UiStrings.delAtAll;
        onDismissedAction = (DismissDirection _) => onDeleteAtAll?.call();
        break;
      case PlaceCardType.seen:
        textWhenDeletion = UiStrings.delFromSeen;
        onDismissedAction = (DismissDirection _) => onDeleteFromSeen?.call();
        break;
      case PlaceCardType.wished:
        textWhenDeletion = UiStrings.delFromWished;
        onDismissedAction = (DismissDirection _) => onDeleteFromWished?.call();
        break;
    }

    return InkWell(
      onTap: onTap,
      child: Dismissible(
        key: ValueKey(place.id),
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
                Icon(
                  Icons.restore_from_trash,
                  color: Theme.of(context).canvasColor,
                ),
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
                      child: WidgetMyImage(
                        url: place.url[0],
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 16, right: 16, left: 16),
                    alignment: Alignment.topLeft,
                    child: Text(
                      place.name,
                      maxLines: 1,
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
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        //maxHeight: double.infinity,
                      ),
                      child: Text(
                        place.details,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                        ),
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
                  place.type,
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
                child: WidgetPlaceCardIcons(
                  placeCardType: placeCardType,
                  onDeleteFromSeen: onDeleteFromSeen,
                  onDeleteFromWished: onDeleteFromWished,
                  onAddToCalendar: onAddToCalendar,
                  onAddToWished: onAddToWished,
                  onShare: onShare,
                  isLiked: isLiked,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}