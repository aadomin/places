import 'package:flutter/material.dart';

import 'package:places/data/interactors/_core.dart';
import 'package:places/data/models/filter_item.dart';

class MyFilterModel with ChangeNotifier {
  MyFilterModel() {
    core = CoreSingleton();

    // при появлении объекта из стрима обновляем интерфейс
    core.categoriesFilter.items.listen((items) {
      _filterItems = items;
      notifyListeners();
    });
  }
  late CoreSingleton core;

  late List<FilterItem> _filterItems;
  List<FilterItem> get filterItems => _filterItems;

  void switchSelection(int index) {
    core.categoriesFilter.switchActiveCategories(index);
  }

  void clearSelection() {
    core.categoriesFilter.clearActiveCategories();
  }
}
