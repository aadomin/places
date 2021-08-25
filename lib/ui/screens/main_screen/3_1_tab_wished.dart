import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import 'package:places/domain/sight.dart';

import 'package:places/ui/my_enums.dart';
import 'package:places/ui/my_scroll_physics.dart';
import 'package:places/ui/widgets/sight_card.dart';

import '3_3_empty_list.dart';
import 'my_places_model.dart';
import 'package:places/ui/screens/sight_details_screen/sight_details_screen.dart';

class TabWished extends StatefulWidget {
  @override
  _TabWishedState createState() => _TabWishedState();
}

class _TabWishedState extends State<TabWished> {
  late List<Sight> _listOfItems;

  GlobalKey globalKey = GlobalKey();
  bool isDrag = false;
  int isDragOn = -1; // над каким элементов происходит drag

  @override
  Widget build(BuildContext context) {
    _listOfItems = context.watch<MyPlacesModel>().wishedPlaces;

    if (_listOfItems.isEmpty) {
      return WidgetEmptyList(
          'Отмечайте понравившиеся места \nи они появятся здесь');
    } else {
      return Container(
        alignment: Alignment.topCenter,
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
                          child: SightCard(
                            sight: i.value,
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                                builder: (_) => SightDetailsScreen(
                                  sightID: context
                                      .watch<MyPlacesModel>()
                                      .interestingPlaces[i.value.id]
                                      .id,
                                ),
                              );
                            },
                            // key: GlobalKey(),
                            placeCardType: SightCardType.wished,
                            onDeleteFromList: () {
                              setState(() {
                                // TODO реализовать потом удаление в модели
                                // context.watch<MyPlacesModel>().delFromWished(i.key);
                                _listOfItems.removeAt(i.key);
                              });
                            },
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
                                print('1');
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
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
      );
    }
  }
}
