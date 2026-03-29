import 'package:flutter_test/flutter_test.dart';
import 'package:module_2/calculator.dart';

void main() {
  final calc = Calculator();

  group('Calculator tests', () {
    test('add positive', () {
      expect(calc.add(2, 3), 5);
    });

    test('add negative', () {
      expect(calc.add(-2, -3), -5);
    });

    test('subtract', () {
      expect(calc.subtract(5, 3), 2);
    });

    test('multiply', () {
      expect(calc.multiply(2, 3), 6);
    });

    test('divide', () {
      expect(calc.divide(10, 2), 5);
    });

    test('divide by zero', () {
      expect(() => calc.divide(10, 0), throwsArgumentError);
    });
  });
}