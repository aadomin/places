import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/data/models/sight.dart';

import 'package:places/ui/my_enums.dart';
import 'package:places/ui/my_scroll_physics.dart';
import 'package:places/ui/widgets/sight_card.dart';

import 'package:places/ui/screens/main_screen/main_3_3_empty_list.dart';
import 'package:places/ui/screens/main_screen/main_screen_model.dart';
import 'package:places/ui/screens/sight_details_screen/sight_details_screen.dart';

class TabSeen extends StatefulWidget {
  const TabSeen({Key? key}) : super(key: key);

  @override
  _TabSeenState createState() => _TabSeenState();
}

class _TabSeenState extends State<TabSeen> {
  late List<Sight> _listOfItems;

  GlobalKey globalKey = GlobalKey();
  bool isDrag = false;
  int isDragOn = -1; // над каким элементов происходит drag

  @override
  Widget build(BuildContext context) {
    _listOfItems = context.watch<MainScreenModel>().seenPlaces;

    if (_listOfItems.isEmpty) {
      return const WidgetEmptyList(
        commentLine: 'Отмечайте посещенные места \nи они появятся здесь',
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
                .map((i) => Column(
                      children: [
                        Draggable<int>(
                          data: i.key,
                          feedback: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red.shade400,
                            ),
                            child: Icon(Icons.move_to_inbox_rounded,
                                color: Theme.of(context).accentColor),
                          ),
                          onDragStarted: () {
                            setState(() {
                              isDrag = true;
                            });
                          },
                          onDragEnd: (details) {
                            setState(() {
                              isDrag = false;
                              isDragOn = -1;
                            });
                          },
                          child: SightCard(
                            sight: i.value,
                            // key: GlobalKey(),
                            placeCardType: SightCardType.seen,
                            onAddToCalendar: () {},
                            onTap: () {
                              showModalBottomSheet<bool>(
                                isScrollControlled: true,
                                context: context,
                                builder: (_) => SightDetailsScreen(
                                  sightID: context
                                      .watch<MainScreenModel>()
                                      .interestingPlaces[i.value.id]
                                      .id,
                                ),
                              );
                            },
                            onDeleteFromList: () {
                              setState(() {
                                // TODO реализовать потом удаление в модели
                                // context.watch<MainScreenModel>().delFromSeen(i.key);
                                _listOfItems.removeAt(i.key);
                              });
                            },
                          ),
                        ),
                        if (i.key + 1 != _listOfItems.length)
                          DragTarget<int>(
                            builder: (context, candidateData, rejectedData) {
                              return Container(
                                width: 300,
                                height: 20,
                                color: isDrag
                                    ? isDragOn == i.key
                                        ? Colors.green
                                        : Colors.yellow
                                    : Theme.of(context).canvasColor,
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.arrow_upward_outlined,
                                        size: 20,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                      Icon(
                                        Icons.arrow_downward_outlined,
                                        size: 20,
                                        color: Theme.of(context).canvasColor,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            onWillAccept: (int? data) {
                              isDragOn = i.key;
                              return true;
                            },
                            onLeave: (data) {
                              isDragOn = -1;
                            },
                            onAccept: (int data) {
                              setState(() {
                                // print('1');
                                _listOfItems.insert(
                                  isDragOn + 1,
                                  _listOfItems.removeAt(i.key),
                                );
                              });

                              // var j = (int.parse(data) + 1).toString();
                              // var k = (isDragOn + 1).toString();

                              // setState(() {});
                              // print('22');
                            },
                          ),
                      ],
                    ))
                .toList(),
          ),
        ),
      );
    }
  }
}
