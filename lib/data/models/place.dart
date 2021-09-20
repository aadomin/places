import 'dart:math';

class Place {
  Place({
    required this.id,
    required this.wished,
    required this.seen,
    this.name = 'Example object',
    this.lat = 0,
    this.lon = 0,
    this.url = 'http:',
    this.details = 'Description',
    this.type = 'Type',
    this.timeOfWork = 'Закрыто до 09:00',
  });

  Place.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id'].toString()),
        wished = false,
        seen = false,
        name = json['name'].toString(),
        lat = double.parse(json['lat'].toString()),
        lon = double.parse(json['lng'].toString()),
        url = '4', //TODO
        details = json['description'].toString(),
        type = 'музей', //TODO
        timeOfWork = 'работает с 8:00 до 17:00',
        currentDistanceToUser = 0;

  late int id;
  bool wished;
  bool seen;
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final String type;
  final String timeOfWork;
  double currentDistanceToUser = 0;

  @override
  String toString() {
    return '$name $lat $lon $url $details $type';
  }
}
