// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MobxStore on MobxStoreBase, Store {
  final _$allPlacesAtom = Atom(name: 'MobxStoreBase.allPlaces');

  @override
  List<Place> get allPlaces {
    _$allPlacesAtom.reportRead();
    return super.allPlaces;
  }

  @override
  set allPlaces(List<Place> value) {
    _$allPlacesAtom.reportWrite(value, super.allPlaces, () {
      super.allPlaces = value;
    });
  }

  final _$isRequestDoneWithErrorAtom =
      Atom(name: 'MobxStoreBase.isRequestDoneWithError');

  @override
  bool get isRequestDoneWithError {
    _$isRequestDoneWithErrorAtom.reportRead();
    return super.isRequestDoneWithError;
  }

  @override
  set isRequestDoneWithError(bool value) {
    _$isRequestDoneWithErrorAtom
        .reportWrite(value, super.isRequestDoneWithError, () {
      super.isRequestDoneWithError = value;
    });
  }

  final _$initPlacesAsyncAction = AsyncAction('MobxStoreBase.initPlaces');

  @override
  Future<void> initPlaces() {
    return _$initPlacesAsyncAction.run(() => super.initPlaces());
  }

  final _$MobxStoreBaseActionController =
      ActionController(name: 'MobxStoreBase');

  @override
  void removeFromFavorites(int id) {
    final _$actionInfo = _$MobxStoreBaseActionController.startAction(
        name: 'MobxStoreBase.removeFromFavorites');
    try {
      return super.removeFromFavorites(id);
    } finally {
      _$MobxStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFromVisited(int id) {
    final _$actionInfo = _$MobxStoreBaseActionController.startAction(
        name: 'MobxStoreBase.removeFromVisited');
    try {
      return super.removeFromVisited(id);
    } finally {
      _$MobxStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAtAll(int id) {
    final _$actionInfo = _$MobxStoreBaseActionController.startAction(
        name: 'MobxStoreBase.removeAtAll');
    try {
      return super.removeAtAll(id);
    } finally {
      _$MobxStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToFavorites(int id) {
    final _$actionInfo = _$MobxStoreBaseActionController.startAction(
        name: 'MobxStoreBase.addToFavorites');
    try {
      return super.addToFavorites(id);
    } finally {
      _$MobxStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToVisitedPlaces(int id) {
    final _$actionInfo = _$MobxStoreBaseActionController.startAction(
        name: 'MobxStoreBase.addToVisitedPlaces');
    try {
      return super.addToVisitedPlaces(id);
    } finally {
      _$MobxStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allPlaces: ${allPlaces},
isRequestDoneWithError: ${isRequestDoneWithError}
    ''';
  }
}
