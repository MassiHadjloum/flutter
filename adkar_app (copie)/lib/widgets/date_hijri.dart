import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/widgets/hijri_calendar.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';


class HijriDate extends StatelessWidget {
  const HijriDate({ Key? key }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
   
    HijriCalendar.setLocal("ar");
    final _hijri = HijriCalendar.now();
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor),
        color: const Color.fromARGB(150, 72, 219, 251),
        borderRadius: BorderRadius.circular(15),
      ),
      //height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.all(10),
      child: Column(children: <Widget>[
        Text(
          "${_hijri.getDayName()} ${_hijri.hDay} ${_hijri.shortMonthName} ${_hijri.hYear} هجري",
          //textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 18,
            color: secondaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        const MyHijriCalendar(),
      ]),
    );
  }
}