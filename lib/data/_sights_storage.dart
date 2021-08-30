import 'package:places/data/mocks.dart';
import 'package:places/domain/sight.dart';

class SightsStorage {
  List<Sight> get items => mocks;

  List<String> get listOfInitialPhotosForAdding =>
      mockOfListOfInitialImagesForAdding;
}
