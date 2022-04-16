import 'package:flutter/material.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/domain_models/filter_condition.dart';
import 'package:places/domain_models/place.dart';
import 'package:rxdart/rxdart.dart';
import 'package:places/domain_models/category_item.dart';

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

  // ТУТВОПРОС
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

  /// Положение фильтра
  double _sliderValue = 0;

  /// Положение фильтра
  double get sliderValue => _sliderValue;

  /// Изменить положение фильтра
  void setSliderState(double newValue) {
    _sliderValue = newValue;
    final FilterCondition _newFilterConditions = FilterCondition(
      filterItemsState: filterConditions.filterItemsState,
      radiusOfSearch: int.parse(newValue.toString()),
    );
    _scFilterState.add(_newFilterConditions);
  }

  /// Нажатие на "Показать"
  void onTapOnShow() {
    Navigator.of(context).pop();
  }

  // TODO(me): реализовать фильтрацию еще и по расстоянию
  final List<String> distanceList = [
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
}
