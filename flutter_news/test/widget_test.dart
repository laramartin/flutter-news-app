// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_news/main.dart';

void main() {
  testWidgets('Clicking on an list item will open it', (WidgetTester tester) async {

    await tester.pumpWidget(new MyApp());

    expect(find.byIcon(Icons.open_in_browser), findsNothing);

    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pump();

    expect(find.byIcon(Icons.open_in_browser), findsOneWidget);
  });
}
