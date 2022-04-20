import 'package:flutter/material.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/filter_condition.dart';
import 'package:places/domain_models/place.dart';

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

  // TODO(me): переделать
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

    //
    filterInteractor.filterConditions = _newFilterConditions;
  }

  /// Нажатие на "Показать"
  void onTapOnShow() {
    Navigator.of(context).pop();
  }

  //
  // Слайдер
  //

  /// Положение слайдера по расстоянию
  double _sliderValue = 0;

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
    50: 'до 50м',
    100: 'до 100м',
    200: 'до 200м',
    300: 'до 300м',
    600: 'до 500м',
    1000: 'до 1км',
    2000: 'до 2км',
    5000: 'до 5км',
    10000: 'до 10км',
  };

  int get indexOfSelectedRadiusItem => int.parse((_sliderValue * 8).toString());

  String get descriptionOfSelectedRadiusItem =>
      distancesMap.values.toList()[indexOfSelectedRadiusItem];

  int get valueOfSelectedRadiusItem =>
      distancesMap.keys.toList()[indexOfSelectedRadiusItem];

  int get countOfRadiusSliderDivisions =>
      distancesMap.values.toList().length - 1;
}
