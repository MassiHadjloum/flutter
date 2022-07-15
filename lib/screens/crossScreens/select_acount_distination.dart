import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/screens/mainScreens/virements_screen.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlelectAcountDistination extends StatelessWidget {
  static const routeName = "/virements/acount_distination";
  const SlelectAcountDistination({Key? key}) : super(key: key);

  Widget buildCard(
      BuildContext context, Widget child, Beneficaires? beneficaire) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      elevation: 4,
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: () {
          Navigator.of(context).pushNamed(VirementsScreen.routeName,
              arguments: {"index": 0, "beneficaire": beneficaire});
        },
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    final beneficaire =
        Provider.of<VirementProvider>(context, listen: false).getBeneficaires;
    return Scaffold(
      appBar: const MyAppBar(title: "VERS LE COMPTE"),
      backgroundColor: Colors.blueGrey[50],
      body: Stack(children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              child: const Text("MES BÉNÉFICAIRES",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.grey)),
            ),
            /*Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: mediaQuery.size.height * .8,
                  child: Column(
                    children: [
                      //SizedBox(height: (mediaQuery.size.height * .13)),
                       Expanded(
                        child: ListView.builder(
                          itemBuilder: (ctx, idx) {
                            return buildCard(
                                context,
                                Container(
                                  padding: const EdgeInsets.all(15.0),
                                  height: 80,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(beneficaire[idx].name),
                                      Text(
                                        beneficaire[idx]
                                            .IBAN
                                            .substring(16, 24)
                                            .replaceRange(0, 4, "****"),
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                beneficaire[idx]);
                          },
                          itemCount: beneficaire.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ), */
            ReuseWidgets.buildListView(context, mediaQuery.size.height * .73,
                beneficaire, "distinationAcount"),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ReuseWidgets.buildCard(
              context,
              SizedBox(
                height: mediaQuery.size.height * .08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.add_circle_outlined, color: theme.primaryColor),
                    const SizedBox(width: 10),
                    ReuseWidgets.buildText(
                        "Ajouter un bénéficaire",
                        theme.primaryColor,
                        15,
                        mediaQuery.size.height * .1,
                        true),
                  ],
                ),
              ),
              null,
              "addOne"),
        )
      ]),
    );
  }
}
