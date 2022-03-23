import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/ui_screens/filter_screen/widget_checkmark.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';

/// Экран Фильтр
class ScreenFilter extends StatefulWidget {
  const ScreenFilter({Key? key}) : super(key: key);
  @override
  _ScreenFilterState createState() => _ScreenFilterState();
}

class _ScreenFilterState extends State<ScreenFilter> {
  final _radiusOfRoundElement = 26.0;

  double _sliderValue = 0;

  // TODO(me): реализовать фильтрацию еще и по расстоянию
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

  // список картинок к категориям
  static const Map<String, String> _imagePathOfCategory = {
    UiStrings.hotel: UiImagePaths.hotel,
    UiStrings.restaurant: UiImagePaths.restaurant,
    UiStrings.specialPlace: UiImagePaths.specialPlace,
    UiStrings.park: UiImagePaths.park,
    UiStrings.museum: UiImagePaths.museum,
    UiStrings.cafe: UiImagePaths.cafe,
  };

  @override
  Widget build(BuildContext context) {
    final List<Place> filteredPlaces =
        context.watch<PlacesInteractor>().getFilteredPlaces;
    final String numOfFilteredPlaces = filteredPlaces.length.toString();

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
              context.read<FilterVM>().clearActiveCategories();
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
      body: SingleChildScrollView(
        child: Column(
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
            // Сам список значков категорий
            //
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: [
                  for (var i = 0;
                      i < context.watch<FilterVM>().filterItemsState.length; 
                      i++)
                    SizedBox(
                      width: 110,
                      height: 105,
                      child: TextButton(
                        onPressed: () {
                          context
                              .read<FilterVM>()
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
                                          child: SvgPicture.asset(
                                            // Если вдруг в поле оказалось что-то не то,
                                            // чтобы не было null - берем первую
                                            // (любую) картинку
                                            _imagePathOfCategory[context
                                                    .watch<FilterVM>()
                                                    .filterItemsState[i]
                                                    .name] ??
                                                _imagePathOfCategory
                                                    .entries.first
                                                    .toString(),
                                            width: 32,
                                            height: 32,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //ignore: prefer_if_elements_to_conditional_expressions
                                  context
                                          .watch<FilterVM>()
                                          .filterItemsState[i]
                                          .isSelected
                                      ? WidgetCheckmark(
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
                                      .watch<FilterVM>()
                                      .filterItemsState[i]
                                      .name,
                                  style: const TextStyle(
                                    fontSize: 12,
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

            // TODO(me): цвета слайдера, не работает слайдер
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

            //
            // Отступ
            //
            const SizedBox(height: 70),
          ],
        ),
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text('${UiStrings.filterShow} ($numOfFilteredPlaces)'),
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