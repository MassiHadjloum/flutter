import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';

class MyAlertDialogue extends StatelessWidget {
  final BuildContext ctx;
  final String textDialogue;
  final Color textColor;
  final bool isNightMode;
  const MyAlertDialogue({
    Key? key,
    required this.ctx,
    required this.textDialogue,
    required this.textColor,
    required this.isNightMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      child: AlertDialog(
        backgroundColor: isNightMode ? secondaryColor : whitingcolor,
        contentPadding:
            const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 5),
        elevation: 5,
        content: Text(
          textDialogue,
          style: TextStyle(
            fontSize: 18,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop(true);
            },
            child: const Text("نعم", style: TextStyle(color: primaryColor)),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text("لا ", style: TextStyle(color: primaryColor)),
          ),
        ],
      ),
    );
  }
}
