import 'package:flutter/material.dart';
import 'calculator.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final TextEditingController _c1 = TextEditingController();
  final TextEditingController _c2 = TextEditingController();
  final Calculator calc = Calculator();

  String result = '';

  void calculate(String operation) {
    final a = double.tryParse(_c1.text);
    final b = double.tryParse(_c2.text);

    if (a == null || b == null) {
      setState(() {
        result = 'Невірне число';
      });
      return;
    }

    try {
      double res;
      switch (operation) {
        case '+':
          res = calc.add(a, b);
          break;
        case '-':
          res = calc.subtract(a, b);
          break;
        case '*':
          res = calc.multiply(a, b);
          break;
        case '/':
          res = calc.divide(a, b);
          break;
        default:
          res = 0;
      }

      setState(() {
        result = 'Результат: $res';
      });
    } catch (e) {
      setState(() {
        result = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _c1,
              decoration: const InputDecoration(labelText: 'Число 1'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _c2,
              decoration: const InputDecoration(labelText: 'Число 2'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => calculate('+'),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('-'),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('*'),
                  child: const Text('×'),
                ),
                ElevatedButton(
                  onPressed: () => calculate('/'),
                  child: const Text('÷'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              result,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}