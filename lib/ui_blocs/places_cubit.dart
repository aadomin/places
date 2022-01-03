import 'package:bloc/bloc.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/main.dart';

/// {@template counter_cubit}
/// A [Cubit] which manages an [List<Place>] as its state.
/// {@endtemplate}
class PlacesCubit extends Cubit<List<Place>> {
  PlacesCubit(List<Place> initialState) : super(initialState);

  final List<Place> filteredPlaces = placeInteractor.filteredPlaces;

  /// First func for the current state.
  void init() => emit(filteredPlaces);
}
