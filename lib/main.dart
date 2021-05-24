import 'package:flutter/material.dart';
import 'ui/screen/sight_list_screen.dart';
import 'ui/screen/sight_details_screen.dart';
import 'mocks.dart';
import 'ui/screen/visiting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hey, Flutter!',
      home: VisitingScreen(),
        // временное переключение между экранами
        // SightDetailsScreen(mocks[0]),
        // SightListScreen(),
    );
  }
}
