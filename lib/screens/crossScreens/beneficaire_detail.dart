import 'dart:async';

import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/screens/mainScreens/virements_screen.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeneficaireDetail extends StatefulWidget {
  static const routeName = '/virement/beneficaire_detail';

  const BeneficaireDetail({Key? key}) : super(key: key);

  @override
  State<BeneficaireDetail> createState() => _BeneficaireDetailState();
}

class _BeneficaireDetailState extends State<BeneficaireDetail> {
  Widget _buildRow(String text1, Widget child) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: 170,
              child: _buildText(text1, 15, Colors.black54),
              /*  Text(text1,
                  style: const TextStyle(color: Colors.black54, fontSize: 18),
              ), */
            ),
          ),
          child,
        ],
      ),
    );
  }

  Widget _buildText(String text, double size, Color? color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  }

  var deleted = false;
  @override
  void initState() {
    deleted = false;
    super.initState();
  }

  void deleteBeneficaire(BuildContext context, Beneficaires one, String _id, Color? color) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        contentPadding: const EdgeInsets.only(top: 15, left: 15),
        content:
            const Text("Êtes-vous sûr de vouloir supprimer ce bénéficaire ?"),
        actions: [
          TextButton(
              onPressed: () {
                Provider.of<VirementProvider>(context, listen: false)
                    .deleteBeneficaire(_id, one);//.removeBeneficaires(one);
                setState(() {
                  deleted = true;
                });
                Navigator.of(context).pop();
                Timer(const Duration(milliseconds: 900), () {
                  Navigator.of(context).pushNamed(VirementsScreen.routeName,
                      arguments: {"index": 1, "beneficaire": null});
                });
              },
              child: Text("CONFIRMER", style: TextStyle(color: color))),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("ANNULER", style: TextStyle(color: color)))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final beneficaire =
        ModalRoute.of(context)!.settings.arguments as Beneficaires;
    final theme = Theme.of(context);
    final _id = Provider.of<AuthProvider>(context, listen: false).getUser['user']['_id'];
    //final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: beneficaire.name,
        actions: [
          TextButton.icon(
            icon: const Icon(
              Icons.delete_sweep_outlined,
              size: 35,
              color: Colors.white,
            ),
            onPressed: () =>
                deleteBeneficaire(context, beneficaire, _id, theme.primaryColor),
            label: const Text(""),
          ),
          //const SizedBox(width: 25),
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
      body: deleted
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: [
                    _buildRow(
                      "Numéro de compte",
                      _buildText(
                          beneficaire.IBAN
                              .substring(16, 24)
                              .replaceRange(0, 4, "****"),
                          16,
                          Colors.black54),
                    ),
                    const Divider(color: Colors.black38),
                    _buildRow(
                      "Nom et adresse de la banque",
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          _buildText("SOCIETE GENERALE", 16, Colors.black87),
                          _buildText("17 COURS VALMYTOUR", 16, Colors.black87),
                          _buildText(
                              "SOCIETE GENERALEPARIS", 16, Colors.black87),
                          _buildText("LADEFENCE CEDEX", 16, Colors.black87),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.black38),
                  ],
                ),
                Container(
                  width: 160,
                  height: 40,
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: _buildText("Modifier", 16, Colors.white),
                )
              ],
            ),
    );
  }
}
