import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:places/domain_models/filter_item.dart';
import 'package:places/domain_entities/filter_entity.dart';

class FilterInteractor with ChangeNotifier {
  // <Singleton>
  factory FilterInteractor() => _instance ?? FilterInteractor._internal();
  static FilterInteractor? _instance;
  FilterInteractor._internal() {
    _instance = this;
    //
    _filterItems = filterEntity.filterItems;

    // инициализируем стрим первым значением
    _streamItems = BehaviorSubject<List<FilterItem>>.seeded(_filterItems);
    
    // при появлении объекта из стрима обновляем интерфейс
    // т.к. StreamBuilder мы еще не проходили:
    items.listen((items) {
      _filterItems = items;
      notifyListeners();
    });
  }

  // </Singleton> }

  final FilterEntity filterEntity = FilterEntity();

  late List<FilterItem> _filterItems;
  List<FilterItem> get filterItems => _filterItems;

  late BehaviorSubject<List<FilterItem>> _streamItems;
  Stream<List<FilterItem>> get items => _streamItems.stream;

  void switchActiveCategories(int index) {
    _filterItems[index].isSelected = !_filterItems[index].isSelected;
    _streamItems.add(_filterItems);
  }

  void clearActiveCategories() {
    for (final element in _filterItems) {
      element.isSelected = false;
    }
    _streamItems.add(_filterItems);
  }

  int radius = 1000;
}
