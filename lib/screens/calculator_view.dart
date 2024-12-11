import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _textController = TextEditingController();
  List<String> lstSymbols = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];

  String _output = "";
  String _operation = "";
  double? _firstOperand;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pawan Calculator App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: lstSymbols.length,
                itemBuilder: (context, index) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0))),
                    onPressed: () => _handleButtonPress(lstSymbols[index]),
                    child: Text(
                      lstSymbols[index],
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleButtonPress(String symbol) {
    setState(() {
      if (symbol == "C") {
        _textController.clear();
        _output = "";
        _operation = "";
        _firstOperand = null;
      } else if (symbol == "<-") {
        if (_output.isNotEmpty) {
          _output = _output.substring(0, _output.length - 1);
          _textController.text = _output;
        }
      } else if (symbol == "+" ||
          symbol == "-" ||
          symbol == "*" ||
          symbol == "/" ||
          symbol == "%") {
        if (_firstOperand == null && _output.isNotEmpty) {
          _firstOperand = double.parse(_output);
          _operation = symbol;
          _output = "";
        }
      } else if (symbol == "=") {
        if (_firstOperand != null && _output.isNotEmpty) {
          double secondOperand = double.parse(_output);
          double result = 0;

          switch (_operation) {
            case "+":
              result = _firstOperand! + secondOperand;
              break;
            case "-":
              result = _firstOperand! - secondOperand;
              break;
            case "*":
              result = _firstOperand! * secondOperand;
              break;
            case "/":
              result = _firstOperand! / secondOperand;
              break;
            case "%":
              result = _firstOperand! % secondOperand;
              break;
          }

          _output = result.toString();
          _textController.text = _output;
          _firstOperand = null;
          _operation = "";
        }
      } else {
        _output += symbol;
        _textController.text = _output;
      }
    });
  }
}
