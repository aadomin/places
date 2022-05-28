import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/filter_screen/screen_filter_vm.dart';
import 'package:places/ui_screens/filter_screen/widget_checkmark.dart';

/// Экран Фильтр
class ScreenFilter extends StatefulWidget {
  const ScreenFilter({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final ScreenFilterVM viewModel;

  @override
  _ScreenFilterState createState() => _ScreenFilterState();
}

class _ScreenFilterState extends State<ScreenFilter> {
  ScreenFilterVM get ___viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    ___viewModel.addListener(_vmListener);
    ___viewModel.initVM();
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    ___viewModel.disposeVM();
    ___viewModel.removeListener(_vmListener);
    super.dispose();
  }

  final _radiusOfRoundElement = 26.0;

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
            onPressed: () => ___viewModel.clearActiveCategories(),
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
                      i < ___viewModel.filterConditions.filterItemsState.length;
                      i++)
                    SizedBox(
                      width: 110,
                      height: 105,
                      child: TextButton(
                        onPressed: () => ___viewModel.switchActiveCategories(i),
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
                                            _imagePathOfCategory[___viewModel
                                                    .filterConditions
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
                                  ___viewModel.filterConditions
                                          .filterItemsState[i].isSelected
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
                                  ___viewModel.filterConditions
                                      .filterItemsState[i].name,
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
                ___viewModel.descriptionOfSelectedRadiusItem,
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
              divisions: ___viewModel.countOfRadiusSliderDivisions,
              value: ___viewModel.sliderValue,
              onChanged: (newValue) => ___viewModel.setSliderState(newValue),
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
            onPressed: ___viewModel.onTapOnShow,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  '${UiStrings.filterShow} (${___viewModel.filteredPlaces.length})'),
            ),
          ),
        ),
      ),
    );
  }
}
