import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/cartes_detail.dart';
import 'package:flutter/material.dart';

class CartCryptogrammeDynmq extends StatelessWidget {
  static const routeName = "/offres/cartes/cryptogramme_dynmq";
  const CartCryptogrammeDynmq({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(title: "CRYPTOGRAMME DYNAMIQUE"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ReuseWidgets.buildHeader(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ReuseWidgets.buildText2("Cryptogramme dynamique", 17, true),
                    ReuseWidgets.buildText2("Une technologie fiable et innovante.", 16, false),
                  ]),
                mediaQuery.height * .5),
            ...listDetailsCryptogramme
                .map((item) => CarteDetail(
                      title: item['title']!,
                      image: item['image']!,
                      text: item['text']!,
                    ))
                .toList(),
          ],
        ),
      ),
    );
  }
}