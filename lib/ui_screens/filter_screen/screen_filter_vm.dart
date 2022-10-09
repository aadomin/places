import 'package:flutter/material.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/places_interactor.dart';
import 'package:places/ui_models/filter_condition.dart';
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

  FilterCondition get filterConditions => filterInteractor.filterConditions;

  /// Переключить выбранность категории
  void switchActiveCategories(int index) {
    final FilterCondition _newFilterConditions = FilterCondition(
      filterItemsState: filterConditions.filterItemsState,
      radiusOfSearch: filterConditions.radiusOfSearch,
    );
    _newFilterConditions.filterItemsState[index].isSelected =
        !_newFilterConditions.filterItemsState[index].isSelected;
    //
    filterInteractor.filterConditions = _newFilterConditions;
  }

  /// Очистить выбранные категории
  void clearActiveCategories() {
    final FilterCondition _newFilterConditions = FilterCondition(
      filterItemsState: filterConditions.filterItemsState,
      radiusOfSearch: filterConditions.radiusOfSearch,
    );
    for (final element in _newFilterConditions.filterItemsState) {
      element.isSelected = false;
    }

    filterInteractor.filterConditions = _newFilterConditions;

    setSliderState(
        1); // TODO(me): так не должно быть - получить из интерактора значение!
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
    final FilterCondition _newFilterConditions = FilterCondition(
      filterItemsState: filterConditions.filterItemsState,
      radiusOfSearch: valueOfSelectedRadiusItem,
    );
    filterInteractor.filterConditions = _newFilterConditions;
  }

  // TODO(me): реализовать фильтрацию еще и по расстоянию
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
