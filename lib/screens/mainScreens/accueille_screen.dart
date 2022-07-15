import 'dart:async';

import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/screens/mainScreens/login_screen.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/body_accueil.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:bnparisbas/widgets/show_dialogue.dart';
import 'package:flutter/material.dart';

class AccueilScreen extends StatelessWidget {
  static const routeName = "/accueil";
  const AccueilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: MyAppBar(
        title: "ACCUEIL",
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          ),
          //const SizedBox(width: 20),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => MyShowDialogue(
                  text: "Voulez vous deconnecter ?",
                  btnText: "Oui",
                  textColor: primaryColor,
                  pressed: () {
                    const CircularProgressIndicator();
                    Timer(const Duration(microseconds: 1500), () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => const LoginScreen(),
                        ),
                      );
                    });
                  },
                ),
              );
            },
            icon: const Icon(Icons.power_settings_new_rounded),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.blueGrey[50],
      drawer: const MyDrawer(title: routeName),
      body: const AccueilBody(),
    );
  }
}
