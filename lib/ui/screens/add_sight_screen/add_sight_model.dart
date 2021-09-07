import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/data/interactors/place_interactor.dart';

import 'package:places/data/repositories/place_repository.dart';
import 'package:places/data/models/place.dart';

class AddSightModel with ChangeNotifier {
  final placeInteractor = PlaceInteractor();

  List<String>? _listOfPhotos;

  List<String> get listOfPhotos {
    // копируем изначальный список фоток, впоследствии он будет удален

    _listOfPhotos ??= [
      ...placeInteractor.listOfInitialPhotosForAdding,
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
