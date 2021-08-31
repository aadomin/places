import 'package:flutter/material.dart';
import 'package:places/data/repository.dart';
import 'package:places/domain/sight.dart';

class SightDetailsModel with ChangeNotifier {
  var repository = Repository();

  List<Sight> get sights => repository.sightsStorage.items;
}
