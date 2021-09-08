import 'package:places/data/models/filter_item.dart';

class SearchRepository {
  //

  final List<FilterItem> filterItems = [
    FilterItem(
      name: 'Отель',
      assetPath: 'res/images/hotel.png',
      isSelected: false,
    ),
    FilterItem(
      name: 'Ресторан',
      assetPath: 'res/images/rest.png',
      isSelected: false,
    ),
    FilterItem(
        name: 'Особое место',
        assetPath: 'res/images/special.png',
        isSelected: false),
    FilterItem(
      name: 'Парк',
      assetPath: 'res/images/park.png',
      isSelected: false,
    ),
    FilterItem(
      name: 'Музей',
      assetPath: 'res/images/museum.png',
      isSelected: false,
    ),
    FilterItem(
      name: 'Кафе',
      assetPath: 'res/images/cafe.png',
      isSelected: false,
    ),
  ];
}
