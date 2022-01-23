import 'package:flutter/material.dart';

import 'package:places/ui_screens/place_details_screen/screen_place_details.dart';
import 'package:places/ui_widgets_commons/widget_my_image.dart';

import 'package:places/domain_models/place.dart';

/// Маленькая карточка места, например, для экрана поиска
class WidgetPlaceCartForSearch extends StatelessWidget {
  const WidgetPlaceCartForSearch({
    required this.place,
    Key? key,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            showModalBottomSheet<bool>(
              isScrollControlled: true,
              context: context,
              builder: (_) => ScreenPlaceDetails(
                placeId: place.id,
              ),
            );
          },
          leading: WidgetImageWithRoundedCorners(place: place),
          title: WidgetSearchDescriptionOfPlace(place: place),
        ),
        const Divider(),
      ],
    );
  }
}

class WidgetSearchDescriptionOfPlace extends StatelessWidget {
  const WidgetSearchDescriptionOfPlace({
    required this.place,
    Key? key,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.zero,
          child: Text(
            place.name,
            maxLines: 2,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(
          place.type,
          maxLines: 1,
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
      ],
    );
  }
}

class WidgetImageWithRoundedCorners extends StatelessWidget {
  const WidgetImageWithRoundedCorners({
    required this.place,
    Key? key,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        child: WidgetMyImage(
          url: place.url[0],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
