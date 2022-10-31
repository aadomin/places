import 'package:flutter/material.dart';
import 'package:places/domain_entities/place.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_widgets_commons/widget_my_image_ink.dart';
import 'package:places/ui_widgets_commons/widget_place_card_icons.dart';

///
/// Карточка места
///
class WidgetPlaceCard extends StatelessWidget {
  const WidgetPlaceCard({
    required this.place,
    required this.placeCardType,
    required this.onTap,
    this.onToggleWished,
    this.onAddToCalendar,
    this.onDeleteFromWished,
    this.onShare,
    this.onDeleteFromSeen,
    this.isLiked,
    Key? key,
  }) :
        // assert(
        //           ((placeCardType == PlaceCardType.general) &&
        //                   (isLiked != null) &&
        //                   (onDeleteAtAll != null) &&
        //                   (onToggleWished != null)) ||
        //               ((placeCardType == PlaceCardType.seen) &&
        //                   (onShare != null) &&
        //                   (onDeleteFromSeen != null)) ||
        //               ((placeCardType == PlaceCardType.wished) &&
        //                   (onAddToCalendar != null) &&
        //                   (onDeleteFromWished != null) &&
        //                   (isLiked != null)),
        //           'NТУТ'),
        super(key: key);

  final Place place;
  final PlaceCardType placeCardType;
  final bool? isLiked;

  final VoidCallback onTap;
  final VoidCallback? onToggleWished;
  final VoidCallback? onAddToCalendar;
  final VoidCallback? onDeleteFromWished;
  final VoidCallback? onShare;
  final VoidCallback? onDeleteFromSeen;

  @override
  Widget build(BuildContext context) {
    late void Function(DismissDirection _) onDismissedAction;
    String textWhenDeletion = '';

    switch (placeCardType) {
      case PlaceCardType.general:
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

    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Material(
        child: Ink(
          color: Theme.of(context).disabledColor,
          child: InkWell(
            onTap: onTap,
            child: (placeCardType == PlaceCardType.general)
                //
                // Карточка
                //
                ? widgetCardItself(context)

                //
                // Смещабельная карточка
                //
                : Dismissible(
                    key: ValueKey(place.id),
                    onDismissed: onDismissedAction,
                    // фон при смещении
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
                    // фон при смещении в другую сторону
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
                    //
                    // Card itselt
                    //
                    child: widgetCardItself(context),
                  ),
          ),
        ),
      ),
    );
  }

  ///  Card itselt
  Widget widgetCardItself(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Stack(
        children: [
          Column(
            children: [
              //
              // Картинка
              //
              SizedBox(
                width: double.infinity,
                height: 100,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Builder(builder: (context) {
                    String url = place.urls.isNotEmpty ? place.urls[0] : '';

                    //TODO(me): del
                    debugPrint(url + place.name);

                    if (url != '') {
                      return Hero(
                        tag: url + place.name,
                        child: WidgetMyImageInk(
                          url: url,
                          fit: BoxFit.fitWidth,
                        ),
                      );
                    } else {
                      return WidgetMyImageInk(
                        url: url,
                        // TODO(me): c Ink разобраться
                        fit: BoxFit.fitWidth,
                      );
                    }
                  }),
                ),
              ),
              //
              // Название места
              //
              Container(
                padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
                alignment: Alignment.topLeft,
                child: Text(
                  place.name,
                  maxLines: 1,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              //
              // Детальное описание
              //
              Container(
                padding: const EdgeInsets.only(top: 4, right: 16, left: 16),
                alignment: Alignment.topLeft,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(),
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
              place.type.toLowerCase(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          //
          // Icons on the top of card
          //
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(8),
            child: WidgetPlaceCardIcons(
              placeCardType: placeCardType,
              onDeleteFromSeen: onDeleteFromSeen,
              onDeleteFromWished: onDeleteFromWished,
              onAddToCalendar: onAddToCalendar,
              onToggleWished: onToggleWished,
              onShare: onShare,
              isLiked: isLiked,
            ),
          ),
        ],
      ),
    );
  }
}
