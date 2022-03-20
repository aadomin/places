import 'package:flutter/material.dart';
import 'package:places/domain_entities/place_entity.dart';

class ScreenAddPlaceVM with ChangeNotifier {
  ScreenAddPlaceVM({
    required this.context,
    required this.placesEntity,
  }) {
    //  settingsEntity.addListener(_settingsEntityListener);
  }

  BuildContext context;
  final PlaceEntity placesEntity;
  // void _settingsEntityListener() => notifyListeners();

  ///
  /// Добавление нового: перечень фоток
  ///
  List<String>? _listOfPhotos;

  // TODO(me): убрать listOfInitialPhotosForAdding
  ///
  /// Список изначальных фоток
  ///
  static const List<String> listOfInitialPhotosForAdding = [
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  ];

  ///
  /// Добавление нового: перечень фоток
  ///
  List<String> get listOfPhotos {
    // копируем изначальный список фоток, пока для красоты
    _listOfPhotos ??= [
      ...listOfInitialPhotosForAdding,
    ];
    return _listOfPhotos ?? []; // just for null safety
  }

  ///
  /// Добавление нового: перечень фоток
  ///
  set listOfPhotos(List<String> value) {
    _listOfPhotos = value;
  }
}
