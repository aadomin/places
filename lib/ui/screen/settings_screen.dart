import 'package:flutter/material.dart';
import "../res/text_styles.dart";

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'Настройки',
                style: visitingScreenHeader,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(children: [
            ElevatedButton(
              child: Text('Светлая тема'),
              onPressed: () {},
            ),
            ElevatedButton(
              child: Text('Темная тема'),
              onPressed: () {},
            ),
          ]),
        ),
      ),
    );
  }
}
