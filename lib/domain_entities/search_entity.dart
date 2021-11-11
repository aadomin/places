import 'package:places/data_repositories/search_repository.dart';

/// История поиска
class SearchEntity {
  final searchRepository = SearchRepository();

  List<String> get lastSearches {
    return searchRepository.lastSearches;
  }

  set lastSearches(List<String> value) {
    searchRepository.lastSearches = value;
  }
}
