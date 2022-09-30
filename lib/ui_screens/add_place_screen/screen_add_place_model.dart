import 'package:elementary/elementary.dart';
import 'package:places/domain_interactors/place_interactor.dart';

class ScreenAddPlaceModel extends ElementaryModel {
  ScreenAddPlaceModel(
    this._placesInteractor,
  );

  final PlacesInteractor _placesInteractor;

  Future<void> addNewPlace({
    required String name,
    required double lat,
    required double lon,
    required String url,
    required String details,
    required String type,
  }) async {
    await _placesInteractor.addNewPlace(
      name: name,
      lat: lat,
      lon: lon,
      url: url,
      details: details,
      type: type,
    );
  }
}
