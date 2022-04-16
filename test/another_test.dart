import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:places/ui_widgets_commons/widget_bottom_button.dart';

void main() {
  testWidgets('WidgetBottomButton has a message', (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(WidgetBottomButton(
      buttonName: 'Текст на кнопке',
      isActive: true,
      onPressOnButton: () {},
    ));

    // Create the Finders.
    final messageFinder = find.text('Текст на кнопке');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(messageFinder, findsOneWidget);
  });
}
