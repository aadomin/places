import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_interactors/filter_interactor.dart';

/// Экран Фильтр
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        leading: BackButton(
          color: Theme.of(context).primaryColor,
        ),
        elevation: 0,

        //
        // Кнопка Очистить
        //
        title: Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              context.read<FilterInteractor>().clearActiveCategories();
            },
            style: TextButton.styleFrom(
              primary: Theme.of(context).colorScheme.secondary,
            ),
            child: const Text(
              UiStrings.clear,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          //
          // Название раздела "КАТЕГОРИИ"
          //
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 0, 24),
              child: Text(
                UiStrings.categories,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
          ),

          //
          // Сам список категорий
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Wrap(
              runSpacing: 20,
              spacing: 20,
              children: [
                for (var i = 0;
                    i < context.watch<FilterInteractor>().filterItems.length;
                    i++)
                  SizedBox(
                    width: 110,
                    height: 95,
                    child: TextButton(
                      onPressed: () {
                        context
                            .read<FilterInteractor>()
                            .switchActiveCategories(i);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
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
                                              .watch<FilterInteractor>()
                                              .filterItems[i]
                                              .assetPath,
                                          width: 32,
                                          height: 32,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                //ignore: prefer_if_elements_to_conditional_expressions
                                context
                                        .watch<FilterInteractor>()
                                        .filterItems[i]
                                        .isSelected
                                    ? CheckmarkWidget(
                                        radiusOfRoundElement:
                                            _radiusOfRoundElement,
                                      )
                                    : const SizedBox.shrink(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(4, 12, 4, 0),
                              child: Text(
                                context
                                    .watch<FilterInteractor>()
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
                  ),
              ],
            ),
          ),

          //
          // Слово "Расстояние"
          //
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

          //
          // Слайдер
          //
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
      bottomSheet: Container(
        //
        // Кнопка ПОКАЗАТЬ
        //
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ElevatedButton(
            onPressed: () {
              onTapOnShow(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text('ПОКАЗАТЬ (10)'),
            ),
          ),
        ),
      ),
    );
  }

  void onTapOnShow(BuildContext context) {
    Navigator.of(context).pop();
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
