import 'package:adkar_app/constants/data.dart';
import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final Color? color;
  const MyDivider({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Divider(
      height: 2,
      thickness: 2,
      indent: 10,
      endIndent: 10,
      color: color ?? primaryColor,
    );
  }
}
