import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/domain_models/place.dart';
import 'package:places/ui_commons/enums.dart';

class ReduxStore {
  ReduxStore({
    required this.searchStatus,
    required this.searchResult,
    required this.lastSearchesSnapshot,
    required this.searchInteractor,
  });

  SearchStatus searchStatus;

  List<Place> searchResult;

  List<String> lastSearchesSnapshot;

  SearchInteractor searchInteractor;
}
