import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';

class BuildIconBtn extends StatelessWidget {
  final Function() goTo;
  final IconData icon;
  const BuildIconBtn({
    Key? key,
    required this.icon,
    required this.goTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: goTo,
      icon: Icon(
        icon,
        size: 35,
        color: secondcolor,
      ),
    );
  }
}
