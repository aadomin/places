import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/di_provider.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(DIProvider());
}

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;
