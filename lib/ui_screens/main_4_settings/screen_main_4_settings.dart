import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui_commons/ui_image_paths.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings_vm.dart';

/// Экран 4. Настройки
/// Четвертый из четырех главных экранов, доступных по нажатию на
/// BottomNavigationBar.
///
class ScreenMain4Settings extends StatefulWidget {
  const ScreenMain4Settings({
    required this.viewModel,
    Key? key,
  }) : super(key: key);
  final ScreenMain4SettingsVM viewModel;

  @override
  _ScreenMain4SettingsState createState() => _ScreenMain4SettingsState();
}

class _ScreenMain4SettingsState extends State<ScreenMain4Settings> {
  ScreenMain4SettingsVM get ___viewModel => widget.viewModel;

  @override
  void initState() {
    super.initState();
    ___viewModel
      ..addListener(_vmListener)
      ..initVM();
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    ___viewModel
      ..disposeVM()
      ..removeListener(_vmListener);
    super.dispose();
  }

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
              onTap: ___viewModel.onTapOnThemeSwitchTile,
              title: Text(
                UiStrings.darkTheme,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              trailing: CupertinoSwitch(
                value: ___viewModel.isDarkThemeOn,
                onChanged: (currentValue) {
                  ___viewModel.onTapOnThemeSwitch();
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
                child: SvgPicture.asset(
                  UiImagePaths.info,
                  width: 20,
                  height: 20,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              onTap: ___viewModel.onTapOnTutorialLink,
            ),

            //
            // Сбросить настройки
            //
            ListTile(
              title: Text(
                UiStrings.resetSettings,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onTap: ___viewModel.onResetSettings,
            )
          ],
        ),
      ),
    );
  }
}
