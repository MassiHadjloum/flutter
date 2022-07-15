import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: "Banque", percent: 30, color: const Color(0xff0293ee)),
    Data(name: "Vie cotidienne", percent: 70, color: const Color(0xff13d38e)),
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({
    required this.name,
    required this.percent,
    required this.color,
  });
}
