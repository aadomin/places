import 'package:places/data_repositories/place_repository.dart';
import 'package:places/domain_models/place.dart';

///
/// Доменный слой приложения. Базовая бизнес-логика
/// Места
///
class PlaceEntity {
  PlaceEntity({required this.placeRepository}) {
    init();
  }
  PlaceRepository placeRepository;

  bool isLoading = false;
  bool hasNeedToBeReloaded = true;
  List<Place> loadedPlaces = [];

  /// был ли последний запрос данных закончен с ошибкой
  bool get isRequestDoneWithError => placeRepository.isRequestDoneWithError;
  set isRequestDoneWithError(bool value) =>
      placeRepository.isRequestDoneWithError = value;

  void init() {
    hasNeedToBeReloaded = true;
    loadPlacesIfNeed();
  }

  /// загрузить место
  Future<void> loadPlacesIfNeed() async {
    isLoading = true;
    if (hasNeedToBeReloaded == true) {
      loadedPlaces = await placeRepository.getAllPlaces();
      hasNeedToBeReloaded = false;
    }
    isLoading = false;
  }

  /// добавить место
  Future<void> addPlace(Place newPlace) async {
    // TODO возвращаемое значение
    await placeRepository.addPlace(newPlace);
  }
}
