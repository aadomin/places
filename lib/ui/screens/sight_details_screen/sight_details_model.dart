import 'package:flutter/material.dart';

import 'package:places/data/interactors/_core.dart';
import 'package:places/data/models/place.dart';

class SightDetailsModel with ChangeNotifier {
  var core = CoreSingleton();

  List<Sight> get sights => core.sightsStorage.items;
}
