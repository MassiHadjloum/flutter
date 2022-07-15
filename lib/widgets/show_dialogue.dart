import 'package:flutter/material.dart';

class MyShowDialogue extends StatelessWidget {
  final String text;
  final String btnText;
  final Color? textColor;
  VoidCallback pressed;
  MyShowDialogue({
    required this.text,
    required this.btnText,
    this.textColor,
    required this.pressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(
       text,
        style: TextStyle(fontSize: 15, fontFamily: "OpenSans", color: textColor),
      ),
      actions: [
        TextButton(
          onPressed: pressed,
          child: Text(btnText),
        ),
      ],
    );
  }
}
