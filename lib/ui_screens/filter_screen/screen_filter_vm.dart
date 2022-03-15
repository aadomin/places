import 'package:flutter/material.dart';
import 'package:places/domain_entities/place_entity.dart';
import 'package:rxdart/rxdart.dart';
import 'package:places/domain_models/category_item.dart';

///
/// Вью-модель Фильтра
///
class FilterVM with ChangeNotifier {
  FilterVM({required this.placeEntity}) {
    // при появлении объекта из стрима обновляем интерфейс
    streamFilterItemsState.listen((newFilterItemsState) {
      placeEntity.filterItemsState = newFilterItemsState;
      notifyListeners();
    });
  }

  final PlaceEntity placeEntity;

  List<CategoryItem> get filterItemsState => placeEntity.filterItemsState;

  late final BehaviorSubject<List<CategoryItem>> _streamFilterItemsState =
      BehaviorSubject<List<CategoryItem>>.seeded(placeEntity.filterItemsState);
  Stream<List<CategoryItem>> get streamFilterItemsState =>
      _streamFilterItemsState.stream;

  /// Переключить выбранность категории
  void switchActiveCategories(int index) {
    final List<CategoryItem> _newFilterItemsState =
        placeEntity.filterItemsState;
    _newFilterItemsState[index].isSelected =
        !_newFilterItemsState[index].isSelected;
    _streamFilterItemsState.add(_newFilterItemsState);
  }

  /// Очистить выбранные категории
  void clearActiveCategories() {
    final List<CategoryItem> _newFilterItemsState =
        placeEntity.filterItemsState;
    for (final element in _newFilterItemsState) {
      element.isSelected = false;
    }
    _streamFilterItemsState.add(_newFilterItemsState);
  }
}
