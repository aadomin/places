import 'package:places/data_repositories/setting/dto/settings_dto.dart';
import 'package:places/data_repositories/setting/settings_data_source.dart';

const String _isDarkThemeOnKey = 'isDarkThemeOn';
const String _filterStateKey = 'filterState';
const String _isThatTheFirstRunKey = 'isThatTheFirstRunKey';

///
/// Репозиторий. Хранение настроек
///
class SettingsRepository {
  SettingsRepository({required this.settingsDataSource}) {}

  final SettingsDataSource settingsDataSource;

  //

  bool _isDarkThemeOn = false;

  bool get isDarkThemeOn {
    return _isDarkThemeOn;
  }

  set isDarkThemeOn(bool value) {
    _isDarkThemeOn = value;
  }

  // Future<SettingsDto> getSettings() async {
  //   return  SettingsDto(
  //     isDarkThemeOn: await settingsDataSource.getBool(_isDarkThemeOnKey),
  //     filterState: await settingsDataSource.getString(_filterStateKey),
  //     isThatTheFirstRun: await settingsDataSource.getBool(_isThatTheFirstRunKey),
  //   );
  // }

  void eraseSettings() {
    isDarkThemeOn = false;
    settingsDataSource.remove(_isDarkThemeOnKey);
  }
}
