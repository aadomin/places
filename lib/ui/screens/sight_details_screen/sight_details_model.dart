import 'package:flutter/material.dart';

import 'package:places/data/interactors/core.dart';
import 'package:places/data/models/sight.dart';

class SightDetailsModel with ChangeNotifier {
  var core = CoreSingleton();

  List<Sight> get sights => core.sightsStorage.items;
}
