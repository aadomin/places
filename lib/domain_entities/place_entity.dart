import 'package:places/data_repositories/place_repository.dart';
import 'package:places/domain_models/place.dart';

class PlaceEntity {
  PlaceEntity({required this.placeRepository});

  PlaceRepository placeRepository;

  //

  List<Place> get loadedPlaces => placeRepository.loadedPlaces;
  set loadedPlaces(List<Place> value) => placeRepository.loadedPlaces = value;

  bool get isRequestDoneWithError => placeRepository.isRequestDoneWithError;
  set isRequestDoneWithError(bool value) =>
      placeRepository.isRequestDoneWithError = value;

  Future<void> loadPlaces() async {
    await placeRepository.loadPlaces();
  }

  Future<void> addPlace(Place newPlace) async {
    // ignore: unawaited_futures
    placeRepository.addPlace(newPlace);
  }
}
