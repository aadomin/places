import 'package:flutter/material.dart';
import 'package:places/data/repository.dart';
import 'package:places/domain/FilterItem.dart';

class SightDetailsModel with ChangeNotifier {
  var repository = Repository();

  get sights => repository.sightsStorage.items;
}
