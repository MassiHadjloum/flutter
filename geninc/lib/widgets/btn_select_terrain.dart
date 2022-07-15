import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/ville.dart';
import 'package:geninc/screens/terrain.dart';
import 'package:geninc/widgets/my_alertDialogue.dart';

class TerrainSelectButton extends StatelessWidget {
  final Ville ville;
  const TerrainSelectButton({
    required this.ville,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(secondaryColor),
      ),
      onPressed: ville.progression < 76 && ville.statut != NON_VISITEE
          ? null
          : () {
              showDialog(
                context: context,
                builder: (ctx) => MyShowDialogue(
                  text: ville.statut == NON_VISITEE
                      ? "Voulez-vous vraiment seléctionner cette ville comme terrain ?"
                      : ville.statut == EN_COUR_DE_VISITE
                          ? "Voulez-vous terminer la visite dans ce terrain ?"
                          : "Voulez-vous revisiter cette ville une autre fois ?",
                  btnText_oui: "Oui",
                  pressed_oui: () {
                    if (ville.statut == NON_VISITEE) {
                      ville.statut = EN_COUR_DE_VISITE;
                      ville.datedebut = DateTime.now();
                      ville.visites = ville.visites! + 1;
                    } else if (ville.statut == EN_COUR_DE_VISITE) {
                      ville.statut = VISITEE;
                      ville.datefin = DateTime.now();
                    } else {
                      ville.statut = NON_VISITEE;
                      ville.progression = 0;
                    }
                    Navigator.of(context).pushNamed(Terrain.routeName);
                  },
                  textColor: Colors.black87,
                  btnText_non: "Non",
                ),
              );
            },
      child: ville.statut == NON_VISITEE
          ? const Text('Selectionner')
          : ville.statut == EN_COUR_DE_VISITE
              ? const Text('Teminer')
              : const Text('Revisiter'),
    );
  }
}
