import 'package:places/data_repositories/place_repository.dart';
import 'package:places/domain_models/place.dart';

///
/// Доменный слой приложения. Базовая бизнес-логика
/// Места
///
class PlaceEntity {
  PlaceEntity({required this.placeRepository});

  PlaceRepository placeRepository;

  // TODO(me): ТУТ ПЕРЕДЕЛАТЬ

  /// загруженные места
  List<Place> get loadedPlaces => placeRepository.loadedPlaces;
  set loadedPlaces(List<Place> value) => placeRepository.loadedPlaces = value;

  /// был ли последний запрос данных закончен с ошибкой
  bool get isRequestDoneWithError => placeRepository.isRequestDoneWithError;
  set isRequestDoneWithError(bool value) =>
      placeRepository.isRequestDoneWithError = value;

  /// загрузить место
  Future<void> loadPlaces() async {
    // TODO(me): правильно ли тут сделано?
    await placeRepository.loadPlaces();
  }

  /// добавить место
  Future<void> addPlace(Place newPlace) async {
    // ignore: unawaited_futures
    placeRepository.addPlace(newPlace);
  }
}
