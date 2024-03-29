import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data_repositories/places/place_repository.dart';
import 'package:places/domain_entities/filter_settings.dart';
import 'package:places/domain_interactors/filter_interactor.dart';
import 'package:places/domain_interactors/geo_interactor.dart';
import 'package:places/domain_entities/category_item.dart';
import 'package:places/domain_entities/place.dart';

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

  void init() {
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

  // TODO(me): ну теперь тут переделать

  /// Лист отфильтрованных мест, которые отображаются на экране "Список интересных мест"
  Future<List<Place>> get filteredWithFilterPlaces async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));

    return getPlaces(
      radius: filterInteractor.savedFilterSettings.radiusOfSearch,
      categories: filterInteractor.savedFilterSettings.filterItemsState,
    );
  }

  /// Возвращает лист мест, которые отображаются на экране Поиска
  List<Place> get getFilteredPlaces {
    return getPlaces(
      radius: filterInteractor.savedFilterSettings.radiusOfSearch,
      categories: filterInteractor.savedFilterSettings.filterItemsState,
    );
  }

  /// Возвращает лист мест, которые будут отображаться на экране Поиска,
  /// если пользователь нажмет сохранить на экране Фильтра
  /// (для определения количества мест)
  int getCountOfFilteredPlacesWithFilter(FilterSettings filterSetting) {
    return getPlaces(
      radius: filterSetting.radiusOfSearch,
      categories: filterSetting.filterItemsState,
    ).length;
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
      urls: [url],
      details: details,
      type: type,
      id: random.nextInt(50000),
    );

    // TODO(me): maybe remake after some thoughts about cash
    try {
      await placesRepository.addPlace(newPlace);
      _allPlacesLoaded.add(newPlace);
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
