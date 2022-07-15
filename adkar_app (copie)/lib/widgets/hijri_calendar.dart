import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:provider/provider.dart';

class MyHijriCalendar extends StatefulWidget {
  const MyHijriCalendar({Key? key}) : super(key: key);

  @override
  State<MyHijriCalendar> createState() => _MyHijriCalendarState();
}

class _MyHijriCalendarState extends State<MyHijriCalendar> {
  var selectedDate = HijriCalendar.now();

  Future<void> _selectedDate(BuildContext context) async {
    final HijriCalendar? picked = await showHijriDatePicker(
        context: context,
        textDirection: TextDirection.rtl,
        locale: const Locale('ar'),
        initialDate: selectedDate,
        firstDate: HijriCalendar()
          ..hYear = selectedDate.hYear
          ..hMonth = selectedDate.hMonth
          ..hDay = selectedDate.hDay,
        lastDate: HijriCalendar()
          ..hYear = 1500
          ..hMonth = selectedDate.hMonth
          ..hDay = selectedDate.hDay,
        initialDatePickerMode: DatePickerMode.day);
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    //final textColor = isNightMode ? whitingcolor : secondaryColor;
    final iconColor = isNightMode ? whitingcolor : primaryColor;
    HijriCalendar.setLocal(
        'ar' /* Localizations.localeOf(context).languageCode */);
    return Container(
      /* decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor),
        color: isNightMode ? Colors.black54 : Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ), */
      //height: 50,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () => _selectedDate(context),
            icon: Icon(
              Icons.calendar_today_rounded,
              color: iconColor,
              size: 30,
            ),
          ),
          Text(
            "${selectedDate.fullDate()} ",
            style: const TextStyle(
              fontSize: 20,
              color: whitingcolor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
