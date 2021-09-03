import 'package:flutter/material.dart';
import 'package:places/data/interactors/repository.dart';
import 'package:places/data/models/sight.dart';

class SightDetailsModel with ChangeNotifier {
  var repository = Repository();

  List<Sight> get sights => repository.sightsStorage.items;
}
