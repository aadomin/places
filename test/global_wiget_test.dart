// ignore_for_file: avoid_types_on_closure_parameters
//
//// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places/di.dart';
import 'package:places/di_mock.dart';
import 'package:places/di_provider.dart';
// import 'package:places/ui_commons/my_bloc_observer.dart';

// const bool isDebugMockImagesInPlaceOfHttp = false;
// const bool isDebugMockDataInPlaceOfHttp = false;

// const bool isDebugUserStay = true;
// const bool isDebugUserMove = false;

const bool isDebugModeForImages = true;

void main() {
  // LiveTestWidgetsFlutterBinding();

  testWidgets('Onboarding screen must be shown', (WidgetTester tester) async {
    // Bloc.observer = MyBlocObserver();
    final DI di = DIMock();

    await tester.pumpWidget(DIProvider(di));

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Добро пожаловать в Путеводитель'), findsOneWidget);
  });

  testWidgets('Main screen must be shown', (WidgetTester tester) async {
    // Bloc.observer = MyBlocObserver();
    final DI di = DIMock();
    await tester.pumpWidget(DIProvider(di));

    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.text('Пропустить'), findsOneWidget);

    await tester.tap(find.text('Пропустить'));

    await tester.pump();

    expect(
        find.text('Воронежский областной краеведческий музей'), findsOneWidget);
  });
}
