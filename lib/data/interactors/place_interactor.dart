import 'package:places/data/repositories/place_repository.dart';
import 'package:places/data/models/place.dart';

class PlaceInteractor {
  List<Sight> get items => mocks;

  List<String> get listOfInitialPhotosForAdding =>
      mockOfListOfInitialImagesForAdding;
}
