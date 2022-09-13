import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/provider_di.dart';

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugUserStay = true;
const bool isDebugUserMove = false;

void main() {
  final DI di = DI();

  runApp(ProviderDI(di));
}
