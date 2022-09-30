import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_state.dart';

import 'vm.dart';

class WeatherScreen extends ElementaryWidget<IWeatherWm> {
  const WeatherScreen({
    Key? key,
    WidgetModelFactory<WeatherScreenWM> wmFactory = createWeatherScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IWeatherWm wm) {
    return Scaffold(
      body: Center(
        child: EntityStateNotifierBuilder<ScreenAddPlaceState?>(
          listenableEntityState: wm.currentScreenState,
          errorBuilder: (_, __, ___) {
            return Container();
            //return ErrorScreen(onRetryPressed: wm.onRetryPressed);
          },
          loadingBuilder: (_, __) {
            return Container();
            // return const LoadingPage();
          },
          builder: (_, data) {
            return Container();
            // return WeatherDetailsPage(
            //   data: data!,
            //   location: wm.locationTitle,
            // );
          },
        ),
      ),
    );
  }
}
