import 'package:places/domain_interactors/search_interactor.dart';

abstract class MyAction {}

class OnInitAction extends MyAction {
  OnInitAction(this.searchInteractor);
  SearchInteractor searchInteractor;
}

class OnStateWasUpdatedAction extends MyAction {
  OnStateWasUpdatedAction();
}

class OnTapOnClearButtonAction extends MyAction {}

class OnTapOnRemoveItemFromHistoryAction extends MyAction {
  OnTapOnRemoveItemFromHistoryAction(this.i);
  final int i;
}

class OnTapOnRemoveAllItemsFromHistoryAction extends MyAction {}

class OnTapOnOneOfLastSearchesAction extends MyAction {
  OnTapOnOneOfLastSearchesAction(this.i);
  final int i;
}
