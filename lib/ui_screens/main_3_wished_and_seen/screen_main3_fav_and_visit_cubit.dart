import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_state.dart';
import 'package:provider/provider.dart';

// ТУТВОПРОС - также здесь и DI
class ScreenMain3FavAndVisitCubit extends Cubit<ScreenMain3FavAndVisitState> {
  ScreenMain3FavAndVisitCubit(ScreenMain3FavAndVisitState initialState,
      {required this.context})
      : super(initialState);

  BuildContext context;

  void init() {
    emit(_getNewState());
  }

  void removeFromFavorites(int id) {
    context.read<DI>().placesInteractor.removeFromFavorites(id);
    emit(_getNewState());
  }

  void removeFromVisited(int id) {
    context.read<DI>().placesInteractor.removeFromVisited(id);
    emit(_getNewState());
  }

  ScreenMain3FavAndVisitState _getNewState() => ScreenMain3FavAndVisitState(
        favoritePlaces: context.read<DI>().placesInteractor.getFavoritesPlaces,
        visitedPlaces: context.read<DI>().placesInteractor.getVisitedPlaces,
      );
}
