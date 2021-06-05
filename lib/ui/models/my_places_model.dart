import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mocks.dart';
import '../../domain/sight.dart';

class MyPlacesModel with ChangeNotifier{
  void save() {
    mocks.add(
      Sight(
        name: 'Музей',
        lat: 3424324.423,
        lon: 8385733.384,
        url: 'http://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkYyO-1zLFV43SyU6kn1i2PaaKTM5SRkZCeTgDn6uOyic',
        details: 'Описание досто',
        type: 'музей',
      ),
    );
    notifyListeners();
  }

  List<Sight> get interestingPlaces  {
    return mocks;
  }

}