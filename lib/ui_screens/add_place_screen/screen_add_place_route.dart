import 'package:flutter/material.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place.dart';

class ScreenAddPlaceRoute extends StatefulWidget {
  const ScreenAddPlaceRoute({Key? key}) : super(key: key);

  @override
  _ScreenAddPlaceRouteState createState() => _ScreenAddPlaceRouteState();
}

class _ScreenAddPlaceRouteState extends State<ScreenAddPlaceRoute> {
  @override
  Widget build(BuildContext context) {
    return const ScreenAddPlace();
  }
}
