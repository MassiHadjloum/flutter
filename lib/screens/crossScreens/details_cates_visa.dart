import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/screens/crossScreens/cates_en_detail.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/cartes_detail.dart';
import 'package:flutter/material.dart';

class DetailsVisaCards extends StatelessWidget {
  static const routeName = "/offres/cartes/detailles_carte";

  const DetailsVisaCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final carte = arguments['carte'] as String;
    final image = arguments['image'] as String;
    final listHeaderCarte =
        arguments['listHeaderCarte'] as List<Map<String, Object>>;
    final listDetailsCarte =
        arguments['listDetailsCarte'] as List<Map<String, String>>;
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(title: carte),
      backgroundColor: Colors.green[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReuseWidgets.buildHeader(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 5),
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: mediaQuery.height * .2,
                      child: Image.asset(image),
                    ),
                    ...listHeaderCarte
                        .map(
                          (item) => ReuseWidgets.buildText2(
                            item['text']! as String,
                            item['size'] != null
                                ? item['size'] as double
                                : 14.0,
                            item['bold'] != null ? item['bold'] as bool : false,
                          ),
                        )
                        .toList(),
                  ],
                ),
                mediaQuery.height * .5),
            ...listDetailsCarte
                .map((item) => CarteDetail(
                      title: item['title']!,
                      image: item['image']!,
                      text: item['text']!,
                    ))
                .toList(),
            Card(
              
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: ListTile(
                onTap: (){
                  Navigator.of(context).pushNamed(CardInDetail.routeName, arguments: {
                    "title": "La ${carte.toLowerCase()} en détail",
                    "list": listEnDetailCarteElectron
                  });
                },
                contentPadding: const EdgeInsets.all(3),
                horizontalTitleGap: 1,
                title: ReuseWidgets.buildText2(
                    "${carte.toLowerCase()} en détail", 17, true, Colors.black),
                subtitle: ReuseWidgets.buildText2(
                    "Retrouvez tous ce que vous voulez sur ${carte.toLowerCase()}",
                    15,
                    false,
                    Colors.black),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded,
                    size: 40, color: primaryColor),
              ),
            ),
            Container(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ReuseWidgets.buildText2(
                      "Comment souscrire ?", 19, true, Colors.black),
                  ...listSouscrireCarte
                      .map((item) => ListTile(
                            title: Text(item.title),
                            leading:
                                ReuseWidgets.buildContainerImage(item.leading),
                            subtitle: Text(item.subtitle!),
                          ))
                      .toList(),
                ],
              ),
            ),
            ReuseWidgets.buildTextPadding("Documents utile", Colors.black, textSize: 20)
          ],
        ),
      ),
    );
  }
}
