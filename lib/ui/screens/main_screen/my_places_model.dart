import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/data/mocks.dart';
import 'package:places/domain/sight.dart';

class MyPlacesModel with ChangeNotifier {
  void save({
    required String name,
    required double lat,
    required double lon,
    required String url,
    required String details,
    required String type,
    required bool wished,
  }) {
    final random = Random();
    mocks.add(
      Sight(
        name: name,
        lat: lat,
        lon: lon,
        url: url,
        details: details,
        type: type,
        id: random.nextInt(29381257143242),
      ),
    );
    notifyListeners();
  }

  List<Sight> get interestingPlaces => mocks;

  List<Sight> get wishedPlaces => mocks.where((s) => s.wished).toList();

  List<Sight> get seenPlaces => mocks.where((s) => s.seen).toList();

  void delFromWished(int index) {
    mocks[index].wished = false;
  }

  void delFromSeen(int index) {
    mocks[index].wished = false;
  }
}
