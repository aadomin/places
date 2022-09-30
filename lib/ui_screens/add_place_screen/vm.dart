import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';
import 'package:places/di.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_state.dart';
//import 'package:flutter/widgets.dart';

import 'wi.dart';
import 'mo.dart';

class WeatherScreenWM extends WidgetModel<WeatherScreen, WeatherScreenModel>
    implements IWeatherWm {
  WeatherScreenWM(WeatherScreenModel model) : super(model);

  final EntityStateNotifier<ScreenAddPlaceState?> _currentScreenState =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<ScreenAddPlaceState?>> get currentScreenState =>
      _currentScreenState;

  @override
  String get locationTitle => '';

  @override
  double get topPadding => 16;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadWeather();
  }

  @override
  void onRetryPressed() => _loadWeather();

  Future<void> _loadWeather() async {
    try {
      _currentScreenState.loading();
      //final weather = await model.getWeather();
      // _currentScreenState.content(weather);
    } on Exception catch (err) {
      _currentScreenState.error(err);
    }
  }
}

WeatherScreenWM createWeatherScreenWM(BuildContext context) => WeatherScreenWM(
      WeatherScreenModel(
        placesInteractorG,
      ),
    );

abstract class IWeatherWm extends IWidgetModel {
  ListenableState<EntityState<ScreenAddPlaceState?>> get currentScreenState;

  double get topPadding;

  String get locationTitle;

  void onRetryPressed();
}
