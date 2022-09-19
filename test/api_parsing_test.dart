import 'package:test/test.dart';
import 'dart:convert';
import 'package:places/data_api/places_get_api.dart';

void main() {
  test('api parsing must work', () {
    String rawJson = r'''[{
      "id": 173,
      "lat": 60.01871,
      "lng": 30.62357,
      "name": "местечко",
      "urls": [
        "https://test-backend-flutter.surfstudio.ru/files/1616509123661.jpg",
        "https://test-backend-flutter.surfstudio.ru/files/1616509123663.jpg"
      ],
      "placeType": "other",
      "description": "местечко на 6 этаже"
    }]''';

    rawJson = '{"places": $rawJson}';
    PlacesGetAPI data = PlacesGetAPI.fromJson(jsonDecode(rawJson));
    print(data);

    expect(data.places.first.name, equals("местечко"));
  });
}
