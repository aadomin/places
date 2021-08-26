import 'package:flutter/material.dart';
import 'package:places/data/repository.dart';

class SightDetailsModel with ChangeNotifier {
  var repository = Repository();

  get sights => repository.sightsStorage.items;
}
