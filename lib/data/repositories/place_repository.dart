import 'package:dio/dio.dart';

import 'package:places/data/interactors/place_interactor.dart';
import 'package:places/data/models/place.dart';
import 'package:places/ui/my_app/my_app.dart';

class PlaceRepository {
  Future<List<Place>> loadPlaces() async {
    if (isDebugMode) {
      await Future<dynamic>.delayed(const Duration(seconds: 5));
      return _mocks;
    }

    final baseOptions = BaseOptions(
      baseUrl: 'https://test-backend-flutter.surfstudio.ru',
      connectTimeout: 5000,
      receiveTimeout: 5000,
      sendTimeout: 5000,
      responseType: ResponseType.json,
    );
    final dio = Dio(baseOptions);
    final Response response = await dio.get<String>(
      '/place',
      //queryParameters: {'id': 1},
    );
    if (response.statusCode != 200) {
      throw Exception('http error. Error code ${response.statusCode}');
    }

    //return func(response.data);
    return [
      Place(id: 43, wished: true, seen: false, name: '3', type: 'музей'),
      ..._mocks,
    ];
  }
}

///
/// Для isDebugMode = true
///
List<String> mockOfListOfInitialImagesForAdding = [
  'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
  'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
];

///
/// Для isDebugMode = true
///
final List<Place> _mocks = [
  Place(
    name: 'Воронежский областной краеведческий музей',
    lat: 42.8423437,
    lon: 41.8348345,
    url:
        'http://i.mycdn.me/i?r=AzEPZsRbOZEKgBhR0XGMT1RkYyO-1zLFV43SyU6kn1i2PaaKTM5SRkZCeTgDn6uOyic',
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
    url:
        'https://i1.wallbox.ru/wallpapers/main/201249/zdanie-starinnoe-dom-3a26bef.jpg',
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
    url:
        'https://wallpaperscave.ru/images/original/18/08-22/man-made-building-78015.jpg',
    details:
        'Глубина мысли показывает обширность жизненного опыта. Наслаждение мыслью показывает его качество.',
    type: 'парк',
    wished: true,
    seen: true,
    id: 2,
  ),
];
