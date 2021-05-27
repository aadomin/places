import 'package:flutter/material.dart';
import '../../domain/sight.dart';
import '../res/text_styles.dart';

class SightDetailsScreen extends StatelessWidget {
  final Sight sight;

  SightDetailsScreen(this.sight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        child: Image.network(
                          sight.url,
                          fit: BoxFit.fitHeight,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        child: Image.network(
                          sight.url,
                          fit: BoxFit.fitHeight,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 300,
                        child: Image.network(
                          sight.url,
                          fit: BoxFit.fitHeight,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
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
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Text(
                          sight.type,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '    закрыто до 09:00',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Text(
                      sight.details,
                      style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        print('построить');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_arrow,
                              size: 12,
                            ),
                            Text(
                              '  ПОСТРОИТЬ МАРШРУТ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () {
                            print('запланировать');
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: 12,
                              ),
                              Text(
                                '  Запланировать',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: TextButton(
                          onPressed: () {
                            print('в избранное');
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                size: 12,
                              ),
                              Text(
                                '  В избранное',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
