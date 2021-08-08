import '../domain/FilterItem.dart';

class CoreFilter {
  List<FilterItem> _filterItems = [
    FilterItem('Отель', 'res/images/hotel.png'),
    FilterItem('Ресторан', 'res/images/rest.png'),
    FilterItem('Особое место', 'res/images/special.png'),
    FilterItem('Парк', 'res/images/park.png'),
    FilterItem('Музей', 'res/images/museum.png'),
    FilterItem('Кафе', 'res/images/cafe.png'),
  ];

  List<FilterItem> get filterItems => _filterItems;

  void switchCheckbox(int index) {
    _filterItems[index].isSelected = !_filterItems[index].isSelected;
  }

  void clearCheckboxes() {
    for (var element in _filterItems) {
      element.isSelected = false;
    }
  }
}
