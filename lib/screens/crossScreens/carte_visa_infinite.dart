import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/cartes_detail.dart';
import 'package:flutter/material.dart';

class InfiniteVisaCard extends StatelessWidget {
  static const routeName = '/offres/cartes/infinite_carte';
  const InfiniteVisaCard({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(title: "CARTE VISA INFINITE"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ReuseWidgets.buildHeader(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ...listHeaderCarteInfinite
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
            ...listDetailsCarteInfinite
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
