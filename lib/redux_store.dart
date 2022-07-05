import 'package:places/domain_models/place.dart';

class PlacesStore {
  PlacesStore({
    required this.filteredPlaces,
    required this.visitedPlaces,
  });

  List<Place> filteredPlaces = [];
  List<Place> visitedPlaces = [];
}
