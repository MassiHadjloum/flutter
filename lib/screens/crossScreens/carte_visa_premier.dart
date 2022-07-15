import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/cartes_detail.dart';
import 'package:flutter/material.dart';

class PremierVisaCard extends StatelessWidget {
  static const routeName = "/offres/cartes/premier_carte";
  const PremierVisaCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(title: "CARTE VISA PREMIER"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ReuseWidgets.buildHeader(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...listHeaderCartePremier
                        .map(
                          (item) => ReuseWidgets.buildText2(
                            item['text']! as String,
                            item['size'] != null ? item['size'] as double : 16.0,
                            item['bold'] != null ? item['bold'] as bool : false,
                          ),
                        )
                        .toList(),
                  ],
                ),
                mediaQuery.height * .5),
            ...listDetailsCartePremier
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