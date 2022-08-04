import 'package:places/domain_models/place.dart';
import 'package:places/ui_commons/enums.dart';

class ReduxStore {
  ReduxStore({
    required this.searchStatus,
    required this.searchResult,
    required this.lastSearchesSnapshot,
  });

  SearchStatus searchStatus;

  List<Place> searchResult;

  List<String> lastSearchesSnapshot;
}
