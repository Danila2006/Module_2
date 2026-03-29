import 'package:flutter/material.dart';
import 'calculator.dart';

class CalculatorWidget extends StatefulWidget {
  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  final _c1 = TextEditingController();
  final _c2 = TextEditingController();
  String result = '';

  final calc = Calculator();

  void calculate() {
    final a = double.tryParse(_c1.text) ?? 0;
    final b = double.tryParse(_c2.text) ?? 0;

    final res = calc.add(a, b);

    setState(() {
      result = 'Result: ${res.toString()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          TextField(
            key: Key('first'),
            controller: _c1,
            decoration: InputDecoration(labelText: 'First'),
          ),
          TextField(
            key: Key('second'),
            controller: _c2,
            decoration: InputDecoration(labelText: 'Second'),
          ),
          ElevatedButton(
            onPressed: calculate,
            child: Text('Додати'),
          ),
          Text(result),
        ],
      ),
    );
  }
}