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

    // при появлении объекта из стрима обновляем интерфейс
    streamFilterItemsState.listen((newFilterItemsState) {
      filterInteractor.filterConditions.filterItemsState = newFilterItemsState;
      filterInteractor.filterConditions = FilterCondition(
        filterItemsState: newFilterItemsState,
        radiusOfSearch: filterInteractor.filterConditions.radiusOfSearch,
      );
      notifyListeners();
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

  List<CategoryItem> get filterItemsState =>
      filterInteractor.filterConditions.filterItemsState;

  late final BehaviorSubject<List<CategoryItem>> _streamFilterItemsState =
      BehaviorSubject<List<CategoryItem>>.seeded(filterItemsState);
  Stream<List<CategoryItem>> get streamFilterItemsState =>
      _streamFilterItemsState.stream;

  /// Переключить выбранность категории
  void switchActiveCategories(int index) {
    final List<CategoryItem> _newFilterItemsState = filterItemsState;
    _newFilterItemsState[index].isSelected =
        !_newFilterItemsState[index].isSelected;
    _streamFilterItemsState.add(_newFilterItemsState);
  }

  /// Очистить выбранные категории
  void clearActiveCategories() {
    final List<CategoryItem> _newFilterItemsState = filterItemsState;
    for (final element in _newFilterItemsState) {
      element.isSelected = false;
    }
    _streamFilterItemsState.add(_newFilterItemsState);
  }

  void onTapOnShow() {
    Navigator.of(context).pop();
  }

  double _sliderValue = 0;
  double get sliderValue => _sliderValue;
  void setSliderState(double newValue) {
    _sliderValue = newValue;
    notifyListeners();
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
