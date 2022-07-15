// ignore_for_file: constant_identifier_names

import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/screens/crossScreens/ajout_beneficaire.dart';
import 'package:bnparisbas/screens/crossScreens/beneficaire_detail.dart';
import 'package:bnparisbas/screens/mainScreens/virements_screen.dart';
import 'package:flutter/material.dart';

enum TypeData {
  CARTES,
  EPARGNE,
  CREDITS,
  ASSURANCE,
  OFFRES,
}

enum TypeCarte { INFINITE, ELECTRON, PREMIER, CLASSIC, CRYPTOGRAMME }

class ReuseWidgets {
  static Widget rightArrow =
      const Icon(Icons.arrow_forward_ios_sharp, size: 15, color: primaryColor);

  static Widget buildHeader(Widget child, double size) {
    return Container(
      width: double.infinity,
      height: size,
      decoration: const BoxDecoration(
        color: opacityPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(200, 50),
          bottomRight: Radius.elliptical(200, 50),
        ),
      ),
      child: child,
    );
  }

  static Widget buildText2(String text,
      [double size = 16, bool bold = false, Color color = Colors.white]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(text,
          style: TextStyle(
              color: color,
              fontSize: size,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal)),
    );
  }

  static Widget buildButton(
      VoidCallback? function,
      Color? color,
      String? textButton,
      bool? disabled,
      double? height,
      double? marging,
      double? fontsize) {
    return Container(
      height: height,
      margin: EdgeInsets.only(bottom: marging!),
      alignment: Alignment.center,
      child: FloatingActionButton.extended(
        onPressed: disabled! ? null : function,
        tooltip: textButton,
        elevation: 5,
        backgroundColor:
            disabled ? const Color.fromARGB(150, 26, 188, 156) : color,
        label: Text(
          textButton!,
          style: TextStyle(
            color: disabled ? Colors.white54 : Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }

  static Widget buildCard(BuildContext context, Widget child,
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
              Navigator.of(context).pushNamed(VirementsScreen.routeName,
                  arguments: {"index": 0, "beneficaire": beneficaire});
          }
        },
        child: child,
      ),
    );
  }

  static Widget buildTextPadding(String text, Color color,
      {bool sized = false, double textSize = 16}) {
    return !sized
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(text,
                style: TextStyle(color: color, fontWeight: FontWeight.bold,
                fontSize: textSize)),
          )
        : Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            height: 50,
            child: Text(
              text,
              style: TextStyle(
                fontSize: textSize,
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }


  static Widget buildContainerImage(Widget child) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.green[100],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: child,
    );
  }

  static Widget buildText(
      String text, Color? color, double? size, double? height, bool bold,
      {alignment = Alignment.center,
      padding = 10.0,
      vertical = 10.0,
      textAlign = TextAlign.center}) {
    return Container(
      alignment: alignment, //.center,
      decoration:
          BoxDecoration(border: Border.all(color: Colors.amber, width: 2)),

      height: height,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: vertical),
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  /* static Widget buildText(
      double? height, String text, double size, Color color, bool bold) {
    return Container(
      alignment: Alignment.center,
      //height: height,
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          color: color,
          fontFamily: 'OpenSans',
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  } */

  static Widget buildListView(
      BuildContext context, double height, dynamic virements, String? mode) {
    return Expanded(
      child: SingleChildScrollView(
        child: SizedBox(
          height: height,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(virements[idx].name),
                              Text(
                                virements[idx]
                                    .IBAN
                                    .substring(16, 24)
                                    .replaceRange(0, 4, "****"),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        virements[idx],
                        mode!);
                  },
                  itemCount: virements.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
