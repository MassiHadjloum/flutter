// ignore_for_file: constant_identifier_names




import 'package:bnparisbas/constants/widhets.dart';

class ListTileInfo {
  final String title;
  final String? subtitle;
  final dynamic leading;
  final dynamic trailing;
  final TypeCarte? typeCarte;
  final TypeData? typeData;

  ListTileInfo({
    this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    this.typeData,
    this.typeCarte
  });
}
