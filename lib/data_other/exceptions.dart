class NetworkException implements Exception {
  NetworkException({
    required this.queryPath,
    required this.errorName,
  }) {
    print(this);
  }

  final String queryPath;
  final String errorName;

  @override
  String toString() => 'В запросе $queryPath возникла ошибка: $errorName';
}
