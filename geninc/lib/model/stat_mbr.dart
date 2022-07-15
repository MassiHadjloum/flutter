// ignore_for_file: non_constant_identifier_names

class SpecificStat {
  final String name;
  final DateTime date;
  List<List<double>>? ventes_jour;
  List<List<double>>? ventes_semaine;
  List<List<double>>? ventes_mois;

  SpecificStat({
    required this.name,
    required this.date,
    /* this.ventes_jour,
    this.ventes_semaine,
    this.ventes_mois, */
  });

  void Initialize(){
    for (var e in [1, 2, 3, 4, 5, 6]) {
      ventes_jour!.add([e.toDouble(), 0.0]);
    }
    for (var e in [1, 2, 3, 4, 5, 6, 7, 8]) {
      ventes_semaine!.add([e.toDouble(), 0.0]);
    }
    for (var e in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]) {
      ventes_mois!.add([e.toDouble(), 0.0]);
    }

    
  }
}
