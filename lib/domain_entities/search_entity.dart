import 'package:places/data_repositories/search_repository.dart';

/// История поиска
class SearchEntity {
  SearchEntity({
    required this.searchRepository,
  });

  final SearchRepository searchRepository;

  List<String> get lastSearches {
    return searchRepository.lastSearches;
  }

  set lastSearches(List<String> value) {
    searchRepository.lastSearches = value;
  }
}
