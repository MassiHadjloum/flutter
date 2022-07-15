// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyShowDialogue extends StatelessWidget {
  final String text;
  final String btnText_oui;
  final String? btnText_non;
  final Color? textColor;
  VoidCallback pressed_oui;
  MyShowDialogue({
    required this.text,
    required this.btnText_oui,
    required this.pressed_oui,
    this.textColor,
    this.btnText_non,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(top: 13, left: 10),
      actionsPadding: const EdgeInsets.all(3),
      content: Text(
       text,
        style: TextStyle(fontSize: 15, fontFamily: "OpenSans", color: textColor),
      ),
      actions: [
        if(btnText_non != null) 
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(btnText_non!),
        ),
        TextButton(
          onPressed: pressed_oui,
          child: Text(btnText_oui),
        ),
      ],
    );
  }
}
