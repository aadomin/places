import 'package:places/domain_models/place.dart';

class VisitedAndFavoriteScreenState {
  VisitedAndFavoriteScreenState({
    required this.visitedPlaces,
    required this.favoritePlaces,
  });

  final List<Place> visitedPlaces;
  final List<Place> favoritePlaces;
}
