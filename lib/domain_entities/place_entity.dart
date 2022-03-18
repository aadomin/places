import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/domain_entities/geo_services.dart';
import 'package:places/main.dart';
import 'package:places/domain_models/category_item.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_widgets_commons/widget_add_to_calendar_cuper_modal.dart';

///
/// Интерактор списка мест
///
class PlaceEntity with ChangeNotifier {
  PlaceEntity({
    required this.placeRepository,
    required this.geoEntity,
  }) {
    init();
    initPlaces(); //асинхронная
  }
  PlaceRepository placeRepository;
  GeoServices geoEntity;

  void init() {
    // че-то тут не то
    needToBeReloaded = true;
    _loadPlacesIfNeed();
  }

  /// загрузить место
  Future<void> _loadPlacesIfNeed() async {
    itIsLoading = true;
    if (needToBeReloaded == true) {
      loadedPlaces = await placeRepository.getAllPlaces();
      needToBeReloaded = false;
    }
    itIsLoading = false;
  }

  bool itIsLoading = false;
  bool needToBeReloaded = true;
  List<Place> loadedPlaces = [];

  /// был ли последний запрос данных закончен с ошибкой
  // TODO(me): переделать
  bool get isRequestDoneWithError => placeRepository.isRequestDoneWithError;
  set isRequestDoneWithError(bool value) =>
      placeRepository.isRequestDoneWithError = value;

  /// Загруженный список мест
  List<Place> allPlaces = [];

  /// Инициализация интерактора
  Future<void> initPlaces() async {
    needToBeReloaded = true;
    await _loadPlacesIfNeed();

    if (isRequestDoneWithError) {
      isRequestDoneWithError = true;
      notifyListeners();
      return;
    }

    allPlaces = loadedPlaces;
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

  // TODO(me): Переделать
  late List<CategoryItem> _filterItemsState = [
    CategoryItem(name: UiStrings.hotel, isSelected: true),
    CategoryItem(name: UiStrings.restaurant, isSelected: true),
    CategoryItem(name: UiStrings.specialPlace, isSelected: true),
    CategoryItem(name: UiStrings.park, isSelected: true),
    CategoryItem(name: UiStrings.museum, isSelected: true),
    CategoryItem(name: UiStrings.cafe, isSelected: true),
  ];

  List<CategoryItem> get filterItemsState => _filterItemsState;

  set filterItemsState(List<CategoryItem> value) {
    _filterItemsState = value;
    notifyListeners();
  }

  // TODO(me): радиус
  /// радиус
  int radius = 1000;

  /// Возвращает лист мест, которые отображаются на экране "Список интересных мест"
  /// и на экране Поиска
  List<Place> get getFilteredPlaces {
    print(filterItemsState.toString());
    return getPlaces(
      radius: radius,
      categories: filterItemsState,
    );
  }

  /// Возвращает конкретное место (детали)
  Place getPlaceDetails(int id) {
    return allPlaces[_indexOfPlaceInAllById(id)];
  }

  /// Возвращает массив избранных мест
  List<Place> get getFavoritesPlaces =>
      allPlaces.where((s) => s.wished).toList();

  /// Возвращает массив посещенных мест
  List<Place> get getVisitedPlaces => allPlaces.where((s) => s.seen).toList();

  /// Удаляет место из избранных
  void removeFromFavorites(int id) {
    allPlaces[_indexOfPlaceInAllById(id)].wished = false;
    notifyListeners();
  }

  /// Удаляет место из посещенных
  void removeFromVisited(int id) {
    allPlaces[_indexOfPlaceInAllById(id)].seen = false;
    notifyListeners();
  }

  /// Удаляет совсем
  void removeAtAll(int id) {
    allPlaces.removeAt(_indexOfPlaceInAllById(id));
    notifyListeners();
  }

  /// Добавляет место в избранные
  void addToFavorites(int id) {
    allPlaces[_indexOfPlaceInAllById(id)].wished = true;
    notifyListeners();
  }

  /// Добавляет место в посещенные
  void addToVisitedPlaces(int id) {
    allPlaces[_indexOfPlaceInAllById(id)].seen = true;
    notifyListeners();
  }

  /// Возвращает индекс места в массиве по его ID
  int _indexOfPlaceInAllById(int id) {
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

    _addPlace(newPlace);

    // TODO(me): hasNeedToBeReloaded так себе идея конечно
    needToBeReloaded = true;

    allPlaces.add(newPlace);
    notifyListeners();
  }

  /// добавить место
  Future<void> _addPlace(Place newPlace) async {
    // TODO возвращаемое значение
    await placeRepository.addPlace(newPlace);
  }
}
