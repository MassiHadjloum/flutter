import 'package:flutter/material.dart';

class MyFlexibleSpace extends StatelessWidget {
  final List<Color> gradient;
  const MyFlexibleSpace({
    required this.gradient,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      ),
    );
  }
}
