import 'package:flutter/material.dart';
import 'package:places/domain_entities/place_vm.dart';
import 'package:rxdart/rxdart.dart';
import 'package:places/domain_models/category_item.dart';

///
/// Вью-модель Фильтра
///
class FilterVM with ChangeNotifier {
  FilterVM({required this.placeVM}) {
    // при появлении объекта из стрима обновляем интерфейс
    streamFilterItemsState.listen((newFilterItemsState) {
      this.placeVM.filterItemsState = newFilterItemsState;
      notifyListeners();
    });
  }

  final PlaceVM placeVM;

  List<CategoryItem> get filterItemsState => this.placeVM.filterItemsState;

  late final BehaviorSubject<List<CategoryItem>> _streamFilterItemsState =
      BehaviorSubject<List<CategoryItem>>.seeded(this.placeVM.filterItemsState);
  Stream<List<CategoryItem>> get streamFilterItemsState =>
      _streamFilterItemsState.stream;

  /// Переключить выбранность категории
  void switchActiveCategories(int index) {
    final List<CategoryItem> _newFilterItemsState = this.placeVM.filterItemsState;
    _newFilterItemsState[index].isSelected =
        !_newFilterItemsState[index].isSelected;
    _streamFilterItemsState.add(_newFilterItemsState);
  }

  /// Очистить выбранные категории
  void clearActiveCategories() {
    final List<CategoryItem> _newFilterItemsState = this.placeVM.filterItemsState;
    for (final element in _newFilterItemsState) {
      element.isSelected = false;
    }
    _streamFilterItemsState.add(_newFilterItemsState);
  }
}
