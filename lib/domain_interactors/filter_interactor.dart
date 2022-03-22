import 'package:flutter/material.dart';
import 'package:places/domain_models/filter_condition.dart';

class FilterInteractor with ChangeNotifier {
  late FilterCondition _filterConditions = FilterCondition();

  FilterCondition get filterConditions => _filterConditions;

  set filterConditions(FilterCondition value) {
    _filterConditions = value;
    notifyListeners();
  }
}
