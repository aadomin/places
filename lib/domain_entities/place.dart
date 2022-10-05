///
/// Модель места
///
class Place {
  Place({
    required this.id,
    this.name = 'Example object',
    this.lat = 0,
    this.lon = 0,
    this.url = const ['http'],
    this.details = 'Description',
    this.type = 'Type',

    // TODO(me): время работы
    this.timeOfWork = 'Закрыто до 09:00',
    this.wished = false,
    this.seen = false,
  });

  late final int id;
  late final String name;
  late final double lat;
  late final double lon;
  late final List<String> url;
  late final String details;
  late final String type;
  late final String timeOfWork;
  late bool wished;
  late bool seen;
  double currentDistanceToUser = 0;

  @override
  String toString() {
    final trimDetails = details.length > 5 ? details.substring(0, 4) : details;
    return '$id $name $lat $lon $url $trimDetails $type \n\n/n/n';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _json = <String, dynamic>{};

    _json['id'] = id;

    _json['lat'] = lat;
    _json['lng'] = lon;
    _json['name'] = name;
    _json['urls'] = ['https://hive.com'];
    _json['placeType'] = 'cafe';
    _json['description'] = details;

    return _json;
  }
}
