import 'package:flutter/material.dart';

import 'package:places/data/interactors/repository.dart';
import 'package:places/data/models/filter_item.dart';

class MyFilterModel with ChangeNotifier {
  MyFilterModel() {
    repository = Repository();

    // при появлении объекта из стрима обновляем интерфейс
    repository.categoriesFilter.items.listen((items) {
      _filterItems = items;
      notifyListeners();
    });
  }
  late Repository repository;

  late List<FilterItem> _filterItems;
  List<FilterItem> get filterItems => _filterItems;

  void switchSelection(int index) {
    repository.categoriesFilter.switchSelection(index);
  }

  void clearSelection() {
    repository.categoriesFilter.clearSelection();
  }
}
