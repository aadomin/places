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
    mocks = placeRepository.mocks;
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

  late final List<Sight> mocks;

  List<Sight> get getPlaces => mocks;

  List<Sight> get getFavoritesPlaces => mocks.where((s) => s.wished).toList();

  List<Sight> get getVisitedPlaces => mocks.where((s) => s.seen).toList();

  void delFromWished(int index) {
    mocks[index].wished = false;
  }

  void delFromSeen(int index) {
    mocks[index].wished = false;
  }

  void showModalDetailsScreen(BuildContext context, int i) {
    showModalBottomSheet<bool>(
      isScrollControlled: true,
      context: context,
      builder: (_) => SightDetailsScreen(
        sightID: mocks[i].id,
      ),
    );
  }

  List<Sight> get allPlaces => mocks;

  List<Sight> get filteredPlaces => mocks;

  List<String> get listOfInitialPhotosForAdding =>
      mockOfListOfInitialImagesForAdding;

  //
  // из другой модели
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

  void saveNew({
    required String name,
    required double lat,
    required double lon,
    required String url,
    required String details,
    required String type,
  }) {
    final random = Random();
    mocks.add(
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
