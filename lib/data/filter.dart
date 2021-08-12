import '../domain/FilterItem.dart';
import 'dart:async';

class CoreFilter {
  CoreFilter() {
    //_streamController.add(0);
  }

  StreamController<List<FilterItem>> _streamController = StreamController.broadcast();
  Stream<List<FilterItem>> get items => _streamController.stream;

  List<FilterItem> _filterItems = [
    FilterItem('Отель', 'res/images/hotel.png'),
    FilterItem('Ресторан', 'res/images/rest.png'),
    FilterItem('Особое место', 'res/images/special.png'),
    FilterItem('Парк', 'res/images/park.png'),
    FilterItem('Музей', 'res/images/museum.png'),
    FilterItem('Кафе', 'res/images/cafe.png'),
  ];

  List<FilterItem> get filterItems => _filterItems; // change to the stream

  void switchSelection(int index) {
    _filterItems[index].isSelected = !_filterItems[index].isSelected;
    // extract _filterItems to the stream exactly in this place
  }

  void clearSelection() {
    for (var element in _filterItems) {
      element.isSelected = false;
    }
    // extract _filterItems to the stream exactly in this place
  }
}
