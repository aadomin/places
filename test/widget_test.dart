// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places/di.dart';
import 'package:places/main.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_route.dart';
import 'package:places/ui_screens/main_1_places_list/screen_main1_places_route_vm.dart';

void main() {
  // ignore: avoid_types_on_closure_parameters
  testWidgets('My very first test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    Bloc.observer = MyBlocObserver();

    final di = DI();

    // await tester.pumpWidget(Builder(
    //   builder: (BuildContext context) {
    //     return ScreenMain1PlacesRoute(
    //       viewModel: ScreenMain1PlacesRouteVM(
    //         context: context,
    //         placesInteractor: di.placesInteractor,
    //       ),
    //     );
    //   },
    // ), const Duration(seconds: 4));

    await tester.pumpWidget(MyAppProvider(), const Duration(seconds: 4));

    // Verify that our counter starts at 0.
    expect(find.text('Добро'), findsOneWidget);
    //expect(find.text('Перк'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    // find.byIcon(Icons.add)
    // await tester.tap(find.text('Пропустить'));
    // await tester.pump(const Duration(seconds: 3));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('Парк'), findsOneWidget);
    // // expect(find.text('0'), findsNothing);
    // // expect(find.text('1'), findsOneWidget);
  });
}
