import 'package:flutter/material.dart';

import 'package:places/data/interactors/place_interactor.dart';
import 'package:places/data/models/place.dart';

class SightDetailsModel with ChangeNotifier {
  final placeInteractor = PlaceInteractor();
}
