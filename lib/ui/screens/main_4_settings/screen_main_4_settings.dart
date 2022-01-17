import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_interactors/settings_interactor.dart';

/// Экран 4. Настройки
/// Четвертый из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
///
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
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: 0,
        title: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Text(
              UiStrings.settings,
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
            //
            // Темная тема
            //
            ListTile(
              onTap: onTapOnThemeSwitchTile,
              title: Text(
                UiStrings.darkTheme,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              trailing: CupertinoSwitch(
                value: context.watch<SettingsInteractor>().isDarkThemeOn,
                onChanged: (currentValue) {
                  onTapOnThemeSwitch();
                },
              ),
            ),

            //
            // Смотреть туториал
            //
            ListTile(
              title: Text(
                UiStrings.lookOnboarding,
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
