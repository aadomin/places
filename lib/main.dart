import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/di_provider.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

// enum Actions { increment }

// //
// // ignore: avoid_annotating_with_dynamic
// int counterReducer(int state, dynamic action) {
//   return action == Actions.increment ? state + 1 : state;
// }

void main() {
  Bloc.observer = MyBlocObserver();

  //
  // final store = Store<int>(counterReducer, initialState: 0);

  final di = DI();
  runApp(
    DIProvider(di),
  );
}

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;
