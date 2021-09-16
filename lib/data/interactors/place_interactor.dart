import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactors/geo_interactor.dart';
import 'package:places/data/interactors/filter_interactor.dart';
import 'package:places/data/models/filter_item.dart';
import 'package:places/data/models/object_location.dart';
import 'package:places/ui/my_app/platform_detector.dart';

import 'package:places/ui/screens/sight_details_screen/sight_details_screen.dart';

import 'package:places/data/repositories/place_repository.dart';
import 'package:places/data/models/place.dart';
import 'package:places/ui/widgets/widget_add_to_calendar_cuper_modal.dart';

class PlaceInteractor with ChangeNotifier {
  // <singleton>
  factory PlaceInteractor() => _instance ?? PlaceInteractor._internal();
  PlaceInteractor._internal() {
    _instance = this;
    //
    allPlaces = placeRepository.loadedPlaces;
  }
  static PlaceInteractor? _instance;
  // </singleton>

  List<Sight> allPlaces = [];

  final placeRepository = PlaceRepository();
  final geoInteractor = GeoInteractor();
  final filterInteractor = FilterInteractor();

  List<Sight> getPlaces({
    required int radius,
    required List<FilterItem> categories,
  }) {
    final List<String> _selectedCategories = categories
        .where((element) => element.isSelected)
        .map((element) => element.name)
        .toList();

    // filtering and sorting
    updateDistancesToUser();
    final List<Sight> _filteredAndSortedPlacesList = allPlaces
        .where((element) => _selectedCategories
            .any((e) => element.type.toLowerCase() == e.toLowerCase()))
        .toList()
          ..sort((a, b) =>
              a.currentDistanceToUser.compareTo(b.currentDistanceToUser));

    //ignore: avoid_print
    print('${_filteredAndSortedPlacesList.map((e) => e.name).toList()}');

    return _filteredAndSortedPlacesList;
  }

  void updateDistancesToUser() {
    allPlaces = allPlaces.map((place) {
      place.currentDistanceToUser = geoInteractor.distanceFromPointToUser(
        lat: place.lat,
        lon: place.lon,
      );
      return place;
    }).toList();
  }

  /// отображается на экране "Список интересных мест" и фильтруется в результатах Поиска
  List<Sight> get filteredPlaces {
    return getPlaces(
        radius: filterInteractor.radius,
        categories: filterInteractor.filterItems);
  }

  Sight getPlaceDetails(int id) {
    return allPlaces[indexOfPlaceInAllById(id)];
  }

  List<Sight> get getFavoritesPlaces =>
      allPlaces.where((s) => s.wished).toList();

  List<Sight> get getVisitedPlaces => allPlaces.where((s) => s.seen).toList();

  void removeFromFavorites(int id) {
    allPlaces[indexOfPlaceInAllById(id)].wished = false;
    notifyListeners();
  }

  void removeFromVisited(int id) {
    allPlaces[indexOfPlaceInAllById(id)].seen = false;
    notifyListeners();
  }

  void removeAtAll(int id) {
    allPlaces.removeAt(indexOfPlaceInAllById(id));
    notifyListeners();
  }

  void addToFavorites(int id) {
    allPlaces[indexOfPlaceInAllById(id)].wished = true;
    notifyListeners();
  }

  void addToVisitedPlaces(int id) {
    allPlaces[indexOfPlaceInAllById(id)].seen = true;
    notifyListeners();
  }

  int indexOfPlaceInAllById(int id) {
    for (var i = 0; i < allPlaces.length; i++) {
      if (allPlaces[i].id == id) {
        return i;
      }
    }
    throw Exception('Нет такого id');
  }

  void showModalDetailsScreen(BuildContext context, int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => SightDetailsScreen(
        sightID: id,
      ),
    );
  }

  List<String> get listOfInitialPhotosForAdding =>
      mockOfListOfInitialImagesForAdding;

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
          return const AddToCalendarCuperModal();
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

  //
  // Добавление нового
  //

  List<String>? _listOfPhotos;

  List<String> get listOfPhotos {
    // копируем изначальный список фоток, сделано пока для красоты
    _listOfPhotos ??= [
      ...listOfInitialPhotosForAdding,
    ];
    return _listOfPhotos ?? []; // только для null safety
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
    allPlaces.add(
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
