import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:places/ui/my_app/my_app_model.dart';
import 'package:places/ui/my_app/routes.dart';
import 'package:places/ui/res/ui_image_paths.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
        child: Column(children: [
          ListTile(
            onTap: () {
              context.read<MyThemeModel>().changeTheme();
            },
            title: Text(
              'Темная тема',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            trailing: Switch(
              value: context.watch<MyThemeModel>().isDarkTheme,
              onChanged: (currentValue) {
                context.read<MyThemeModel>().changeTheme();
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
            onTap: () {
              Navigator.of(context).pushNamed(ROUTE_ONBOARDING);
            },
          )
        ]),
      ),
    );
  }
}
