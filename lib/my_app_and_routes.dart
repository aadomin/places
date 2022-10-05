import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes_vm.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_commons/ui_strings.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_di.dart';
import 'package:places/ui_screens/filter_screen/screen_filter_di.dart';
import 'package:places/ui_screens/main_screen/screen_all_main.dart';
import 'package:places/ui_screens/onboarding_screen/screen_onboarding.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_di.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category_di.dart';
import 'package:places/ui_screens/splash_screen/screen_splash_di.dart';

// TODO(me): переделать в ScreenAllMain.routeName и static const routeName = '/extractArguments';
const String appRouteHome = '/home';
const String appRouteFilter = '/filter';
const String appRouteAdd = '/add';
const String appRouteSelectCategory = '/select_category';
const String appRouteSearch = '/search';
const String appRouteOnboarding = '/onboarding';
const String appRouteSplash = '/';

///
/// Класс содержит маршруты в приложении и виджет MaterialApp
///
class MyAppAndRoutes extends StatefulWidget {
  const MyAppAndRoutes({required this.viewModel, Key? key}) : super(key: key);

  final MyAppAndRoutesVM viewModel;

  @override
  State<MyAppAndRoutes> createState() => _MyAppAndRoutesState();
}

class _MyAppAndRoutesState extends State<MyAppAndRoutes> {
  MyAppAndRoutesVM get ___viewModel => widget.viewModel;

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
    return StreamBuilder(
      stream: ___viewModel.streamIsDartThemeOn,
      builder: (context, snapshot) => MaterialApp(
        title: UiStrings.appTitle,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: snapshot.data == true ? ThemeMode.dark : ThemeMode.light,
        initialRoute: appRouteSplash,
        debugShowCheckedModeBanner: false,
        routes: {
          appRouteHome: (context) => const ScreenAllMain(),
          appRouteFilter: (context) => createScreenFilter(context: context),
          appRouteAdd: (context) => createScreenAddPlace(context: context),
          appRouteSelectCategory: (context) =>
              const ScreenSelectionCategoryDi(),
          appRouteSearch: (context) => createScreenSearch(context: context),
          appRouteOnboarding: (context) => const ScreenOnboarding(),
          appRouteSplash: (context) => createScreenSplash(context: context),
        },
      ),
    );
  }
}
