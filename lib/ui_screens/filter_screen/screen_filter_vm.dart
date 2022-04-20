import 'package:flutter/material.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/filter_condition.dart';
import 'package:places/domain_models/place.dart';
import 'package:rxdart/rxdart.dart';

///
/// Вью-модель Фильтра
///
class ScreenFilterVM with ChangeNotifier {
  ScreenFilterVM({
    required this.context,
    required this.filterInteractor,
    required this.placesInteractor,
  });

  final FilterInteractor filterInteractor;
  final PlacesInteractor placesInteractor;
  final BuildContext context;

  void initVM() {
    filterInteractor.addListener(_placesInteractorListener);
    placesInteractor.addListener(_filterInteractorListener);

    // при появлении объекта из стрима - закидиваем наверх
    streamFilterState.listen((newFilterConditions) {
      filterInteractor.filterConditions = newFilterConditions;
    });
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

  late final _scFilterState =
      BehaviorSubject<FilterCondition>.seeded(filterConditions);
  Stream<FilterCondition> get streamFilterState => _scFilterState.stream;

  /// Переключить выбранность категории
  void switchActiveCategories(int index) {
    final FilterCondition _newFilterConditions = FilterCondition(
      filterItemsState: filterConditions.filterItemsState,
      radiusOfSearch: filterConditions.radiusOfSearch,
    );
    _newFilterConditions.filterItemsState[index].isSelected =
        !_newFilterConditions.filterItemsState[index].isSelected;
    //
    _scFilterState.add(_newFilterConditions);
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
    _scFilterState.add(_newFilterConditions);
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
      radiusOfSearch: int.parse(newValue.toString()),
    );
    _scFilterState.add(_newFilterConditions);
  }

  // TODO(me): реализовать фильтрацию еще и по расстоянию
  Map<int, String> distancesMap = <int, String>{
    50: 'до 50м',
    100: 'до 100м',
    200: 'до 200м',
    300: 'до 300м',
    600: 'до 600м',
    1000: 'до 1км',
    2000: 'до 2км',
    5000: 'до 5км',
    10000: 'до 10км',
  };

  List<String> get distansesTextList =>
      distancesMap.entries.map((item) => item.toString()).toList();

  int get numOfRadiusSliderDivisions => distansesTextList.length - 1;

  int get selectedRadiusItemNumber => int.parse((sliderValue * 8).toString());

  String get textForRadiusSlider => distansesTextList[selectedRadiusItemNumber];

  int get selectedRadiusValue =>
      distancesMap.keys.toList()[selectedRadiusItemNumber];
}
