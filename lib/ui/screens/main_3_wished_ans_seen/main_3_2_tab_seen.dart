import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/enums.dart';
import 'package:places/ui/my_app/my_scroll_physics.dart';
import 'package:places/ui/my_app/platform_detector.dart';
import 'package:places/ui/widgets/sight_card.dart';
import 'package:places/ui/screens/main_3_wished_ans_seen/main_3_3_empty_list.dart';
import 'package:places/ui/widgets/widget_add_to_calendar_cuper_modal.dart';
import 'package:places/ui/screens/sight_details_screen/sight_details_screen.dart';

import 'package:places/data/models/place.dart';
import 'package:places/data/interactors/place_interactor.dart';

class TabSeen extends StatefulWidget {
  const TabSeen({Key? key}) : super(key: key);

  @override
  _TabSeenState createState() => _TabSeenState();
}

class _TabSeenState extends State<TabSeen> {
  late List<Sight> _listOfItems;

  @override
  Widget build(BuildContext context) {
    _listOfItems = context.watch<PlaceInteractor>().getVisitedPlaces;

    if (_listOfItems.isEmpty) {
      return const WidgetEmptyList(
        commentLine: 'Отмечайте понравившиеся места \nи они появятся здесь',
      );
    } else {
      return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView(
            physics: MyScrollPhysics.physics,
            children: _listOfItems
                .asMap()
                .entries
                .map(
                  (i) => Column(
                    children: [
                      SightCard(
                        sight: i.value,
                        placeCardType: SightCardType.seen,
                        onTap: () {
                          onTapOnCard(i.value.id);
                        },
                        onDeleteFromList: () {
                          onDeleteFromList(i.key);
                        },
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      );
    }
  }

  void onTapOnCard(int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => SightDetailsScreen(
        sightID: id,
      ),
    );
  }

  // Future<void> onAddToCalendar() async {
  //   late final DateTime? _result;
  //   if (PlatformDetector.isAndroid || PlatformDetector.isWeb) {
  //     _result = await showDatePicker(
  //       context: context,
  //       initialDate: DateTime.now(),
  //       firstDate: DateTime.now().subtract(const Duration(days: 1)),
  //       lastDate: DateTime.now().add(const Duration(days: 365)),
  //     );
  //   }
  //   if (PlatformDetector.isIOS) {
  //     _result = await showCupertinoModalPopup(
  //       context: context,
  //       builder: (context) {
  //         return const AddToCalendarCuperModal();
  //       },
  //     );
  //   }

  //   if (_result != null) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('added to calendar at $_result'),
  //       ),
  //     );
  //   }
  // }

  void onDeleteFromList(int index) {
    setState(() {
      _listOfItems.removeAt(index);
    });
  }
}
