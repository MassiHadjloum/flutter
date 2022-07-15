import 'package:flutter/widgets.dart';

class Person {
  final UniqueKey key;
  final String name;

  Person({
    required this.key,
    required this.name,
  });

  @override
  String toString() {
    return "$key" + name;
  }
}
