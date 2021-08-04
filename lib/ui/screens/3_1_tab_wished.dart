import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import '../../common.dart';

import '../elements/sight_card.dart';
import '../models/my_places_model.dart';
import '../../domain/sight.dart';

import '3_3_empty_list.dart';

import 'dart:io';

class TabWished extends StatefulWidget {
  @override
  _TabWishedState createState() => _TabWishedState();
}

class _TabWishedState extends State<TabWished> {
  List<Sight> _listOfItems;

  GlobalKey globalKey = GlobalKey();
  bool isDrag = false;
  int isDragOn = -1; // над каким элементов происходит drag

  @override
  Widget build(BuildContext context) {
    if (_listOfItems == null)
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
            physics: Platform.isAndroid
                ? ClampingScrollPhysics()
                : BouncingScrollPhysics(),
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
                            i.value,
                            // key: GlobalKey(),
                            placeCardType: SightCardType.wished,
                            onDeleteFromList: () {
                              setState(() {
                                // реализовать потом удаление в модели
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
                            onWillAccept: (int data) {
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
