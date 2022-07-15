import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  final String title;
  final Color color;
  final double? size;
  final bool? bold;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  const BuildText({
    Key? key,
    required this.title,
    required this.color,
    this.size,
    this.bold,
    this.textDirection,
    this.textAlign,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      textDirection: textDirection,
      style: TextStyle(
        fontSize: size,
        fontWeight: bold! ? FontWeight.bold : FontWeight.normal,
        color: color,
      ),
    );
  }
}
