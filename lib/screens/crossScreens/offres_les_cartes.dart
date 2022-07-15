import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/models/list_tile_info.dart';
import 'package:bnparisbas/screens/crossScreens/details_cates_visa.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:flutter/material.dart';

class OffresLesCartes extends StatelessWidget {
  static const routeName = "/offres/cartes";
  const OffresLesCartes({Key? key}) : super(key: key);

  Widget _buildContainer(
      BuildContext context, ListTileInfo item, double height) {
    return InkWell(
      splashColor: opacityPrimaryColor,
      onTap: () {
        navigateTo(context, item.typeCarte!);
      },
      child: Container(
        height: height,
        alignment: Alignment.center,
        child: ListTile(
          leading: item.leading,
          title: Text(item.title),
          subtitle: Text(item.subtitle!),
          trailing: item.trailing,
        ),
      ),
    );
  }

  //InfiniteVisaCard
  void navigateTo(BuildContext context, TypeCarte typeCarte) {
    switch (typeCarte) {
      case TypeCarte.INFINITE:
        Navigator.of(context).pushNamed(DetailsVisaCards.routeName, arguments: {
          "carte": "CARTE VISA INFINITE",
          "image": "assets/images/infinite_card.png",
          "listHeaderCarte": listHeaderCarteInfinite,
          "listDetailsCarte": listDetailsCarteInfinite
        });
        break;
      case TypeCarte.CRYPTOGRAMME:
        Navigator.of(context).pushNamed(DetailsVisaCards.routeName, arguments: {
          "carte": "CRYPTOGRAMME DYNAMIQUE",
          "image": "assets/images/cryptogramme.jpeg",
          "listHeaderCarte": listHeaderCryptogramme,
          "listDetailsCarte": listDetailsCryptogramme
        });
        break;
      case TypeCarte.PREMIER:
        Navigator.of(context).pushNamed(DetailsVisaCards.routeName, arguments: {
          "carte": "CARTE VISA PREMIER",
          "image": "assets/images/premier_card.jpeg",
          "listHeaderCarte": listHeaderCartePremier,
          "listDetailsCarte": listDetailsCartePremier
        });
        break;
      case TypeCarte.CLASSIC:
        Navigator.of(context).pushNamed(DetailsVisaCards.routeName, arguments: {
          "carte": "CARTE VISA CLASSIC",
          "image": "assets/images/classic_card.png",
          "listHeaderCarte": listHeaderCarteClassic,
          "listDetailsCarte": listDetailsCarteClassic
        });
        break;
      case TypeCarte.ELECTRON:
        Navigator.of(context).pushNamed(DetailsVisaCards.routeName, arguments: {
          "carte": "CARTE VISA ELECTRON",
          "image": "assets/images/electron_card.png",
          "listHeaderCarte": listHeaderCarteElectron,
          "listDetailsCarte": listDetailsCarteElectron
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(title: "LES CARTES"),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          ReuseWidgets.buildText("Trouvez la carte qui vous correspond",
              Colors.black, 18.0, 50.0, true),
          ...listTileInfoOffresCartes
              .map(
                (item) => Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child:
                      _buildContainer(context, item, mediaQuery.height * .13),
                ),
              )
              .toList(),
        ]),
      ),
    );
  }
}
