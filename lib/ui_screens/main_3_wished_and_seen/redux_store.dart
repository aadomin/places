import 'package:places/domain_models/place.dart';

class ReduxStore {
  ReduxStore({
    this.favoritePlaces = const [],
    this.visitedPlaces = const [],
  });

  List<Place> favoritePlaces;
  List<Place> visitedPlaces;
}
