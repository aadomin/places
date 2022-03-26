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
  }) {
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final FilterInteractor filterInteractor;
  final PlacesInteractor placesInteractor;
  final BuildContext context;

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

  // List<Place> get filteredPlaces => placesInteractor.getFilteredPlaces;

  // final List<Place> filteredPlaces =
  //     context.watch<PlacesInteractor>().getFilteredPlaces;

  // int numOfFilteredPlaces = filteredPlaces.length;
}
