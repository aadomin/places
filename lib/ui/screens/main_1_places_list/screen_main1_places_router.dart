import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/main.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screens/main_1_places_list/screen_main1_places.dart';
import 'package:places/ui_interactors/place_interactor.dart';
import 'package:places/ui_widgets/network_error_widget.dart';
import 'package:places/domain_models/place.dart';

class ScreenMain1PlacesRouter extends StatefulWidget {
  const ScreenMain1PlacesRouter({Key? key}) : super(key: key);

  @override
  _ScreenMain1PlacesRouterState createState() =>
      _ScreenMain1PlacesRouterState();
}

class _ScreenMain1PlacesRouterState extends State<ScreenMain1PlacesRouter> {
  @override
  Widget build(BuildContext context) {
    final List<Place> filteredPlaces =
        context.watch<PlaceInteractor>().filteredPlaces;

    if (filteredPlaces.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (placeInteractor.isRequestDoneWithError) {
      return const Scaffold(
        body: NetworkErrorWidget(),
      );
    }
    return ScreenMain1Places(
      filteredPlacesSnapshot: filteredPlaces,
    );
  }
}
