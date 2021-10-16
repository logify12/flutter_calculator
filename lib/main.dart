import 'package:flutter/material.dart';
import './app_bar.dart';
import './custom_button.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var listOfNumbers = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
  late int firstNumber;
  late int secondNumber;
  late int result;
  String history = "";
  String textToDisplay = "";
  String operator = "";
  bool checkNewVal = false;

  void buttonOnClick(String btnValue) {
    if (btnValue == "AC") {
      history = "";
      textToDisplay = "";
      firstNumber = 0;
      secondNumber = 0;
      result = 0;
    } else if (btnValue == "C") {
      textToDisplay = "";
    } else if (btnValue == "<") {
      if (textToDisplay.isNotEmpty) {
        textToDisplay = textToDisplay.substring(0, textToDisplay.length - 1);

        history = history.substring(0, history.length - 1);
      }
    } else if(btnValue =="+/-"){
      if(textToDisplay[0] != "-"){
        textToDisplay = "-" +textToDisplay;
      }else{
        textToDisplay =textToDisplay.substring(1);
      }
    }
      else if (btnValue == "+" || btnValue == "-" || btnValue == "/" || btnValue == "X" || btnValue == "=") {
      history = history + " " + btnValue + " ";
      if (btnValue == "+") {
        operator = btnValue;
        firstNumber = int.parse(textToDisplay);
        textToDisplay = "";
      }
      else if (btnValue == "-") {
        operator = btnValue;
        firstNumber = int.parse(textToDisplay);
        textToDisplay = "";
      }
      else if (btnValue == "/") {
        operator = btnValue;
        firstNumber = int.parse(textToDisplay);
        textToDisplay = "";
      }
      else if (btnValue == "X") {
        operator = btnValue;
        firstNumber = int.parse(textToDisplay);
        textToDisplay = "";
      }
      else if (btnValue == "=") {
        secondNumber = int.parse(textToDisplay);
        if (operator == "+") {
          result = firstNumber + secondNumber;
        }
        else if (operator == "-") {
          result = firstNumber - secondNumber;
        }
        else if (operator == "/") {
          result = (firstNumber ~/ secondNumber);
        }
        else if (operator == "X") {
          result = firstNumber * secondNumber;
        }
        textToDisplay = result.toString();
        history = history + textToDisplay;
        checkNewVal = true;
      }
    } else if (listOfNumbers.contains(int.parse(btnValue))) {
      if (checkNewVal == true) {
        textToDisplay = "";
        history = "";
      }
      checkNewVal = false;
      history = history + btnValue;
      textToDisplay = textToDisplay + btnValue;
    }

    setState(() {
      textToDisplay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFF043249),
        appBar: const AppBarWork(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  history,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white60,
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Container(
              margin: const EdgeInsets.only(right: 12),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  textToDisplay,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                    color: Colors.white,
                  ),
                ),
              ),
              alignment: const Alignment(1.0, 1.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "AC",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "C",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "<",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "/",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "7",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "8",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "9",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "X",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "4",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "5",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "6",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "-",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "1",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "2",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "3",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "+",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                  text: "+/-",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "0",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "00",
                  buttonColor: 0xFF009688,
                  callback: buttonOnClick,
                ),
                CustomButton(
                  text: "=",
                  buttonColor: 0xFFFF7E3A,
                  callback: buttonOnClick,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
