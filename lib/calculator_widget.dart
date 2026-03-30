import 'package:flutter/material.dart';
import 'calculator.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  _CalculatorWidgetState createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();
  double? result;

  void calculate(String operation) {
    final double? first = double.tryParse(firstController.text);
    final double? second = double.tryParse(secondController.text);

    if (first == null || second == null) {
      setState(() {
        result = null;
      });
      return;
    }

    try {
      final calc = Calculator();
      double res;

      switch (operation) {
        case '+':
          res = calc.add(first, second);
          break;
        case '-':
          res = calc.subtract(first, second);
          break;
        case '*':
          res = calc.multiply(first, second);
          break;
        case '/':
          res = calc.divide(first, second); // 🔥 тут буде помилка при 0
          break;
        default:
          return;
      }

      setState(() {
        result = res;
      });
    } catch (e) {
      setState(() {
        result = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              key: Key('firstNumber'),
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'First number'),
            ),
            SizedBox(height: 8),
            TextField(
              key: Key('secondNumber'),
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Second number'),
            ),
            SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                ElevatedButton(
                  key: Key('addButton'),
                  onPressed: () => calculate('+'),
                  child: Text('+'),
                ),
                ElevatedButton(
                  key: Key('subtractButton'),
                  onPressed: () => calculate('-'),
                  child: Text('-'),
                ),
                ElevatedButton(
                  key: Key('multiplyButton'),
                  onPressed: () => calculate('*'),
                  child: Text('*'),
                ),
                ElevatedButton(
                  key: Key('divideButton'),
                  onPressed: () => calculate('/'),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Result: ${result ?? '-'}', key: Key('result')),
          ],
        ),
      ),
    );
  }
}