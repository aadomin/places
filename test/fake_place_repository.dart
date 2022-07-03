import 'package:dio/dio.dart';
import 'package:places/data_other/mocks.dart';

import 'package:places/data_repositories/place_repository.dart';
import 'package:places/domain_models/place.dart';

class FakePlaceRepository extends PlaceRepository {
  FakePlaceRepository({
    required this.fakeDio,
  }) : super(dio: fakeDio);

  final Dio fakeDio;

  @override
  Future<List<Place>> getAllPlaces() async => mocks;

  @override
  Future<void> addPlace(Place newPlace) async {
    return;
  }
}
