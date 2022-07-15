
import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/screens/crossScreens/ajout_beneficaire.dart';
import 'package:bnparisbas/screens/crossScreens/beneficaire_detail.dart';
import 'package:bnparisbas/widgets/body_accueil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VirementBenefaicaireList extends StatelessWidget {
  static const routeName = "virements/list_beneficaire";
  const VirementBenefaicaireList({Key? key}) : super(key: key);

  Widget _buildCard(BuildContext context, Widget child,
      Beneficaires? beneficaire, String mode) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 4,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: () {
          switch (mode) {
            case "detail":
              Navigator.of(context).pushNamed(BeneficaireDetail.routeName,
                  arguments: beneficaire);
              break;
            case "addOne":
              Navigator.of(context).pushNamed(BeneficaireAddOne.routeName);
              break;
            case "distinationAcount":
              Navigator.of(context).pushNamed(BeneficaireAddOne.routeName);
          }
        },
        child: child,
      ),
    );
  }

  String getFirst(int idx, List<Beneficaires> list) {
    var letter = "";
    if (idx < list.length - 1) {
      list[idx].name.substring(0, 1) == list[idx + 1].name.substring(0, 1)
          ? letter = ""
          : letter = list[idx].name.substring(0, 1);
    } else if (idx == list.length) {
      list[idx].name.substring(0, 1) == list[idx - 1].name.substring(0, 1)
          ? letter = ""
          : letter = list[idx].name.substring(0, 1);
    }

    return letter;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VirementProvider>(context, listen: false);
    final beneficaire = provider.getBeneficaires;
    //print("virement beneficaires ${beneficaire.length}");
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        _buildCard(
            context,
            SizedBox(
              height: mediaQuery.size.height * .07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_circle_outlined, color: theme.primaryColor),
                  const SizedBox(width: 10),
                  AccueilBody.buildText(null, "Ajouter un bénéficaire", 15,
                      theme.primaryColor, true),
                ],
              ),
            ),
            null,
            "addOne"),
         Expanded(
          child: SingleChildScrollView(
            child: SizedBox(
              height: mediaQuery.size.height * .73,
              child: Column(
                children: [
                  //SizedBox(height: (mediaQuery.size.height * .13)),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, idx) {
                        return _buildCard(
                            context,
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(beneficaire[idx].name),
                                  Text(
                                    beneficaire[idx]
                                        .IBAN
                                        .substring(16, 24)
                                        .replaceRange(0, 4, "****"),
                                    style: const TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            beneficaire[idx],
                            "detail");
                      },
                      itemCount: beneficaire.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        ), 
      ],
    );
  }
}


/*
Widget _buildCard(Widget child, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        text.isEmpty
            ? const SizedBox(height: 1)
            : Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 15),
                child: Text(text, textAlign: TextAlign.left),
              ),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          elevation: 4,
          child: child,
        ),
      ],
    );
  }


 */