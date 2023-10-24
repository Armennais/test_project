import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = "";
  String _input = "";
  double num1 = 0, num2 = 0;
  String operand = "";

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _output = "";
        _input = "";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else if (buttonText == "+" ||
          buttonText == "-" ||
          buttonText == "*" ||
          buttonText == "/") {
        num1 = double.parse(_output);
        operand = buttonText;
        _input = _output + buttonText;
        _output = "";
      } else if (buttonText == "=") {
        num2 = double.parse(_output);
        if (operand == "+") {
          _output = (num1 + num2).toString();
        }
        if (operand == "-") {
          _output = (num1 - num2).toString();
        }
        if (operand == "*") {
          _output = (num1 * num2).toString();
        }
        if (operand == "/") {
          _output = (num1 / num2).toString();
        }
        _input = "";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else {
        _output = _output + buttonText;
        _input = _input + buttonText;
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: TextButton(
        onPressed: () => _buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            _input,
            style: const TextStyle(fontSize: 24.0),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
          child: Text(
            _output,
            style: const TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(
          child: Divider(),
        ),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/")
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*")
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-")
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("."),
                buildButton("0"),
                buildButton("C"),
                buildButton("+")
              ],
            ),
            Row(
              children: <Widget>[
                buildButton("="),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
