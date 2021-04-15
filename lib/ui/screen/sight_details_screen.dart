import 'package:flutter/material.dart';
import '../../domain/sight.dart';
import '../../mocks.dart';
import '../res/text_styles.dart';

class SightDetailsScreen extends StatelessWidget {
  final Sight sight;

  SightDetailsScreen(this.sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.brown.shade400,
                      child: Text(
                        "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50",
                        style: styleTemporaryText,
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.green.shade200,
                      child: Text(
                        "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50",
                        style: styleTemporaryText,
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      color: Colors.blue.shade200,
                      child: Text(
                        "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50",
                        style: styleTemporaryText,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                margin: EdgeInsets.only(
                  top: 32,
                  left: 16,
                ),
                child: Center(
                  child: Text(
                    '<',
                    style: styleButtons,
                  ),
                ),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              top: 32,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(
                    bottom: 2,
                  ),
                  child: Text(
                    sight.name,
                    style: styleH2,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Text(
                        sight.type,
                        style: styleDetailType,
                      ),
                      Text(
                        '    закрыто до 09:00',
                        style: styleDetailClosed,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                  child: Text(
                    sight.details,
                    style: styleMainText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  margin: EdgeInsets.only(
                    top: 32,
                  ),
                  child: Center(
                    child: Text(
                      'ПОСТРОИТЬ МАРШРУТ',
                      style: styleMaterialButtonsW,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 8,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Запланировать',
                          style: styleMaterialButtonsB,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'В Избранное',
                          style: styleMaterialButtonsB,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
