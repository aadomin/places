import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';
import 'package:places/ui_my_app/platform_detector.dart';
import 'package:places/ui_widgets/widget_add_to_calendar_cuper_modal.dart';

class PlacesCubit extends Cubit<VisitedAndFavoriteScreenState> {
  PlacesCubit(VisitedAndFavoriteScreenState initialState) : super(initialState);

  void init() {
    final newState = VisitedAndFavoriteScreenState(
      favoritePlaces: placeInteractor.getFavoritesPlaces,
      visitedPlaces: placeInteractor.getVisitedPlaces,
    );
    emit(newState);
  }

  void removeFromFavorites(int id) {
    placeInteractor.removeFromFavorites(id);

    final newState = VisitedAndFavoriteScreenState(
      favoritePlaces: placeInteractor.getFavoritesPlaces,
      visitedPlaces: placeInteractor.getVisitedPlaces,
    );
    emit(newState);
  }

  void removeFromVisited(int id) {
    placeInteractor.removeFromVisited(id);

    final newState = VisitedAndFavoriteScreenState(
      favoritePlaces: placeInteractor.getFavoritesPlaces,
      visitedPlaces: placeInteractor.getVisitedPlaces,
    );
    emit(newState);
  }

  Future<void> schedulePlace(BuildContext context, int id) async {
    late final DateTime? _result;
    if (PlatformDetector.isAndroid || PlatformDetector.isWeb) {
      _result = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(const Duration(days: 1)),
        lastDate: DateTime.now().add(const Duration(days: 365)),
      );
    }
    if (PlatformDetector.isIOS) {
      _result = await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return const AddToCalendarCuperModal();
        },
      );
    }

    if (_result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('added to calendar at $_result'),
        ),
      );
    }
  }
}

class VisitedAndFavoriteScreenState {
  VisitedAndFavoriteScreenState({
    required this.visitedPlaces,
    required this.favoritePlaces,
  });

  final List<Place> visitedPlaces;
  final List<Place> favoritePlaces;
}
