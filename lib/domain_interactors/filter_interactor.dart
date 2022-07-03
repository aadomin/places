import 'package:flutter/material.dart';
import 'package:places/domain_models/category_item.dart';
import 'package:places/domain_models/filter_condition.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Интерактор. Фильтр по местам
///
class FilterInteractor with ChangeNotifier {
  FilterInteractor() {
    _filterConditions = FilterCondition(
      filterItemsState: [
        CategoryItem(name: UiStrings.hotel, isSelected: true),
        CategoryItem(name: UiStrings.restaurant, isSelected: true),
        CategoryItem(name: UiStrings.specialPlace, isSelected: true),
        CategoryItem(name: UiStrings.park, isSelected: true),
        CategoryItem(name: UiStrings.museum, isSelected: true),
        CategoryItem(name: UiStrings.cafe, isSelected: true),
      ],
      radiusOfSearch: 10000,
    );
  }

  late FilterCondition _filterConditions;

  FilterCondition get filterConditions => _filterConditions;

  set filterConditions(FilterCondition value) {
    _filterConditions = value;
    notifyListeners();
  }
}
