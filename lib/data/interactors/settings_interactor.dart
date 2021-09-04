// Напишите SettingsInteractor в котором происходит логика смены темной/светлой темы
// Подключите интерактор к экрану настроек

class SettingsInteractor {
  bool isDartThemeOn = false;
  void toggleTheme() {
    isDartThemeOn = !isDartThemeOn;
  }
}
