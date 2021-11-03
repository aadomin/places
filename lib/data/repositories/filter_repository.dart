import 'package:places/domain/models/filter_item.dart';

class FilterRepository {
  final List<FilterItem> filterItems = [
    FilterItem(
      name: 'Отель',
      assetPath: 'res/images/hotel.png',
      isSelected: true,
    ),
    FilterItem(
      name: 'Ресторан',
      assetPath: 'res/images/rest.png',
      isSelected: true,
    ),
    FilterItem(
      name: 'Особое место',
      assetPath: 'res/images/special.png',
      isSelected: true,
    ),
    FilterItem(
      name: 'Парк',
      assetPath: 'res/images/park.png',
      isSelected: true,
    ),
    FilterItem(
      name: 'Музей',
      assetPath: 'res/images/museum.png',
      isSelected: true,
    ),
    FilterItem(
      name: 'Кафе',
      assetPath: 'res/images/cafe.png',
      isSelected: true,
    ),
  ];
}
