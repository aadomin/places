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

  //ignore: sort_constructors_first
  Place.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'].toString();
    lat = double.parse(json['lat'].toString());
    lon = double.parse(json['lng'].toString());

    if (json['urls'] != null) {
      final dynamic temp = json['urls'];
      final arr0 = <String>[];
      //TODO(me): проверить что temp это действительно масссив

      if (temp is List)
      //TODO(me): cast
      //ТУТВОПРОС!
      //temp.cast<String>()
      {
        //ignore: avoid_dynamic_calls, avoid_annotating_with_dynamic
        for (final dynamic e in temp) {
          if (e is String) arr0.add(e.toString());
        }

        url = arr0;
      }
    }
    details = json['description'].toString();

    //таблица замены
    final Map<String, String> replaceTable = {
      'other': 'Особое место',
      'monument': 'Особое место',
      'theatre': 'Особое место',
      'museum': 'Музей',
      'park': 'Парк',
      'hotel': 'Отель',
      'restaurant': 'Ресторан',
      'temple': 'Особое место',
      'cafe': 'Кафе',
    };
    type = replaceTable[json['placeType'].toString()] ?? 'Особое место';

    timeOfWork = 'работает с 8:00 до 17:00';
    currentDistanceToUser = 0;
    wished = false;
    seen = false;
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
