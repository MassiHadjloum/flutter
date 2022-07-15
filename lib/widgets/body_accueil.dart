import 'dart:async';

import 'package:bnparisbas/widgets/accueil_card_1.dart';
import 'package:bnparisbas/widgets/accuil_card_2.dart';
import 'package:bnparisbas/widgets/circle_statistics.dart';
import 'package:flutter/material.dart';

class AccueilBody extends StatefulWidget {
  const AccueilBody({Key? key}) : super(key: key);

  static Widget buildText(
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
  }

  @override
  State<AccueilBody> createState() => _AccueilBodyState();
}

class _AccueilBodyState extends State<AccueilBody> {
  var loading = false;

  void prepare() {
    Future.delayed(
      Duration.zero,
      () => setState(() {
        loading = true;
      }),
    );
  }

  Widget _buildCard(
      BuildContext context, Widget child, double padding, double size) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.all(5),
        child: Container(
          height: MediaQuery.of(context).size.height * size,
          padding: EdgeInsets.all(padding),
          child: loading
              ? child
              : const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    prepare();
    //Timer(const Duration(microseconds: 500),
      //  () => provider.fetchBeneficaires(_id));
   
    
    return SingleChildScrollView( 
      child: Column(
        children: <Widget>[
          const SizedBox(height: 5),
          AccueilBody.buildText(27, "Dernière connexion le 13/03/2022 à 00h54",
              12, Colors.black38, false),
          _buildCard(context, const AccueilCard1(), 0, .45),
          _buildCard(context, const AccueilCard2(), 8, .4),
          _buildCard(context, const StatCircle(), 8, .33),
          _buildCard(context, const StatCircle(), 8, .33),
        ],
      ),
    );
  }
}
