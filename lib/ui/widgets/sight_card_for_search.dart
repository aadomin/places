import 'package:flutter/material.dart';
import 'package:places/ui/screens/sight_details_screen/sight_details_screen.dart';
import 'package:places/data/models/sight.dart';
import 'package:places/ui/widgets/my_image_widget.dart';

class SightCartForSearch extends StatelessWidget {
  const SightCartForSearch({
    required this.sight,
    Key? key,
  }) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            showModalBottomSheet<bool>(
              isScrollControlled: true,
              context: context,
              builder: (_) => SightDetailsScreen(
                sightID: sight.id,
              ),
            );
          },
          leading: WidgetImageWithRoundedCorners(sight: sight),
          title: WidgetSearchDescriptionOfPlace(sight: sight),
        ),
        const Divider(),
      ],
    );
  }
}

class WidgetSearchDescriptionOfPlace extends StatelessWidget {
  const WidgetSearchDescriptionOfPlace({
    required this.sight,
    Key? key,
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
    required this.sight,
    Key? key,
  }) : super(key: key);

  final Sight sight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
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
