import 'package:flutter/material.dart';
import 'package:places/data/repository.dart';
import 'package:places/domain/FilterItem.dart';

class MyFilterModel with ChangeNotifier {
  MyFilterModel() {
    repository = Repository();
    
    // при появлении объекта из стрима обновляем интерфейс
    repository.categoriesFilter.items.listen((items) {
      _filterItems = items;
      notifyListeners();
    });
  }
  Repository repository;

  List<FilterItem> _filterItems;
  List<FilterItem> get filterItems => _filterItems;

  void switchSelection(int index) {
    repository.categoriesFilter.switchSelection(index);
  }

  void clearSelection() {
    repository.categoriesFilter.clearSelection();
  }
}
