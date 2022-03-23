import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain_interactors/place_interactor.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_favorite_and_visited_state.dart';
import 'package:provider/provider.dart';

class VisitedAndFavoriteScreenCubit
    extends Cubit<VisitedAndFavoriteScreenState> {
  VisitedAndFavoriteScreenCubit(VisitedAndFavoriteScreenState initialState,
      {required this.context})
      : super(initialState);

  BuildContext context;

  void init() {
    emit(_getNewState());
  }

  void removeFromFavorites(int id) {
    context.read<PlacesInteractor>().removeFromFavorites(id);
    emit(_getNewState());
  }

  void removeFromVisited(int id) {
    context.read<PlacesInteractor>().removeFromVisited(id);
    emit(_getNewState());
  }

  VisitedAndFavoriteScreenState _getNewState() => VisitedAndFavoriteScreenState(
        favoritePlaces: context.read<PlacesInteractor>().getFavoritesPlaces,
        visitedPlaces: context.read<PlacesInteractor>().getVisitedPlaces,
      );
}
