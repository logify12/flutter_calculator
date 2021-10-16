import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final int buttonColor;
  final Function callback;

  const CustomButton({Key? key, required this.text, required this.buttonColor, required this.callback})  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SizedBox(
        width: 60,
        height: 60,
        child: ElevatedButton(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>( Color(buttonColor)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation: MaterialStateProperty.all(6),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: const BorderSide(color: Colors.black),
              )
            ),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );

  }
}
