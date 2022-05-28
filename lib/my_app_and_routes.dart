import 'package:flutter/material.dart';
import 'package:places/my_app_and_routes_vm.dart';
import 'package:places/ui_commons/themes.dart';
import 'package:places/ui_screens/add_place_screen/screen_add_place_di.dart';
import 'package:places/ui_screens/filter_screen/screen_filter_di.dart';
import 'package:places/ui_screens/main_screen/screen_all_main.dart';
import 'package:places/ui_screens/onboarding_screen/screen_onboarding.dart';
import 'package:places/ui_screens/place_search_screen/screen_search_di.dart';
import 'package:places/ui_screens/select_category_screen/screen_selection_category_route.dart';
import 'package:places/ui_screens/splash_screen/screen_splash_di.dart';

// TODO(me): переделать в ScreenAllMain.routeName и static const routeName = '/extractArguments';
const String ROUTE_HOME = '/home';
const String ROUTE_FILTER = '/filter';
const String ROUTE_ADD = '/add';
const String ROUTE_SELECT_CATEGORY = '/select_category';
const String ROUTE_SEARCH = '/search';
const String ROUTE_ONBOARDING = '/onboarding';
const String ROUTE_SPLASH = '/';

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
    ___viewModel.addListener(_vmListener);
    ___viewModel.initVM();
  }

  void _vmListener() => setState(() {});

  @override
  void dispose() {
    ___viewModel.removeListener(_vmListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: ___viewModel.streamIsDartThemeOn,
      builder: (context, snapshot) => MaterialApp(
        title: 'Hey, Flutter!',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: snapshot.data == true ? ThemeMode.dark : ThemeMode.light,
        initialRoute: ROUTE_SPLASH,
        debugShowCheckedModeBanner: false,
        routes: {
          ROUTE_HOME: (context) => const ScreenAllMain(),
          ROUTE_FILTER: (context) => createScreenFilter(context: context),
          ROUTE_ADD: (context) => createScreenAddPlace(context: context),
          ROUTE_SELECT_CATEGORY: (context) =>
              const ScreenSelectionCategoryRoute(),
          ROUTE_SEARCH: (context) => createScreenSearch(context: context),
          ROUTE_ONBOARDING: (context) => const ScreenOnboarding(),
          ROUTE_SPLASH: (context) => createScreenSplash(context: context),
        },
      ),
    );
  }
}
