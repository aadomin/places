import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/screens/filter_screen/filters_model.dart';
import 'package:places/ui/my_scroll_physics.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final _radiusOfRoundElement = 26.0;

  double _sliderValue = 0;

  final List<String> _distanceList = [
    'от 1м до 50м',
    'от 50м до 100м',
    'от 100м до 200м',
    'от 200м до 300м',
    'от 400м до 600м',
    'от 600м до 1км',
    'от 1км до 2км',
    'от 2км до 5км',
    'от 5км до 10км',
    'от 10км до 50км',
    'от 50км до 200км',
  ];

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
              onPressed: () {
                context.read<MyFilterModel>().clearSelection();
              },
              style: TextButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
              child: const Text(
                'Очистить',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 24, 0, 24),
                child: Text(
                  'КАТЕГОРИИ',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 260,
              child: Padding(
                padding: EdgeInsets.zero,
                child: GridView.count(
                  crossAxisCount: 3,
                  physics: MyScrollPhysics.physics,
                  children: [
                    for (var i = 0;
                        i < context.watch<MyFilterModel>().filterItems.length;
                        i++)
                      SizedBox(
                        width: 110,
                        height: 95,
                        child: TextButton(
                          onPressed: () {
                            context.read<MyFilterModel>().switchSelection(i);
                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(_radiusOfRoundElement),
                                    ),
                                    child: Container(
                                      color: const Color(0x4fbAbAbF),
                                      width: _radiusOfRoundElement * 2,
                                      height: _radiusOfRoundElement * 2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Center(
                                          child: Image.asset(
                                            context
                                                .watch<MyFilterModel>()
                                                .filterItems[i]
                                                .assetPath,
                                            width: 32,
                                            height: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  context
                                          .watch<MyFilterModel>()
                                          .filterItems[i]
                                          .isSelected
                                      ? CheckmarkWidget(
                                          radiusOfRoundElement:
                                              _radiusOfRoundElement)
                                      : const SizedBox.shrink(),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
                                child: Text(
                                  context
                                      .watch<MyFilterModel>()
                                      .filterItems[i]
                                      .name,
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Расстояние',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              trailing: Text(
                _distanceList[(_sliderValue * 10).toInt()].toString(),
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
              onTap: () {},
            ),
            Slider(
              divisions: 10,
              value: _sliderValue,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Галочка
class CheckmarkWidget extends StatelessWidget {
  const CheckmarkWidget({
    required double radiusOfRoundElement,
    Key? key,
  })  : _radiusOfRoundElement = radiusOfRoundElement,
        super(key: key);

  final double _radiusOfRoundElement;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _radiusOfRoundElement * 2,
      height: _radiusOfRoundElement * 2,
      child: Align(
        alignment: Alignment.bottomRight,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Icon(
                Icons.done,
                size: 17,
                color: Theme.of(context).canvasColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
