class Sight {
  final String name;
  final double lat;
  final double lon;
  final String url;
  final String details;
  final String type;
  final String timeOfWork;
  bool wished;
  bool seen;
  final int id;

  Sight({
    this.name = 'Example object',
    this.lat = 0,
    this.lon = 0,
    this.url = 'http:',
    this.details = 'Description',
    this.type = 'Type',
    this.timeOfWork = 'Закрыто до 09:00',
    this.wished = false,
    this.seen = false,
    required this.id,
  });

  @override
  String toString() {
    return '$name $lat $lon $url $details $type';
  }
}
