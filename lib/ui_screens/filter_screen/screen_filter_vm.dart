import 'package:flutter/material.dart';
import 'package:places/domain_entities/category_item.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/places_interactor.dart';
import 'package:places/domain_entities/filter_settings.dart';
import 'package:places/domain_entities/place.dart';

///
/// Вью-модель Фильтра
///
class ScreenFilterVM with ChangeNotifier {
  ScreenFilterVM({
    required this.context,
    required this.filterInteractor,
    required this.placesInteractor,
  });

  final BuildContext context;
  final FilterInteractor filterInteractor;
  final PlacesInteractor placesInteractor;

  void initVM() {
    filterInteractor.addListener(_placesInteractorListener);
    placesInteractor.addListener(_filterInteractorListener);
  }

  void _placesInteractorListener() => notifyListeners();
  void _filterInteractorListener() => notifyListeners();

  void disposeVM() {
    filterInteractor.removeListener(_placesInteractorListener);
    placesInteractor.removeListener(_filterInteractorListener);
  }

  //

  List<Place> get filteredPlaces => placesInteractor.getFilteredPlaces;

  FilterSettings get filterSettings => filterInteractor.filterSettings;

  /// Переключить выбранность категории
  void switchActiveCategories(String name) {
    filterInteractor.filterSettings = FilterSettings(
      filterItemsState: filterSettings.filterItemsState.map((item) {
        return CategoryItem(
          name: item.name,
          isSelected:
              item.name == name ? !item.isSelected : item.isSelected, // <-
        );
      }).toList(),
      radiusOfSearch: filterSettings.radiusOfSearch,
    );
  }

  /// Очистить выбранные категории
  void clearActiveCategories() {
    filterInteractor.filterSettings = FilterSettings(
      filterItemsState: filterSettings.filterItemsState.map((item) {
        return CategoryItem(
          name: item.name,
          isSelected: false, // <-
        );
      }).toList(),
      radiusOfSearch: filterSettings.radiusOfSearch,
    );

    setSliderState(1);
    // TODO(me): так не должно быть - потом получить из интерактора значение!
  }

  /// Нажатие на "Показать"
  void onTapOnShow() {
    Navigator.of(context).pop();
  }

  //
  // Слайдер
  //

  /// Положение слайдера по расстоянию
  double _sliderValue = 1;

  /// Положение слайдера по расстоянию
  double get sliderValue => _sliderValue;

  /// Изменить положение слайдера по расстоянию
  void setSliderState(double newValue) {
    _sliderValue = newValue;

    filterInteractor.filterSettings = FilterSettings(
      filterItemsState: filterSettings.filterItemsState,
      radiusOfSearch: valueOfSelectedRadiusItem,
    );
  }

  Map<int, String> distancesMap = <int, String>{
    100: 'до 100м',
    200: 'до 200м',
    300: 'до 300м',
    500: 'до 500м',
    1000: 'до 1км',
    2000: 'до 2км',
    3000: 'до 3км',
    5000: 'до 5км',
    10000: 'до 10км',
  };

  int get indexOfSelectedRadiusItem =>
      (_sliderValue * (countOfRadiusSliderItems - 1)).toInt();

  String get descriptionOfSelectedRadiusItem =>
      distancesMap.values.toList()[indexOfSelectedRadiusItem];

  int get valueOfSelectedRadiusItem =>
      distancesMap.keys.toList()[indexOfSelectedRadiusItem];

  int get countOfRadiusSliderItems => distancesMap.values.toList().length;

  int get countOfRadiusSliderDivisions =>
      distancesMap.values.toList().length - 1;
}
