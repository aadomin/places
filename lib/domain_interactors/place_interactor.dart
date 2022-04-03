import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/place_repository.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/geo_interactor.dart';
import 'package:places/domain_models/category_item.dart';
import 'package:places/domain_models/place.dart';

///
/// Интерактор списка мест
///
class PlacesInteractor with ChangeNotifier {
  PlacesInteractor({
    required this.placesRepository,
    required this.geoInteractor,
    required this.filterInteractor,
  }) {
    init(); //асинхронная
  }
  final PlaceRepository placesRepository;
  final GeoInteractor geoInteractor;
  final FilterInteractor filterInteractor;

  bool isLoading = true;
  List<Place> loadedAllPlaces = [];

  /// Инициализация интерактора - переделать в инитстейт
  Future<void> init() async {
    filterInteractor.addListener(filterInteractorListener);
    await _loadAllPlaces();
  }

  void filterInteractorListener() => notifyListeners();

  /// загрузить все места
  Future<void> _loadAllPlaces() async {
    isLoading = true;
    notifyListeners();

    loadedAllPlaces = await placesRepository.getAllPlaces();
    _updateDistancesFromAllPlacesToUser();
    isLoading = false;
    notifyListeners();
  }

  // /// перезагрузить все места
  // Future<void> _reloadAllPlaces() async {
  //   await _loadAllPlaces();
  // }

  /// был ли последний запрос данных закончен с ошибкой
  // TODO(me): переделать placesRepository.isRequestDoneWithError

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
    _updateDistancesFromAllPlacesToUser();
    final List<Place> _filteredAndSortedPlacesList = loadedAllPlaces
        .where((element) => _selectedCategories
            .any((e) => element.type.toLowerCase() == e.toLowerCase()))
        .toList()
      ..sort(
        (a, b) => a.currentDistanceToUser.compareTo(b.currentDistanceToUser),
      );

    return _filteredAndSortedPlacesList;
  }

  /// Обновляет расстояния от объекта до пользователя
  void _updateDistancesFromAllPlacesToUser() {
    loadedAllPlaces = loadedAllPlaces.map((place) {
      place.currentDistanceToUser = geoInteractor.distanceFromPointToUser(
        lat: place.lat,
        lon: place.lon,
      );
      return place;
    }).toList();
  }

  // TODO(me): Переделать радиус

  /// Возвращает лист мест, которые отображаются на экране "Список интересных мест"
  /// и на экране Поиска
  List<Place> get getFilteredPlaces {
    return getPlaces(
      radius: filterInteractor.filterConditions.radiusOfSearch,
      categories: filterInteractor.filterConditions.filterItemsState,
    );
  }

  /// Возвращает конкретное место (детали)
  Place getPlaceDetails(int id) {
    return loadedAllPlaces[_indexOfPlaceInAllById(id)];
  }

  /// Возвращает массив избранных мест
  List<Place> get getFavoritesPlaces =>
      loadedAllPlaces.where((s) => s.wished).toList();

  /// Возвращает массив посещенных мест
  List<Place> get getVisitedPlaces =>
      loadedAllPlaces.where((s) => s.seen).toList();

  /// Удаляет место из избранных
  void removeFromFavorites(int id) {
    loadedAllPlaces[_indexOfPlaceInAllById(id)].wished = false;
    notifyListeners();
  }

  /// Удаляет место из посещенных
  void removeFromVisited(int id) {
    loadedAllPlaces[_indexOfPlaceInAllById(id)].seen = false;
    notifyListeners();
  }

  /// Удаляет совсем
  void removeAtAll(int id) {
    loadedAllPlaces.removeAt(_indexOfPlaceInAllById(id));
    notifyListeners();
  }

  /// Добавляет место в избранные
  void addToFavorites(int id) {
    loadedAllPlaces[_indexOfPlaceInAllById(id)].wished = true;
    notifyListeners();
  }

  /// Добавляет место в посещенные
  void addToVisitedPlaces(int id) {
    loadedAllPlaces[_indexOfPlaceInAllById(id)].seen = true;
    notifyListeners();
  }

  /// Возвращает индекс места в массиве по его ID
  int _indexOfPlaceInAllById(int id) {
    for (var i = 0; i < loadedAllPlaces.length; i++) {
      if (loadedAllPlaces[i].id == id) {
        return i;
      }
    }
    throw Exception('There is no such ID');
  }

  ///
  /// Добавление нового: функция добавления
  ///
  Future<void> addNewPlace({
    required String name,
    required double lat,
    required double lon,
    required String url,
    required String details,
    required String type,
  }) async {
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

    // TODO(me): подумать, как сделать - сбросить кэш и загрузить снова экраны
    await placesRepository.addPlace(newPlace);
    loadedAllPlaces.add(newPlace);
    notifyListeners();
  }
}
