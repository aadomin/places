import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui/models/ui_filter_model.dart';

class FiltersScreen extends StatelessWidget {
  final _radiusOfRoundElement = 26.0;

  List<FilterItem> _listOfFilterItems;

  @override
  Widget build(BuildContext context) {
    List<int> _filterItemsIndexes = [0, 1, 2, 3, 4, 5];

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
                context.read<MyFilterModel>().crearCheckboxes();
              },
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
                padding: const EdgeInsets.fromLTRB(16, 24, 0, 24),
                child: Text(
                  'КАТЕГОРИИ',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Wrap(
                direction: Axis.horizontal,
                spacing: 1.0,
                runSpacing: 10.0,
                alignment: WrapAlignment.spaceEvenly,
                children: [
                  for (var i in _filterItemsIndexes)
                    SizedBox(
                      width: 110,
                      height: 95,
                      child: TextButton(
                        onPressed: () {
                          context.read<MyFilterModel>().switchCheckbox(i);
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
                                    color: Colors.grey.shade300,
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
                                    : Text(''),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
                              child: Text(
                                context
                                    .watch<MyFilterModel>()
                                    .filterItems[i]
                                    .name,
                                style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}

// Галочка
class CheckmarkWidget extends StatelessWidget {
  const CheckmarkWidget({
    Key key,
    @required double radiusOfRoundElement,
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
          borderRadius: BorderRadius.all(
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
