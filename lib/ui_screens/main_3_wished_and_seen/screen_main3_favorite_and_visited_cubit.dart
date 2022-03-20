import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain_entities/place_entity.dart';
import 'package:places/main.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_favorite_and_visited_state.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_widgets_commons/widget_add_to_calendar_cuper_modal.dart';
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
    context.read<PlaceEntity>().removeFromFavorites(id);
    emit(_getNewState());
  }

  void removeFromVisited(int id) {
    context.read<PlaceEntity>().removeFromVisited(id);
    emit(_getNewState());
  }

  VisitedAndFavoriteScreenState _getNewState() => VisitedAndFavoriteScreenState(
        favoritePlaces: context.read<PlaceEntity>().getFavoritesPlaces,
        visitedPlaces: context.read<PlaceEntity>().getVisitedPlaces,
      );

  Future<void> showPopupSchedulePlace(BuildContext context, int id) async {
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
          return const WidgetAddToCalendarCuperModal();
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
