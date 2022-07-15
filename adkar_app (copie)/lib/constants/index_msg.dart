// ignore_for_file: constant_identifier_names
import 'package:hijri/hijri_calendar.dart';

enum TypeMessageHijri {
  MIDDLE_EVERY_MOUNTH,
  RAMADHAN,
  FIN_RAMADHAN,
  AAID_FITRE,
  MIDDLE_CHAWWAL,
  ONE_8_DOU_LHIJA,
  NINE_DOU_LHIJA,
  AAIDE_ADHA,
  LAST_DOU_LHIJA,
  NOTHING
}

enum TypeMessageMiladi { YENNAYER, FIN_DECEMBRE, AMULI, NOTHING }

TypeMessageMiladi whichMessageToDisplayMiladi() {
  final _now = DateTime.now();

  if (_now.month == 1 && _now.day == 12) {
    return TypeMessageMiladi.YENNAYER;
  } else if ((_now.month == 12 && _now.day == 31 && _now.hour > 20) ||
      (_now.month == 1 && _now.day == 1)) {
    return TypeMessageMiladi.FIN_DECEMBRE;
  } else if (_now.month == 3 && _now.day == 9) {
    return TypeMessageMiladi.AMULI;
  }

  return TypeMessageMiladi.NOTHING;
}

TypeMessageHijri whichMessageToDisplayHijri() {
  final _hijri = HijriCalendar.fromDate(DateTime.now());

  final dayhijri = _hijri.hDay;
  final monthhijri = _hijri.hMonth;

  if (monthhijri == 9 && dayhijri < 19) {
    return TypeMessageHijri.RAMADHAN;
  } else if (monthhijri == 9 && dayhijri >= 20) {
    return TypeMessageHijri.FIN_RAMADHAN;
  } else if (monthhijri == 10 && (dayhijri == 1 || dayhijri == 2)) {
    return TypeMessageHijri.AAID_FITRE;
  } else if (monthhijri == 10 && dayhijri >= 17) {
    return TypeMessageHijri.MIDDLE_CHAWWAL;
  } else if (monthhijri == 12 && (dayhijri >= 1 && dayhijri < 8)) {
    return TypeMessageHijri.ONE_8_DOU_LHIJA;
  } else if (monthhijri == 12 && dayhijri == 8) {
    return TypeMessageHijri.NINE_DOU_LHIJA;
  } else if (monthhijri == 12 && (dayhijri >= 10 || dayhijri <= 12)) {
    return TypeMessageHijri.AAIDE_ADHA;
  } else if (monthhijri == 1 && dayhijri == 1) {
    return TypeMessageHijri.LAST_DOU_LHIJA;
  } else if (monthhijri != 9 && dayhijri >= 12 && dayhijri <= 14) {
    return TypeMessageHijri.MIDDLE_EVERY_MOUNTH;
  }

  return TypeMessageHijri.NOTHING;
}
