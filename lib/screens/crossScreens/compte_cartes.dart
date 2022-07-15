import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CompteCartes extends StatelessWidget {
  static const routeName = "/comptes_cartes";
  const CompteCartes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context).size;
    //final theme = Theme.of(context);
    return Scaffold(
      appBar: const MyAppBar(
        title: "PROFILE ET PARAMÈTRES",
        actions: [
          Icon(Icons.power_settings_new_rounded),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
      drawer: const MyDrawer(),
      body: const Center(
        child: Text("compte et cart"),
      ),
    );
  }
}
