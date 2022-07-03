import 'package:places/domain_models/place.dart';

class ScreenMain3FavAndVisitState {
  ScreenMain3FavAndVisitState({
    required this.visitedPlaces,
    required this.favoritePlaces,
  });

  final List<Place> visitedPlaces;
  final List<Place> favoritePlaces;
}
