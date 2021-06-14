import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/models/my_places_model.dart';
import '../elements/sight_card.dart';

import '../../routes.dart';
import '../../common.dart';

class SightListScreen extends StatelessWidget {
  final FocusNode focusNode1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        title: Padding(
          padding: EdgeInsets.only(
            top: 60,
          ),
          child: Container(
            width: 290,
            height: 90,
            padding: EdgeInsets.only(bottom: 10),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                text: 'Список интересных мест',
              ),
            ),
          ),
        ),
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Stack(
                    children: [
                      TextField(
                        focusNode: focusNode1,
                        readOnly: true,
                        onTap: () {
                          focusNode1.unfocus();
                          Navigator.pushNamed(context, ROUTE_SEARCH);
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search, size: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          hintText: 'Поиск',
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          onPressed: () {
                            focusNode1.unfocus();
                            Navigator.pushNamed(context, ROUTE_FILTER);
                          },
                          icon: Icon(
                            Icons.settings,
                            size: 15,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    for (var i = 0;
                        i <
                            context
                                .watch<MyPlacesModel>()
                                .interestingPlaces
                                .length;
                        i++)
                      SightCard(
                        context.watch<MyPlacesModel>().interestingPlaces[i],
                        placeCardType: SightCardType.general,
                        onDeleteFromList: () {},
                      ),
                  ],
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ROUTE_ADD);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text('НОВОЕ МЕСТО'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
