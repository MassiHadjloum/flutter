// ignore_for_file: non_constant_identifier_names

class Beneficaires {
  final String name;
  final String IBAN;
  final String? bankName;
  final String? bankAddr;

  @override
  String toString() {
    return name + " " + IBAN;
  }

  Beneficaires(
      {required this.name, required this.IBAN, this.bankName, this.bankAddr});

  static Map<String, String> toJsonBenef(Beneficaires one) {
    return {
      "firstname": one.name,
      "IBAN": one.IBAN,
      "bankName": one.bankName!,
      "bankAddr": one.bankAddr!
    };
  }

  static Beneficaires toBenefType(dynamic item) {
    return Beneficaires(
      name: item['firstname']!,
      IBAN: item['IBAN']!,
      bankName: item['bankName'],
      bankAddr: item['bankAddr'],
    );
  }
}
