import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/ville.dart';
import 'package:geninc/widgets/btn_select_terrain.dart';
import 'package:intl/intl.dart';

class Progression extends StatefulWidget {
  final Ville ville;
  Progression({
    required this.ville,
    Key? key,
  }) : super(key: key);

  @override
  State<Progression> createState() => _ProgressionState();
}

class _ProgressionState extends State<Progression> {
  final progression = [0, 25, 50, 75, 100];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.ville.statut != NON_VISITEE)
          Text('Progression sur le terrain: ${widget.ville.progression} %'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: progression
              .map(
                (e) => Container(
                  width: 45,
                  height: 40,
                  margin: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: widget.ville.progression == e
                        ? Colors.green[300]
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(secondaryColor),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.ville.progression = e;
                        });
                      },
                      child: Text('$e')),
                ),
              )
              .toList(),
        ),
        Container(
          width: double.infinity,
          height: 10,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: LinearProgressIndicator(
            backgroundColor: secondaryColor,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
            value: widget.ville.progression / 100,
            minHeight: 5,
            semanticsLabel: "%",
          ),
        ),
        const SizedBox(height: 10),
        if (widget.ville.datedebut != null)
          Row(
            children: [
              const Text("Debut de visite :"),
              Text("${DateFormat.yMMMd().format(widget.ville.datedebut!)} ")
            ],
          ),
        const SizedBox(height: 20),
        if (widget.ville.datefin != null)
          Row(
            children: [
              const Text("Fin de visite :"),
              Text("${DateFormat.yMMMd().format(widget.ville.datefin!)} ")
            ],
          ),
        Align(
          alignment: Alignment.bottomRight,
          child: TerrainSelectButton(ville: widget.ville),
        )
      ],
    );
  }
}
