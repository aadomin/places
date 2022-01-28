import 'package:flutter/material.dart';
import 'package:places/domain_models/category_item.dart';
import 'package:places/ui_commons/ui_strings.dart';

///
/// Интерактор выбора категории
///
class SelectCategoryInteractor with ChangeNotifier {
  final List<CategoryItem> _myCategories = [
    CategoryItem(name: UiStrings.notSelected, isSelected: true),
    CategoryItem(name: UiStrings.hotel, isSelected: false),
    CategoryItem(name: UiStrings.restaurant, isSelected: false),
    CategoryItem(name: UiStrings.specialPlace, isSelected: false),
    CategoryItem(name: UiStrings.theatre, isSelected: false),
    CategoryItem(name: UiStrings.museum, isSelected: false),
    CategoryItem(name: UiStrings.cafe, isSelected: false),
  ];

  List<CategoryItem> get myCategories => _myCategories;

  void switchCategoryCheck(int index) {
    if (_myCategories[index].isSelected) {
      _myCategories[index].isSelected = false;
      _myCategories[0].isSelected = true;
    } else {
      for (final i in _myCategories) {
        i.isSelected = false;
      }
      _myCategories[index].isSelected = true;
    }

    notifyListeners();
  }

  String get currentlySelected {
    var result = '';
    for (var i = 0; i < _myCategories.length; i++) {
      if (_myCategories[i].isSelected) {
        result = _myCategories[i].name;
      }
    }
    return result;
  }
}
