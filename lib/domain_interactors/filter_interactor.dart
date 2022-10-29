import 'package:flutter/material.dart';
import 'package:places/domain_entities/category_item.dart';
import 'package:places/domain_entities/filter_settings.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Интерактор. Фильтр по местам
///
class FilterInteractor with ChangeNotifier {
  FilterInteractor() {
    _filterSettings = const FilterSettings(
      filterItemsState: [
        //TODO(me): more clean
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

  late FilterSettings _filterSettings;

  FilterSettings get filterSettings => _filterSettings;

  set filterSettings(FilterSettings value) {
    _filterSettings = value;
    notifyListeners();
  }
}
