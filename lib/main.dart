import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/di_provider.dart';

void main() {
  final di = DI();
  runApp(DIProvider(di));
}

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;
