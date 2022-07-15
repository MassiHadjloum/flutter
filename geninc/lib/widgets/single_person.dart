// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/person.dart';
import 'package:geninc/widgets/person_ventes.dart';
import 'package:intl/intl.dart';

class SinglePerson extends StatefulWidget {
  final Person person;
  const SinglePerson({
    required this.person,
    Key? key,
  }) : super(key: key);

  @override
  State<SinglePerson> createState() => _SinglePersonState();
}

class _SinglePersonState extends State<SinglePerson> {
  bool show_more = false;

  List<Map<String, Object>> get dayly_ventes => List.generate(
        6,
        (index) {
          final weekday = DateTime.now().subtract(Duration(days: index + 1));
          return {'day': DateFormat.MMMEd('fr').format(weekday), "ventes": 0};
        },
      ).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Card(
      //color: Colors.grey[300],
      elevation: 5,
      child: Column(
        children: [
          ListTile(
            title: Text(widget.person.name),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  show_more = !show_more;
                });
              },
              icon: Icon(
                !show_more
                    ? Icons.expand_more_rounded
                    : Icons.expand_less_rounded,
              ),
            ),
          ),
          if (show_more)
            Column(
              children: [
                const Divider(
                  color: primaryColor,
                  endIndent: 16,
                  indent: 16,
                ),
                if (DateTime.now().weekday == DateTime.sunday)
                  ...dayly_ventes.map((e) => PersonVentes(ventes: e)).toList(),
              ],
            ),
        ],
      ),
    );
  }
}
