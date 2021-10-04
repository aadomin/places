import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactors/geo_interactor.dart';
import 'package:places/data/interactors/filter_interactor.dart';
import 'package:places/data/models/filter_item.dart';
import 'package:places/data/repositories/mocks.dart';
import 'package:places/ui/my_app/platform_detector.dart';
import 'package:places/ui/screens/place_details_screen/place_details_screen.dart';

import 'package:places/data/repositories/place_repository.dart';
import 'package:places/data/models/place.dart';
import 'package:places/ui/widgets/widget_add_to_calendar_cuper_modal.dart';

class PlaceInteractor with ChangeNotifier {
  // <singleton>
  factory PlaceInteractor() => _instance ?? PlaceInteractor._internal();
  PlaceInteractor._internal() {
    _instance = this;
    //
    placeRepository = PlaceRepository();
    initPlaces(); //асинхронно
  }
  static PlaceInteractor? _instance;
  // </singleton>

  // MODULES
  late final PlaceRepository placeRepository;
  final geoInteractor = GeoInteractor();
  final filterInteractor = FilterInteractor();

  List<Place> allPlaces = [];
  bool isRequestDoneWithError = false;

  Future<void> initPlaces() async {
    await placeRepository.loadPlaces();

    if (placeRepository.isRequestDoneWithError) {
      isRequestDoneWithError = true;
      notifyListeners();
      return;
    }

    allPlaces = placeRepository.loadedPlaces;
    updateDistancesToUser();
    notifyListeners();
  }

  List<Place> getPlaces({
    required int radius,
    required List<FilterItem> categories,
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
  List<Place> get filteredPlaces {
    return getPlaces(
      radius: filterInteractor.radius,
      categories: filterInteractor.filterItems,
    );
  }

  Place getPlaceDetails(int id) {
    return allPlaces[indexOfPlaceInAllById(id)];
  }

  List<Place> get getFavoritesPlaces =>
      allPlaces.where((s) => s.wished).toList();

  List<Place> get getVisitedPlaces => allPlaces.where((s) => s.seen).toList();

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

  //
  //
  //
  //
  //

  void showModalDetailsScreen(BuildContext context, int id) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => PlaceDetailsScreen(
        placeId: id,
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
    // копируем изначальный список фоток, пока для красоты
    _listOfPhotos ??= [
      ...listOfInitialPhotosForAdding,
    ];
    return _listOfPhotos ?? []; // just for null safety
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

    final newPlace = Place(
      name: name,
      lat: lat,
      lon: lon,
      url: [url],
      details: details,
      type: type,
      id: random.nextInt(50000),
    );

    placeRepository.addPlace(newPlace);

    // if (placeRepository.isRequestDoneWithError) {
    //   isRequestDoneWithError = true;
    //   notifyListeners();
    //   return;
    // }

    allPlaces.add(newPlace);
    notifyListeners();
  }
}
