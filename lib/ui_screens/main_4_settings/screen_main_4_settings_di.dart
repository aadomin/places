import 'package:flutter/material.dart';
import 'package:places/domain_interactors/settings_interactor.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings.dart';
import 'package:places/ui_screens/main_4_settings/screen_main_4_settings_vm.dart';
import 'package:provider/provider.dart';

ScreenMain4Settings createPageMain4Settings(BuildContext context) {
  return ScreenMain4Settings(
    viewModel: ScreenMain4SettingsVM(
      context: context,
      settingsEntity: context.read<SettingsInteractor>(),
    ),
  );
}
