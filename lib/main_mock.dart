import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/di_mock.dart';
import 'package:places/di_provider.dart';

enum DebugUserLocation { takenFromServer, fixed, changing }

const DebugUserLocation debugUserLocation = DebugUserLocation.fixed;

const bool isDebugModeForImages = true; // TODO repository

void main() {
  final DI di = DIMock();

  runApp(DIProvider(di));
}
