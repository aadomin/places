import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  final _radiusOfRoundElement = 32.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          leading: BackButton(
            color: Theme.of(context).primaryColor,
          ),
          elevation: 0,
          title: Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Очистить',
                style: TextStyle(fontSize: 16),
              ),
              style: TextButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 0, 16),
                child: Text(
                  'КАТЕГОРИИ',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(_radiusOfRoundElement),
                              ),
                              child: Container(
                                color: Colors.grey.shade300,
                                width: _radiusOfRoundElement * 2,
                                height: _radiusOfRoundElement * 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network('https://flutter.dev/assets/flutter-lockup-1caf6476beed76adec3c477586da54de6b552b2f42108ec5bc68dc63bae2df75.png'),
                                ),
                              ),
                            ),
                            Container(
                              width: _radiusOfRoundElement * 2,
                              height: _radiusOfRoundElement * 2,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.done,
                                        size: 18,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Отель'),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(_radiusOfRoundElement),
                              ),
                              child: Container(
                                color: Colors.grey.shade300,
                                width: _radiusOfRoundElement * 2,
                                height: _radiusOfRoundElement * 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: _radiusOfRoundElement * 2,
                              height: _radiusOfRoundElement * 2,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.done,
                                        size: 18,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Отель'),
                        ),
                      ],
                    ),
                  ),TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(_radiusOfRoundElement),
                              ),
                              child: Container(
                                color: Colors.grey.shade300,
                                width: _radiusOfRoundElement * 2,
                                height: _radiusOfRoundElement * 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Theme.of(context).accentColor,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: _radiusOfRoundElement * 2,
                              height: _radiusOfRoundElement * 2,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12.0),
                                  ),
                                  child: Container(
                                    color: Theme.of(context).primaryColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Icon(
                                        Icons.done,
                                        size: 18,
                                        color: Theme.of(context).canvasColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text('Отель'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
