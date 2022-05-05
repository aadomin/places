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
import 'package:places/di_provider.dart';
import 'package:places/main.dart';
import 'package:places/ui_commons/my_bloc_observer.dart';

import 'fake_di.dart';

const bool isDebugMockImagesInPlaceOfHttp = false;
const bool isDebugMockDataInPlaceOfHttp = false;

const bool isDebugUserStay = true;
const bool isDebugUserMove = false;

void main() {
  // ignore: avoid_types_on_closure_parameters
  testWidgets('My very first test', (WidgetTester tester) async {
    Bloc.observer = MyBlocObserver();
    final di = FakeDI();
    await tester.pumpWidget(DIProvider(di));

    await tester.pumpAndSettle(const Duration(seconds: 6));

    await tester.pumpAndSettle(const Duration(seconds: 1));

    expect(find.text('Добро'), findsOneWidget);
  });

  // ignore: avoid_types_on_closure_parameters
  testWidgets('My 2 very first test', (WidgetTester tester) async {
    Bloc.observer = MyBlocObserver();
    final di = FakeDI();
    await tester.pumpWidget(DIProvider(di));

    await tester.pumpAndSettle(const Duration(seconds: 6));

    expect(find.text('областной'), findsOneWidget);
  });
}




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