import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_cubit.dart';
import 'package:places/ui_screens/main_3_wished_and_seen/screen_main3_fav_and_visit_state.dart';

/// Экран 3. DI
///
class ScreenMain3FavoriteAndVisitedDI extends StatefulWidget {
  const ScreenMain3FavoriteAndVisitedDI({Key? key}) : super(key: key);

  @override
  _ScreenMain3FavoriteAndVisitedDIState createState() =>
      _ScreenMain3FavoriteAndVisitedDIState();
}

class _ScreenMain3FavoriteAndVisitedDIState
    extends State<ScreenMain3FavoriteAndVisitedDI> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScreenMain3FavAndVisitCubit(
        ScreenMain3FavAndVisitState(
          visitedPlaces: [Place(id: 0)],
          favoritePlaces: [Place(id: 0)],
        ),
        context: context,
      )..init(),
      child:
          BlocBuilder<ScreenMain3FavAndVisitCubit, ScreenMain3FavAndVisitState>(
        builder: (context, state) {
          return ScreenMain3FavAndVisit(
            visitedPlaces: state.visitedPlaces,
            favoritePlaces: state.favoritePlaces,
          );
        },
      ),
    );
  }
}
