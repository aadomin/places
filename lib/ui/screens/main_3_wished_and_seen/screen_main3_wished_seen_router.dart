import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/screen_main3_wished_seen.dart';
import 'package:places/ui_blocs/places_cubit.dart';
import 'package:places/ui_widgets/network_error_widget.dart';

class ScreenMain3WishedSeenRouter extends StatefulWidget {
  const ScreenMain3WishedSeenRouter({Key? key}) : super(key: key);

  @override
  _ScreenMain3WishedSeenRouterState createState() =>
      _ScreenMain3WishedSeenRouterState();
}

class _ScreenMain3WishedSeenRouterState
    extends State<ScreenMain3WishedSeenRouter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlacesCubit(
        [Place(id: 0)],
      )..init(),
      child: BlocBuilder<PlacesCubit, List<Place>>(
        builder: (context, state) {
          final List<Place> filteredPlacesSnapshot = state;
          if (filteredPlacesSnapshot.isEmpty) {
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
          return ScreenMain3WishedSeen(listOfItems: filteredPlacesSnapshot);
        },
      ),
    );
  }
}
