import 'package:mobx/mobx.dart';
import 'package:places/data/interactors/filter_interactor.dart';
import 'package:places/data/interactors/geo_interactor.dart';
import 'package:places/data/models/filter_item.dart';
import 'package:places/data/models/place.dart';
import 'package:places/data/repositories/place_repository.dart';

part 'mobx_store.g.dart';

class MobxStore = MobxStoreBase with _$MobxStore;

abstract class MobxStoreBase with Store {
  MobxStoreBase() {
    initPlaces(); //асинхронно
  }

  // MODULES
  final placeRepository = PlaceRepository();
  final geoInteractor = GeoInteractor();
  final filterInteractor = FilterInteractor();

  @observable
  List<Place> allPlaces = [];

  @observable
  bool isRequestDoneWithError = false;

  @action
  Future<void> initPlaces() async {
    await placeRepository.loadPlaces();
    if (placeRepository.isRequestDoneWithError) {
      isRequestDoneWithError = true;
      return;
    }
    allPlaces = placeRepository.loadedPlaces;
    updateDistancesToUser();
  }

  List<Place> getPlaces({
    required int radius,
    required List<FilterItem> categories,
  }) {
    final List<String> _selectedCategories = categories
        .where((element) => element.isSelected)
        .map((element) => element.name)
        .toList();

    // filtering and sorting
    updateDistancesToUser();
    final List<Place> _filteredAndSortedPlacesList = allPlaces
        .where((element) => _selectedCategories
            .any((e) => element.type.toLowerCase() == e.toLowerCase()))
        .toList()
      ..sort(
        (a, b) => a.currentDistanceToUser.compareTo(b.currentDistanceToUser),
      );

    return _filteredAndSortedPlacesList;
  }

  void updateDistancesToUser() {
    allPlaces = allPlaces.map((place) {
      place.currentDistanceToUser = geoInteractor.distanceFromPointToUser(
        lat: place.lat,
        lon: place.lon,
      );
      return place;
    }).toList();
  }

  /// отображается на экране "Список интересных мест" и фильтруется в результатах Поиска
  List<Place> get filteredPlaces {
    return getPlaces(
      radius: filterInteractor.radius,
      categories: filterInteractor.filterItems,
    );
  }

  Place getPlaceDetails(int id) {
    return allPlaces[indexOfPlaceInAllById(id)];
  }

  @action
  void removeFromFavorites(int id) {
    allPlaces[indexOfPlaceInAllById(id)].wished = false;
  }

  @action
  void removeFromVisited(int id) {
    allPlaces[indexOfPlaceInAllById(id)].seen = false;
  }

  @action
  void removeAtAll(int id) {
    allPlaces.removeAt(indexOfPlaceInAllById(id));
  }

  @action
  void addToFavorites(int id) {
    allPlaces[indexOfPlaceInAllById(id)].wished = true;
  }

  @action
  void addToVisitedPlaces(int id) {
    allPlaces[indexOfPlaceInAllById(id)].seen = true;
  }

  int indexOfPlaceInAllById(int id) {
    for (var i = 0; i < allPlaces.length; i++) {
      if (allPlaces[i].id == id) {
        return i;
      }
    }
    throw Exception('Нет такого id');
  }
}
