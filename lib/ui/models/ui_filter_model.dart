import 'package:flutter/material.dart';

class MyFilterModel with ChangeNotifier{

  bool _isRestActive = false;
  bool get isRestActive => _isRestActive;
  set isRestActive (bool value){
    _isRestActive = value;
    notifyListeners();
  }

  
}