import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String output = "0";
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";
  String history = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "";
      num1 = 0;
      num2 = 0;
      operand = "";
      history = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
      history += num1.toString() + " " + operand + " ";
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        if (num2 != 0) {
          _output = (num1 / num2).toString();
        } else {
          _output = "Error";
        }
      }
      history += num2.toString();
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output += buttonText;
      }
    } else if (buttonText == "⌫") {
      _output = _output.substring(0, _output.length - 1);
    } else {
      _output += buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: () => buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            elevation: 0,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: Text(
                history,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Divider(),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("C", 1, Colors.red),
                    buildButton("⌫", 1, Colors.deepPurple),
                    buildButton("/", 1, Colors.deepPurple),
                  ],
                ),
                Row(
                  children: [
                    buildButton("7", 1, Colors.deepPurple),
                    buildButton("8", 1, Colors.deepPurple),
                    buildButton("9", 1, Colors.deepPurple),
                    buildButton("x", 1, Colors.deepPurple),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", 1, Colors.deepPurple),
                    buildButton("5", 1, Colors.deepPurple),
                    buildButton("6", 1, Colors.deepPurple),
                    buildButton("-", 1, Colors.deepPurple),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", 1, Colors.deepPurple),
                    buildButton("2", 1, Colors.deepPurple),
                    buildButton("3", 1, Colors.deepPurple),
                    buildButton("+", 1, Colors.deepPurple),
                  ],
                ),
                Row(
                  children: [
                    buildButton("0", 1, Colors.deepPurple),
                    buildButton(".", 1, Colors.deepPurple),
                    buildButton("=", 1, Colors.deepPurple),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
