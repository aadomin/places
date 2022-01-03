import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';
import 'package:places/ui/screens/main_3_wished_and_seen/screen_main3_favorite_and_visited.dart';
import 'package:places/ui_blocs/places_cubit.dart';
import 'package:places/ui_widgets/network_error_widget.dart';

class ScreenMain3FavoriteAndVisitedRouter extends StatefulWidget {
  const ScreenMain3FavoriteAndVisitedRouter({Key? key}) : super(key: key);

  @override
  _ScreenMain3FavoriteAndVisitedRouterState createState() =>
      _ScreenMain3FavoriteAndVisitedRouterState();
}

class _ScreenMain3FavoriteAndVisitedRouterState
    extends State<ScreenMain3FavoriteAndVisitedRouter> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlacesCubit(
        VisitedAndFavoriteScreenState(
          visitedPlaces: [Place(id: 0)],
          favoritePlaces: [Place(id: 0)],
        ),
      )..init(),
      child: BlocBuilder<PlacesCubit, VisitedAndFavoriteScreenState>(
        builder: (context, state) {
          if (placeInteractor.isRequestDoneWithError) {
            return const Scaffold(
              body: NetworkErrorWidget(),
            );
          }
          return ScreenMain3FavoriteAndVisited(
            visitedPlaces: state.visitedPlaces,
            favoritePlaces: state.favoritePlaces,
          );
        },
      ),
    );
  }
}
