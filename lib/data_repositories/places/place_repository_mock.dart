// ignore_for_file: avoid_redundant_argument_values

import 'package:dio/dio.dart';
import 'package:places/data_repositories/places/place_repository.dart';
import 'package:places/domain_entities/place.dart';

///
/// Saving mock places data
///
class PlaceRepositoryMock implements PlaceRepository {
  PlaceRepositoryMock({
    required this.dio,
  });

  @override
  final Dio dio;

  /// Mock - Load all places and return it
  @override
  Future<List<Place>> getAllPlaces() async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    // TODO(me): переделать мокирование - добавить возможность ошибки
    return _mocks;
  }

  /// Mock - Add place to the server
  @override
  Future<void> addPlace(Place newPlace) async {
    await Future<dynamic>.delayed(const Duration(seconds: 3));
    return;
  }
}

/// Mock data
final List<Place> _mocks = [
  Place(
    name: 'Воронежский областной краеведческий музей',
    lat: 42.8423437,
    lon: 41.8348345,
    urls: [
      'http://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkYyO-1zLFV43SyU6kn1i2PaaKTM5SRkZCeTgDn6uOyic',
      'http://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkYyO-1zLFV43SyU6kn1i2PaaKTM5SRkZCeTgDn6uOyic',
      'http://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkYyO-1zLFV43SyU6kn1i2PaaKTM5SRkZCeTgDn6uOyic',
      'http://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkYyO-1zLFV43SyU6kn1i2PaaKTM5SRkZCeTgDn6uOyic',
    ],
    details:
        'Описывая достопримечательность, можно лишь наслаждаться ее видами и думать о вечном, размышляя о странном.',
    type: 'музей',
    wished: true,
    seen: false,
    id: 0,
  ),
  Place(
    name: 'Ресторан "Игнатов"',
    lat: 52.4483423,
    lon: 59.3423434,
    urls: [
      'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
      'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
      'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
    ],
    details:
        'Созерцание вечности развлекает разум не меньше, чем прекрасные женские юбки. Хотя, снег тает, и самооценка на фоне этого тоже тает.',
    type: 'ресторан',
    wished: true,
    seen: true,
    id: 1,
  ),
  Place(
    name: 'Вилладж',
    lat: 59.8242123,
    lon: 40.1341443,
    urls: [
      'https://wallpaperscave.ru/images/original/18/08-22/man-made-building-78015.jpg',
      'https://wallpaperscave.ru/images/original/18/08-22/man-made-building-78015.jpg',
    ],
    details:
        'Глубина мысли показывает обширность жизненного опыта. Наслаждение мыслью показывает его качество.',
    type: 'парк',
    wished: true,
    seen: true,
    id: 2,
  ),
];
