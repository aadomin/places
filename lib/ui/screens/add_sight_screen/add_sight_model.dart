import 'package:flutter/material.dart';

import 'package:places/data/repository.dart';

class AddSightModel with ChangeNotifier {
  var repository = Repository();

  List<String>? _listOfPhotos;

  List<String> get listOfPhotos {
    if (_listOfPhotos == null) {
      // копируем изначальный список фоток, впоследствии он будет удален
      _listOfPhotos = [
        ...repository.sightsStorage.listOfInitialPhotosForAdding,
      ];
    }
    return _listOfPhotos ?? []; // useless thing just for null safety
  }

  set listOfPhotos(List<String> value) {
    _listOfPhotos = value;
  }
}
