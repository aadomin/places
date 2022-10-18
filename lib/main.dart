import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/di_provider.dart';

enum DebugUserLocation { takenFromServer, fixed, changing }

const DebugUserLocation debugUserLocation = DebugUserLocation.fixed;

const bool isDebugModeForImages = false; // TODO after image uploading implementing

void main() {
  final DI di = DI();

  runApp(DIProvider(di));
}
