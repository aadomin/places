import 'package:flutter/material.dart';

import 'package:places/data/repository.dart';

class AddSightModel with ChangeNotifier {
  var repository = Repository();

  List<String>? _listOfPhotos;

  List<String> get listOfPhotos {
    if (_listOfPhotos == null) {
      // копируем изначальный список фоток, впоследствии он будет удален
      _listOfPhotos = [];
      for (var i = 0;
          i < repository.sightsStorage.listOfInitialPhotosForAdding.length;
          i++)
        _listOfPhotos
            ?.add(repository.sightsStorage.listOfInitialPhotosForAdding[i]);
    }
    return _listOfPhotos ?? [];
  }

  set listOfPhotos(List<String> value) {
    _listOfPhotos = value;
  }
}
