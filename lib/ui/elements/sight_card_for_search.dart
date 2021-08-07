import 'package:flutter/material.dart';
import '../../domain/sight.dart';
import '../../routes.dart';
import 'image.dart';

class SightCartForSearch extends StatelessWidget {
  final Sight sight;

  SightCartForSearch(this.sight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, ROUTE_DETAILS);
          },
          leading: WidgetImageWithRoundedCorners(sight: sight),
          title: WidgetSearchDescriptionOfPlace(sight: sight),
        ),
        Divider(),
      ],
    );
  }
}

class WidgetSearchDescriptionOfPlace extends StatelessWidget {
  const WidgetSearchDescriptionOfPlace({
    Key key,
    @required this.sight,
  }) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Text(
            sight.name,
            maxLines: 2,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          sight.type,
          maxLines: 1,
          style: TextStyle(color: Theme.of(context).primaryColorLight),
        ),
      ],
    );
  }
}

class WidgetImageWithRoundedCorners extends StatelessWidget {
  const WidgetImageWithRoundedCorners({
    Key key,
    @required this.sight,
  }) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        child: MyImageWidget(
          url: sight.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
