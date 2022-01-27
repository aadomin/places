import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:rxdart/rxdart.dart';

import 'package:places/domain_models/category_item.dart';

///
/// Интерактор Фильтра
///
class FilterInteractor with ChangeNotifier {
  FilterInteractor() {
    _filterItemsState = _initFilterItemsState;

    // инициализируем стрим первым значением
    _streamItems =
        BehaviorSubject<List<CategoryItem>>.seeded(_filterItemsState);

    // при появлении объекта из стрима обновляем интерфейс
    // т.к. StreamBuilder мы еще не проходили:
    items.listen((items) {
      _filterItemsState = items;
      notifyListeners();
      placeInteractor.updateScreen();
    });
  }

  late List<CategoryItem> _filterItemsState;
  List<CategoryItem> get filterItems => _filterItemsState;

  late BehaviorSubject<List<CategoryItem>> _streamItems;
  Stream<List<CategoryItem>> get items => _streamItems.stream;

  void switchActiveCategories(int index) {
    _filterItemsState[index].isSelected = !_filterItemsState[index].isSelected;
    _streamItems.add(_filterItemsState);
  }

  void clearActiveCategories() {
    for (final element in _filterItemsState) {
      element.isSelected = false;
    }
    _streamItems.add(_filterItemsState);
  }

  // TODO(me): радиус
  int radius = 1000;

  final List<CategoryItem> _initFilterItemsState = [
    CategoryItem(name: UiStrings.hotel, isSelected: true),
    CategoryItem(name: UiStrings.rest, isSelected: true),
    CategoryItem(name: UiStrings.specialPlace, isSelected: true),
    CategoryItem(name: UiStrings.park, isSelected: true),
    CategoryItem(name: UiStrings.museum, isSelected: true),
    CategoryItem(name: UiStrings.cafe, isSelected: true),
  ];
}
