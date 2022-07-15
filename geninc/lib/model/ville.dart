// ignore_for_file: constant_identifier_names

enum Statut { NON_VISITE, VISITEE, EN_COUR_DE_VISIT }

class Ville {
  final String name;
  final String imageUrl;
  final int? code;
  String? statut;
  int progression;
  int? visites;
  DateTime? datedebut;
  DateTime? datefin;

  Ville({
    required this.name,
    required this.imageUrl,
    required this.progression,
    this.code,
    this.visites,
    this.statut,
    this.datedebut,
    this.datefin,
  });

  int compare(Ville a, Ville b){
    return a.name.compareTo(b.name);
  }

  @override
  String toString() {
    return "$name, $code";
  }
}
