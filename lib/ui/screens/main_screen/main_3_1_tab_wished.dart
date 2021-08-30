import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/domain/sight.dart';

import 'package:places/ui/my_enums.dart';
import 'package:places/ui/my_scroll_physics.dart';
import 'package:places/ui/widgets/sight_card.dart';

import 'package:places/ui/screens/main_screen/main_3_3_empty_list.dart';
import 'package:places/ui/screens/main_screen/main_screen_model.dart';
import 'package:places/ui/screens/sight_details_screen/sight_details_screen.dart';

class TabWished extends StatefulWidget {
  const TabWished({Key? key}) : super(key: key);

  @override
  _TabWishedState createState() => _TabWishedState();
}

class _TabWishedState extends State<TabWished> {
  late List<Sight> _listOfItems;
  late List<Sight> _allInterestingPlaces;

  @override
  Widget build(BuildContext context) {
    _listOfItems = context.watch<MainScreenModel>().wishedPlaces;
    _allInterestingPlaces = context.watch<MainScreenModel>().interestingPlaces;

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
                        placeCardType: SightCardType.wished,
                        onTap: () {
                          onTap(i.value.id);
                        },
                        onDeleteFromList: () {
                          onDeleteFromList(i.key);
                        },
                        onAddToCalendar: onAddToCalendar,
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

  void onTap(int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => SightDetailsScreen(
        sightID: _allInterestingPlaces[id].id,
      ),
    );
  }

  Future<void> onAddToCalendar() async {
    final res = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (res != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('added to calendar at $res'),
        ),
      );
    }
  }

  void onDeleteFromList(int index) {
    setState(() {
      _listOfItems.removeAt(index);
    });
  }
}
