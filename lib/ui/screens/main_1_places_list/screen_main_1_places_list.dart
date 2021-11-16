import 'dart:async';
import 'package:places/main.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screens/main_1_places_list/widget_main_list.dart';
import 'package:places/ui/screens/main_1_places_list/widget_new_place_button.dart';
import 'package:places/ui_widgets/network_error_widget.dart';
import 'package:provider/provider.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_interactors/place_interactor.dart';

class ScreenMain1PlacesList extends StatefulWidget {
  const ScreenMain1PlacesList({Key? key}) : super(key: key);

  @override
  _ScreenMain1PlacesListState createState() => _ScreenMain1PlacesListState();
}

class _ScreenMain1PlacesListState extends State<ScreenMain1PlacesList> {
  // просто контроллер
  final _placesListController = StreamController<List<Place>>();

  // просто init
  @override
  void initState() {
    final _tempItem = [Place(id: 0)];
    _placesListController.sink.add(_tempItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // просто доступ к интерактору
    final List<Place> filteredPlaces =
        context.watch<PlaceInteractor>().filteredPlaces;

    // просто эмитить стейт
    _placesListController.sink.add(filteredPlaces);

    return Scaffold(
      body: StreamBuilder<List<Place>>(
        stream: _placesListController.stream,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const CircularProgressIndicator();
          } else {
            final List<Place> filteredPlacesSnapshot = snapshot.data!;
            if (placeInteractor.isRequestDoneWithError) {
              return const NetworkErrorWidget();
            } else {
              return Stack(
                children: [
                  WidgetMainList(
                      filteredPlacesSnapshot: filteredPlacesSnapshot),
                  const WidgetNewPlaceButton(),
                ],
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _placesListController.close();
    print('unload');
  }
}
