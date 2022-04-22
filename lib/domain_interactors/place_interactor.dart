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
  });

  final PlaceRepository placesRepository;
  final GeoInteractor geoInteractor;
  final FilterInteractor filterInteractor;

  void initInteractor() {
    filterInteractor.addListener(filterInteractorListener);
    _loadAllPlaces();
  }

  void filterInteractorListener() => notifyListeners();

  void disposeInteractor() {
    filterInteractor.removeListener(filterInteractorListener);
  }

  //

  List<Place> _allPlacesLoaded = [];

  /// загрузить все места
  Future<void> _loadAllPlaces() async {
    _allPlacesLoaded = await placesRepository.getAllPlaces();
    _updateDistancesFromAllPlacesToUser();
    notifyListeners();
  }

  // TODO(me): переделать placesRepository.isRequestDoneWithError
  // TODO(me): переделать по-другому

  /////
  /////
  /////
  /////

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
    final List<Place> _filteredAndSortedPlacesList = _allPlacesLoaded
        .where((element) => _selectedCategories.any(
              (e) => element.type.toLowerCase() == e.toLowerCase(),
            ))
        .where((element) => element.currentDistanceToUser.toInt() < radius)
        .toList()
      ..sort(
        (a, b) => a.currentDistanceToUser.compareTo(b.currentDistanceToUser),
      );

    return _filteredAndSortedPlacesList;
  }

  /// Обновляет расстояния от объекта до пользователя
  void _updateDistancesFromAllPlacesToUser() {
    _allPlacesLoaded = _allPlacesLoaded.map((place) {
      place.currentDistanceToUser = geoInteractor.distanceFromPointToUser(
        lat: place.lat,
        lon: place.lon,
      );
      return place;
    }).toList();
  }

  /// Возвращает лист мест, которые отображаются на экране "Список интересных мест"
  /// и на экране Поиска
  List<Place> get getFilteredPlaces {
    return getPlaces(
      radius: filterInteractor.filterConditions.radiusOfSearch,
      categories: filterInteractor.filterConditions.filterItemsState,
    );
  }

  /////
  /////
  /////
  /////

  /// Возвращает конкретное место (детали)
  Place getPlaceDetails(int id) {
    return _allPlacesLoaded.where((item) => item.id == id).first;
  }

  /// Возвращает массив избранных мест
  List<Place> get getFavoritesPlaces =>
      _allPlacesLoaded.where((s) => s.wished).toList();

  /// Возвращает массив посещенных мест
  List<Place> get getVisitedPlaces =>
      _allPlacesLoaded.where((s) => s.seen).toList();

  /// Удаляет место из избранных
  void removeFromFavorites(int id) {
    _allPlacesLoaded.where((item) => item.id == id).first.wished = false;
    notifyListeners();
  }

  /// Удаляет место из посещенных
  void removeFromVisited(int id) {
    _allPlacesLoaded.where((item) => item.id == id).first.seen = false;
    notifyListeners();
  }

  /// Удаляет совсем
  void removeAtAll(int id) {
    _allPlacesLoaded.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  /// Добавляет место в избранные
  void addToFavorites(int id) {
    _allPlacesLoaded.where((item) => item.id == id).first.wished = true;
    notifyListeners();
  }

  /// Добавляет место в посещенные
  void addToVisitedPlaces(int id) {
    _allPlacesLoaded.where((item) => item.id == id).first.seen = true;
    notifyListeners();
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

    // TODO(me): подумать, как сделать сброс кэша и перезагрузка экранов
    await placesRepository.addPlace(newPlace);
    _allPlacesLoaded.add(newPlace);
    notifyListeners();
  }
}
