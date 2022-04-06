import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:places/di.dart';
import 'package:places/my_app_and_routes_di.dart';
import 'package:places/ui_commons/platform_detector.dart';
import 'package:places/ui_screens/popups/popup_manager.dart';
import 'package:provider/provider.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(MyAppProvider());
}

class MyAppProvider extends StatelessWidget {
  MyAppProvider({
    Key? key,
  }) : super(key: key);

  late final _di = DI();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => _di,
        ),
        // Provider(
        //   create: (context) => PopupManager(),
        // ),
      ],
      child: Builder(builder: (context) {
        return createMyAppAndRoutes(context: context);
      }),
    );
  }
}

PlatformDetector platformDetector = PlatformDetector();

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;
