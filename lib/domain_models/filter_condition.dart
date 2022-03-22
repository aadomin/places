import 'package:places/domain_models/category_item.dart';
import 'package:places/ui_commons/ui_strings.dart';

class FilterCondition {
  late List<CategoryItem> filterItemsState = [
    CategoryItem(name: UiStrings.hotel, isSelected: true),
    CategoryItem(name: UiStrings.restaurant, isSelected: true),
    CategoryItem(name: UiStrings.specialPlace, isSelected: true),
    CategoryItem(name: UiStrings.park, isSelected: true),
    CategoryItem(name: UiStrings.museum, isSelected: true),
    CategoryItem(name: UiStrings.cafe, isSelected: true),
  ];
  int radiusOfSearch = 1000;
}
