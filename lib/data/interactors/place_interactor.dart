import 'dart:math';
import 'package:flutter/material.dart';

import 'package:places/ui/screens/sight_details_screen/sight_details_screen.dart';

import 'package:places/data/repositories/place_repository.dart';
import 'package:places/data/models/place.dart';
import 'package:places/data/models/object_location.dart';

class PlaceInteractor with ChangeNotifier {
  // Singleton
  factory PlaceInteractor() => _instance ?? PlaceInteractor._internal();
  PlaceInteractor._internal() {
    _instance = this;
    //
    loadedPlaces = placeRepository.loadedPlaces;
  }
  static PlaceInteractor? _instance;
  //

  PlaceRepository placeRepository = PlaceRepository();

  ObjectLocation? currentUserLocation() {
    final Random random = Random();

    return ObjectLocation(
      latitude: random.nextDouble(),
      longitude: random.nextDouble(),
    );
  }

  late final List<Sight> loadedPlaces;

  List<Sight> get allPlaces => loadedPlaces;

  List<Sight> get getPlaces => loadedPlaces;

  Sight getPlaceDetails(int index) {
    return getPlaces[index];
  }

  List<Sight> get getFavoritesPlaces =>
      loadedPlaces.where((s) => s.wished).toList();

  List<Sight> get getVisitedPlaces =>
      loadedPlaces.where((s) => s.seen).toList();

  void removeFromFavorites(int index) {
    loadedPlaces[index].wished = false;
  }

  void removeFromVisited(int index) {
    loadedPlaces[index].wished = false;
  }

  void addToFavorites(int index) {
    loadedPlaces[index].wished = true;
    notifyListeners();
  }

  void addToVisitedPlaces(int index) {
    loadedPlaces[index].wished = true;
    notifyListeners();
  }

  void showModalDetailsScreen(BuildContext context, int i) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => SightDetailsScreen(
        sightID: loadedPlaces[i].id,
      ),
    );
  }

  List<Sight> get filteredPlaces => loadedPlaces;

  List<String> get listOfInitialPhotosForAdding =>
      mockOfListOfInitialImagesForAdding;

  //
  // Добавление
  //

  List<String>? _listOfPhotos;

  List<String> get listOfPhotos {
    // копируем изначальный список фоток, впоследствии он будет удален
    _listOfPhotos ??= [
      ...listOfInitialPhotosForAdding,
    ];
    return _listOfPhotos ?? []; // useless thing just for null safety
  }

  set listOfPhotos(List<String> value) {
    _listOfPhotos = value;
  }

  void addNewPlace({
    required String name,
    required double lat,
    required double lon,
    required String url,
    required String details,
    required String type,
  }) {
    final random = Random();
    loadedPlaces.add(
      Sight(
        name: name,
        lat: lat,
        lon: lon,
        url: url,
        details: details,
        type: type,
        id: random.nextInt(293812572),
        wished: false,
        seen: false,
      ),
    );
    notifyListeners();
  }
}

// TODO переделать на ID getPlaceDetails
/// getPlaces(radius:int, category: String): List. фильтр по удаленности
/// экран: addToFavorites - на Главном экране и экране детализации
/// экран: removeFromFavorites - если место уже в избранном, по повторному нажатию
