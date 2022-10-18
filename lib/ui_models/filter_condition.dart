import 'package:places/ui_models/category_item.dart';

class FilterCondition {
  FilterCondition({
    required this.filterItemsState,
    required this.radiusOfSearch,
  });

  late List<CategoryItem> filterItemsState;
  int radiusOfSearch;
}
