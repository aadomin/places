import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import 'package:places/domain/models/filter_item.dart';
import 'package:places/data/repositories/filter_repository.dart';

class FilterInteractor with ChangeNotifier {
  // <Singleton>
  factory FilterInteractor() => _instance ?? FilterInteractor._internal();
  FilterInteractor._internal() {
    _instance = this;
    //
    _filterItems = filterRepository.filterItems;
    // инициализируем стрим первым значением
    _streamItems = BehaviorSubject<List<FilterItem>>.seeded(_filterItems);
    // при появлении объекта из стрима обновляем интерфейс
    // т.к. StreamBuilder мы еще не проходили:
    items.listen((items) {
      _filterItems = items;
      notifyListeners();
    });
  }
  static FilterInteractor? _instance;
  // </Singleton> }

  final FilterRepository filterRepository = FilterRepository();

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
