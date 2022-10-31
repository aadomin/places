import 'dart:convert';

import 'package:places/data_repositories/setting/dto/settings_dto.dart';
import 'package:places/data_repositories/setting/settings_data_source.dart';
import 'package:places/domain_entities/filter_settings.dart';
import 'package:places/domain_entities/settings_entity.dart';

const String _keyIsDarkThemeOn = 'isDarkThemeOn';
const String _keyFilterSettings = 'filterState';
const String _keyIsThatTheFirstRun = 'isThatTheFirstRunKey';

///
/// Репозиторий. Хранение настроек
///
class SettingsRepository {
  SettingsRepository({required this.settingsDataSource});

  final SettingsDataSource settingsDataSource;

  //

  Future<SettingsEntity?> getSettings() async {
    //null checking
    bool? isDarkThemeOn = await settingsDataSource.getBool(_keyIsDarkThemeOn);
    if (isDarkThemeOn == null) return null;

    String? rawFilterSettings =
        await settingsDataSource.getString(_keyFilterSettings);
    if (rawFilterSettings == null) return null;
    FilterSettings filterSettings =
        FilterSettings.fromJson(jsonDecode(rawFilterSettings));

    var isThatTheFirstRun =
        await settingsDataSource.getBool(_keyIsThatTheFirstRun);
    if (isThatTheFirstRun == null) return null;

    return SettingsEntity(
      isDarkThemeOn: isDarkThemeOn,
      filterSettings: filterSettings,
      isThatTheFirstRun: isThatTheFirstRun,
    );
  }

  Future<void> setSettings(SettingsEntity entity) async {
    await settingsDataSource.setBool(
      _keyIsDarkThemeOn,
      entity.isDarkThemeOn,
    );
    await settingsDataSource.setString(
      _keyFilterSettings,
      jsonEncode(entity.filterSettings.toJson()),
    );
    await settingsDataSource.setBool(
      _keyIsThatTheFirstRun,
      entity.isThatTheFirstRun,
    );
  }

  Future<void> resetSettings() async {
    settingsDataSource.remove(_keyIsDarkThemeOn);
    settingsDataSource.remove(_keyFilterSettings);
    settingsDataSource.remove(_keyIsThatTheFirstRun);
  }

  // TODO(me): тут можно лучше ТУТВОПРОС
}
