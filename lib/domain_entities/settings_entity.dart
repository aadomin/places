import 'package:places/data_repositories/settings_repository.dart';

class SettingsEntity {
  SettingsEntity({
    required this.settingsRepository,
  });

  final SettingsRepository settingsRepository;

  void changeTheme() {
    settingsRepository.isDarkThemeOn = !settingsRepository.isDarkThemeOn;
  }

  bool get isDarkThemeOn => settingsRepository.isDarkThemeOn;
}
