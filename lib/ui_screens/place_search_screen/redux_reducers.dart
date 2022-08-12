import 'package:flutter_redux/flutter_redux.dart';
import 'package:places/domain_interactors/search_interactor.dart';
import 'package:places/ui_commons/enums.dart';
import 'package:places/ui_screens/place_search_screen/redux_actions.dart';
import 'package:places/ui_screens/place_search_screen/redux_store.dart';
import 'package:redux/redux.dart';

ReduxStore appReducers(ReduxStore state, dynamic action) {
  if (action is OnInitAction) {
    return ReduxStore(
      searchInteractor: action.searchInteractor,
      lastSearchesSnapshot: [],
      searchResult: [],
      searchStatus: SearchStatus.empty,
    );
  } else if (action is OnStateWasUpdatedAction) {
    return ReduxStore(
      searchInteractor: state.searchInteractor,
      lastSearchesSnapshot: state.searchInteractor.lastSearches,
      searchResult: state.searchInteractor.searchResult,
      searchStatus: state.searchInteractor.searchStatus,
    );
  } else if (action is OnTapOnClearButtonAction) {
    state.searchInteractor.searchPlaces('');
    return state;
  } else if (action is OnTapOnRemoveItemFromHistoryAction) {
    state.searchInteractor.removeItemFromHistory(action.i);
    return state;
  } else if (action is OnTapOnRemoveAllItemsFromHistoryAction) {
    state.searchInteractor.removeAllHelpersFromHistory();
    return state;
  } else if (action is OnTapOnOneOfLastSearchesAction) {
    state.searchInteractor.searchPlaces(state.lastSearchesSnapshot[action.i]);
    return state;
  }
  throw Exception();
}
