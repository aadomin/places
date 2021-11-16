import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/ui_my_app/routes.dart';
import 'package:places/ui_my_app/ui_image_paths.dart';

import 'package:places/ui_interactors/settings_interactor.dart';

class ScreenMain4Settings extends StatefulWidget {
  const ScreenMain4Settings({Key? key}) : super(key: key);

  @override
  _ScreenMain4SettingsState createState() => _ScreenMain4SettingsState();
}

class _ScreenMain4SettingsState extends State<ScreenMain4Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          children: [
            ListTile(
              onTap: onTapOnThemeSwitchTile,
              title: Text(
                'Темная тема',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              trailing: Switch(
                value: context.watch<SettingsInteractor>().isDarkThemeOn,
                onChanged: (currentValue) {
                  onTapOnThemeSwitch();
                },
              ),
            ),
            ListTile(
              title: Text(
                'Смотреть туториал',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              trailing: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Image.asset(
                  UiImagePaths.info,
                  width: 20,
                  height: 20,
                ),
              ),
              onTap: onTapOnTutorialLink,
            ),
          ],
        ),
      ),
    );
  }

  void onTapOnTutorialLink() {
    Navigator.of(context).pushNamed(ROUTE_ONBOARDING);
  }

  void onTapOnThemeSwitch() {
    context.read<SettingsInteractor>().changeTheme();
  }

  void onTapOnThemeSwitchTile() {
    context.read<SettingsInteractor>().changeTheme();
  }
}
