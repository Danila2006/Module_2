import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:module_2/calculator_widget.dart';

void main() {
  testWidgets('UI exists', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculatorWidget()));

    expect(find.byKey(Key('firstNumber')), findsOneWidget);
    expect(find.byKey(Key('secondNumber')), findsOneWidget);

    expect(find.byKey(Key('addButton')), findsOneWidget);
    expect(find.byKey(Key('subtractButton')), findsOneWidget);
    expect(find.byKey(Key('multiplyButton')), findsOneWidget);
    expect(find.byKey(Key('divideButton')), findsOneWidget);

    expect(find.byKey(Key('result')), findsOneWidget);
  });

  testWidgets('Calculation works', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculatorWidget()));

    await tester.enterText(find.byKey(Key('firstNumber')), '33');
    await tester.enterText(find.byKey(Key('secondNumber')), '8');

    await tester.tap(find.byKey(Key('addButton')));
    await tester.pump();
    expect(find.text('Result: 41.0'), findsOneWidget);

    await tester.tap(find.byKey(Key('subtractButton')));
    await tester.pump();
    expect(find.text('Result: 25.0'), findsOneWidget);

    await tester.tap(find.byKey(Key('multiplyButton')));
    await tester.pump();
    expect(find.text('Result: 264.0'), findsOneWidget);

    await tester.tap(find.byKey(Key('divideButton')));
    await tester.pump();
    expect(find.text('Result: 4.125'), findsOneWidget);
  });
}