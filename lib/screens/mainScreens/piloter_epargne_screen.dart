import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class PiloterMonEpargneScreen extends StatelessWidget {
  static const routeName = "/piloter_mon_epargne";
  const PiloterMonEpargneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const MyAppBar(
        title: 
          "PILOTER MON ÉPARGNE",
          actions: [
          Icon(Icons.power_settings_new_rounded),
          SizedBox(width: 20),
        ],
      ),
      drawer: const MyDrawer(title: routeName),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/images/coffre-fort.png",
                color: theme.primaryColor),
          ),
          const SizedBox(height: 20),
          const Text("Vous ne disposez pas d'épargne"),
          const SizedBox(height: 30),
          ReuseWidgets.buildButton(() {}, theme.primaryColor,
              "Découvrir nos offres d'épargne", false, 40, 5, 17)
        ],
      )),
    );
  }
}
