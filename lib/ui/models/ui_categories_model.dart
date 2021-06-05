import 'package:flutter/material.dart';
import '../../mocks.dart';
import '../../domain/sight.dart';

class MyCategoriesModel with ChangeNotifier {
  List<CategoryItem> _myCategories = [
    CategoryItem('не выбрана', true),
    CategoryItem('Отель', false),
    CategoryItem('Ресторан', false),
    CategoryItem('Особое место', false),
    CategoryItem('Театр', false),
    CategoryItem('Музей', false),
    CategoryItem('Кафе', false),
  ];

  List get myCategories => _myCategories;

  void switchCategoryCheck(int index) {
    if (_myCategories[index].isSelected) {
      _myCategories[index].isSelected = false;
    } else {
      for (var i in _myCategories) {
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

class CategoryItem {
  String name;
  bool isSelected;
  CategoryItem(this.name, this.isSelected);
}
