import 'package:flutter/material.dart';
import '../../../data/mocks.dart';
import '../../../domain/sight.dart';

class MyPlacesModel with ChangeNotifier {
  void save({
    String name,
    double lat,
    double lon,
    String url,
    String details,
    String type,
    bool wished,
  }) {
    mocks.add(
      Sight(
        name: name,
        lat: lat,
        lon: lon,
        url: url,
        details: details,
        type: type,
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
