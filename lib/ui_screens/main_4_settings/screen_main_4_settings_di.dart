import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings_vm.dart';
import 'package:provider/provider.dart';

class ScreenMain4SettingsDI extends StatelessWidget {
  const ScreenMain4SettingsDI({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenMain4Settings(
      viewModel: ScreenMain4SettingsVM(
        context: context,
        settingsInteractor: context.read<DI>().settingsInteractor,
      ),
    );
  }
}
