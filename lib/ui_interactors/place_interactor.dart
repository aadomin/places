import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/main.dart';
import 'package:places/domain_models/category_item.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_widgets_commons/widget_add_to_calendar_cuper_modal.dart';

///
/// Интерактор списка мест
///
class PlaceInteractor with ChangeNotifier {
  PlaceInteractor() {
    initPlaces(); //асинхронная
  }

  /// Загруженный список мест
  List<Place> allPlaces = [];

  bool isRequestDoneWithError = false;

  /// Инициализация интерактора
  Future<void> initPlaces() async {
    await placeEntity.loadPlacesIfNeed();

    if (placeEntity.isRequestDoneWithError) {
      isRequestDoneWithError = true;
      notifyListeners();
      return;
    }

    allPlaces = placeEntity.loadedPlaces;
    updateDistancesToUser();
    notifyListeners();
  }

  /// Возвращает список мест
  List<Place> getPlaces({
    required int radius,
    required List<CategoryItem> categories,
  }) {
    final List<String> _selectedCategories = categories
        .where((element) => element.isSelected)
        .map((element) => element.name)
        .toList();

    // filtering and sorting
    updateDistancesToUser();
    final List<Place> _filteredAndSortedPlacesList = allPlaces
        .where((element) => _selectedCategories
            .any((e) => element.type.toLowerCase() == e.toLowerCase()))
        .toList()
      ..sort(
        (a, b) => a.currentDistanceToUser.compareTo(b.currentDistanceToUser),
      );

    return _filteredAndSortedPlacesList;
  }

  /// Обновляет расстояния от объекта до пользователя
  void updateDistancesToUser() {
    allPlaces = allPlaces.map((place) {
      place.currentDistanceToUser = geoEntity.distanceFromPointToUser(
        lat: place.lat,
        lon: place.lon,
      );
      return place;
    }).toList();
  }

  /// Возвращает лист мест, которые отображаются на экране "Список интересных мест"
  /// и на экране Поиска
  List<Place> get getFilteredPlaces {
    print(filterInteractor.filterItems.toString());
    return getPlaces(
      radius: filterInteractor.radius,
      categories: filterInteractor.filterItems,
    );
  }

  /// Возвращает конкретное место (детали)
  Place getPlaceDetails(int id) {
    return allPlaces[indexOfPlaceInAllById(id)];
  }

  /// Возвращает массив избранных мест
  List<Place> get getFavoritesPlaces =>
      allPlaces.where((s) => s.wished).toList();

  /// Возвращает массив посещенных мест
  List<Place> get getVisitedPlaces => allPlaces.where((s) => s.seen).toList();

  /// Удаляет место из избранных
  void removeFromFavorites(int id) {
    allPlaces[indexOfPlaceInAllById(id)].wished = false;
    notifyListeners();
  }

  /// Удаляет место из посещенных
  void removeFromVisited(int id) {
    allPlaces[indexOfPlaceInAllById(id)].seen = false;
    notifyListeners();
  }

  /// Удаляет совсем
  void removeAtAll(int id) {
    allPlaces.removeAt(indexOfPlaceInAllById(id));
    notifyListeners();
  }

  /// Добавляет место в избранные
  void addToFavorites(int id) {
    allPlaces[indexOfPlaceInAllById(id)].wished = true;
    notifyListeners();
  }

  /// Добавляет место в посещенные
  void addToVisitedPlaces(int id) {
    allPlaces[indexOfPlaceInAllById(id)].seen = true;
    notifyListeners();
  }

  /// Возвращает индекс места в массиве по его ID
  int indexOfPlaceInAllById(int id) {
    for (var i = 0; i < allPlaces.length; i++) {
      if (allPlaces[i].id == id) {
        return i;
      }
    }
    throw Exception('There is no such ID');
  }

  ///
  /// Показать окно запланировать посещение места
  /// - используется минимум двумя экранами
  ///
  Future<void> schedulePlace(BuildContext context, int id) async {
    late final DateTime? _result;
    if (PlatformDetector.isAndroid || PlatformDetector.isWeb) {
      _result = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );
    }
    if (PlatformDetector.isIOS) {
      _result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return const WidgetAddToCalendarCuperModal();
        },
      );
    }

    if (_result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('added to calendar at $_result'),
        ),
      );
    }
  }

  ///
  /// Добавление нового: перечень фоток
  ///
  List<String>? _listOfPhotos;

  // TODO(me): убрать listOfInitialPhotosForAdding
  ///
  /// Список изначальных фоток
  ///
  static const List<String> listOfInitialPhotosForAdding = [
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  ];

  ///
  /// Добавление нового: перечень фоток
  ///
  List<String> get listOfPhotos {
    // копируем изначальный список фоток, пока для красоты
    _listOfPhotos ??= [
      ...listOfInitialPhotosForAdding,
    ];
    return _listOfPhotos ?? []; // just for null safety
  }

  ///
  /// Добавление нового: перечень фоток
  ///
  set listOfPhotos(List<String> value) {
    _listOfPhotos = value;
  }

  ///
  /// Добавление нового: функция добавления
  ///
  void addNewPlace({
    required String name,
    required double lat,
    required double lon,
    required String url,
    required String details,
    required String type,
  }) {
    final random = Random();

    final newPlace = Place(
      name: name,
      lat: lat,
      lon: lon,
      url: [url],
      details: details,
      type: type,
      id: random.nextInt(50000),
    );

    placeEntity.addPlace(newPlace);

    // TODO(me): hasNeedToBeReloaded так себе идея конечно
    placeEntity.hasNeedToBeReloaded = true;

    allPlaces.add(newPlace);
    notifyListeners();
  }

  // TODO(me): емае
  void updateScreens() {
    notifyListeners();
  }
}
