
class Sight {
  String name = '';
  double lat = 0;
  double lon = 0;
  String url = '';
  String details = '';
  String type = '';

  Sight({
    String name = 'Example obj',
    double lat = 0,
    double lon = 0,
    String url = 'http:',
    String details = 'Description',
    String type = 'Type',
  }) {
    this.name = name;
    this.lat = lat;
    this.lon = lon;
    this.url = url;
    this.details = details;
    this.type = type;
  }

  @override
  String toString() {
    return '$name $lat $lon $url $details $type';
  }
}
