import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/di_provider.dart';
import 'package:places/redux_store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

enum Actions { Increment }

int counterReducer(int state, dynamic action) {
  return action == Actions.Increment ? state + 1 : state;
}

void main() {
  final store = Store<int>(counterReducer, initialState: 0);

  final di = DI();

  runApp(
    StoreProvider<int>(
      store: store,
      child: DIProvider(di),
    ),
  );
}

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;
