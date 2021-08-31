import 'package:flutter/material.dart';
import 'package:places/data/mocks.dart';
import 'package:places/domain/sight.dart';

class MainScreenModel with ChangeNotifier {
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
