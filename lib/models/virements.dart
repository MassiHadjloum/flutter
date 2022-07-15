// ignore_for_file: non_constant_identifier_names

import 'package:bnparisbas/models/beneficaires.dart';

class Virements {
  final String IBANbenef;
  final String namebenef;
  final DateTime date;
  final String motif;
  final double monton;

  Virements({
    required this.IBANbenef,
    required this.namebenef,
    required this.date,
    required this.monton,
    required this.motif,
  });

  static Map<String, String> toJSONVirement(Virements virement) {
    return {
      "IBAN": virement.IBANbenef,
      "firstname": virement.namebenef,
      "date": virement.date.toString(),
      "monton": virement.monton.toString(),
      "motif": virement.motif
    };
  }

  static Virements toVirmtType(dynamic item) {
    return Virements(
        IBANbenef: item['IBAN'],
        namebenef: item['firstname'],
        date: DateTime.parse(item['date']),
        monton: double.parse(item['monton']),
        motif: item['motif']);
  }

  int compare(Beneficaires a, Beneficaires b) {
    return a.name.compareTo(b.name);
  }

  @override
  String toString() {
    return IBANbenef +" "+ namebenef;
  }

  /*  List<Beneficaires> get getBeneficaires {
     _beneficaires.sort((a, b) => compare(a, b));
    return _beneficaires;
  }


  Future<void> addBeneficaires(Beneficaires one) async {
    _beneficaires.add(one);
  } */

}
