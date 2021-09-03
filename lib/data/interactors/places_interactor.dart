import 'package:places/data/repositories/mocks.dart';
import 'package:places/data/models/sight.dart';

class PlaceInteractor {
  List<Sight> get items => mocks;

  List<String> get listOfInitialPhotosForAdding =>
      mockOfListOfInitialImagesForAdding;
}
