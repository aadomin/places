import 'package:places/data_repositories/search_repository.dart';
import 'package:places/domain_entities/history_of_search_service.dart';

///
/// Доменный слой приложения. Базовая бизнес-логика
/// Поиск
///
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

  List<String> newListOfLastSearches({
    required String newInput,
    required List<String> lastSearches,
    required int maxCountOfItems,
  }) {
    return HistoryOfSearchService.newListOfLastSearches(
        newInput: newInput,
        lastSearches: lastSearches,
        maxCountOfItems: maxCountOfItems);
  }
}
