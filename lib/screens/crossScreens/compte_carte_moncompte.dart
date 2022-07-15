import 'package:bnparisbas/constants/widhets.dart';
import 'package:flutter/material.dart';

class CompteCartesMonCompte extends StatelessWidget {
  const CompteCartesMonCompte({Key? key}) : super(key: key);

  Widget _buildColumnText(String text1, String text2) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
        Widget>[
      Text(text1, style: const TextStyle(color: Colors.white, fontSize: 12)),
      Text(text2, style: const TextStyle(color: Colors.white, fontSize: 15)),
    ]);
  }

  
  Widget _buildDivider() {
    return Divider(
        color: Colors.grey[300], height: 3, indent: 7, endIndent: 7, thickness: 1.5);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: mediaQuery.height * .09,
            color: theme.primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildColumnText("Total des avoirs", "2450,45 €"),
                const VerticalDivider(
                    color: Colors.white, indent: 6, endIndent: 6, thickness: 2),
                _buildColumnText("Total des crédits", "-"),
              ],
            ),
          ),
          ReuseWidgets.buildTextPadding("LIQUIDITÉS", theme.primaryColor),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: ListTile(
              minLeadingWidth: 5,
              minVerticalPadding: 0,
              contentPadding: const EdgeInsets.only(left: 0, right: 5),
              leading: VerticalDivider(
                  color: theme.primaryColor, width: 10, thickness: 4),
              title: const Text("Compte de chèques"),
              subtitle: const Text("N° ****4322"),
              trailing: const Text("2450,45 €",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          ReuseWidgets.buildTextPadding("ÉPARGNE", Colors.blue),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: Column(
              children: <Widget>[
                ReuseWidgets.buildTextPadding(
                    "Vous n'avez pas d'épargne pour le moment", Colors.black,
                    sized: true),
                _buildDivider(),
                ReuseWidgets.buildTextPadding("Découvrir non offres d'épargne", theme.primaryColor,
                    sized: true),
              ],
            ),
          ),
          ReuseWidgets.buildTextPadding("CRÉDITS", Colors.pink),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
            child: Column(
              children: <Widget>[
                ReuseWidgets.buildTextPadding(
                    "Vous n'avez aucun crédit pour le moment", Colors.black,
                    sized: true),
                _buildDivider(),
                ReuseWidgets.buildTextPadding("Découvrir non offres de crédit", theme.primaryColor,
                    sized: true),
              ],
            ),
          ),
          SizedBox(height: mediaQuery.height * .05),
          ReuseWidgets.buildButton(
              () {}, theme.primaryColor, "Ajouter un compte", false, 40, 5, 16),
        ],
      ),
    );
  }
}
