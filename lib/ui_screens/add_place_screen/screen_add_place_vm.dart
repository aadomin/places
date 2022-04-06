import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/ui_commons/ui_strings.dart';

class ScreenAddPlaceVM with ChangeNotifier {
  ScreenAddPlaceVM({
    required this.context,
    required this.placesInteractor,
  });

  BuildContext context;
  final PlacesInteractor placesInteractor;

  //

  final textControllerName = TextEditingController();
  final textControllerLat = TextEditingController();
  final textControllerLon = TextEditingController();
  final textControllerDescription = TextEditingController();

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

  Future<void> onTapOnAddNewPlace({
    required String name,
    required double lat,
    required double lon,
    required String url,
    required String details,
    required String type,
  }) async {
    await placesInteractor.addNewPlace(
      name: name,
      lat: lat,
      lon: lon,
      // TODO(me): добавить url к создаваемому месту
      url: 'исправить',
      details: details,
      type: type,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text(UiStrings.newPlaceCreated)),
    );
    Navigator.pop(context);
  }
}
