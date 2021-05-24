import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ui_models.dart';

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
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          title: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'Настройки',
                style: TextStyle(
                  color: Theme.of(context).primaryColorDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(children: [
            ElevatedButton(
              child: Text(context.watch<MyThemeModel>().isDarkTheme
                  ? 'Светлая тема'
                  : 'Темная тема'),
              onPressed: () {
                context.read<MyThemeModel>().changeTheme();
              },
            ),
          ]),
        ),
      ),
    );
  }
}
