import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:module_2/calculator_widget.dart';

void main() {
  testWidgets('UI exists', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculatorWidget()));

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('Calculation works', (tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculatorWidget()));

    await tester.enterText(find.byKey(Key('first')), '3');
    await tester.enterText(find.byKey(Key('second')), '4');

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Result: 7.0'), findsOneWidget);
  });
}