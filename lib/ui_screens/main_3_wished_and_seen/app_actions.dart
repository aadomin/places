abstract class AppAction {}

class RemoveFromFavoritesAction extends AppAction {
  RemoveFromFavoritesAction(this.id);
  final int id;
}

class RemoveFromVisitedAction extends AppAction {
  RemoveFromVisitedAction(this.id);
  final int id;
}

class LoadDataAction extends AppAction {}