import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../mocks.dart';
import '../../domain/sight.dart';

class MyPlacesModel with ChangeNotifier {
  void save({
    String name,
    double lat,
    double lon,
    String url,
    String details,
    String type,
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

  List<Sight> get interestingPlaces {
    return mocks;
  }

  List<Sight> getSearchResults(_searchText) {
    //TODO запросы к бд или серверу
    return mocks;
  }



  
}
