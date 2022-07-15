import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/screens/crossScreens/compte_de_cheque.dart';
import 'package:bnparisbas/widgets/body_accueil.dart';
import 'package:bnparisbas/widgets/courbe_statistics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AccueilCard1 extends StatelessWidget {
  const AccueilCard1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context, listen: false).getUser['user'];
    //print(user['IBAN']);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(CompteDeChequeScreen.routeName);
      },
      splashColor: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AccueilBody.buildText(
                        27, "Compte de chèques", 19, Colors.black, false),
                    AccueilBody.buildText(
                        25,
                        user['IBAN']
                            .substring(16, 27)
                            .replaceRange(0, 7, "**** **** "),
                        13,
                        Colors.black54,
                        false),
                    const SizedBox(height: 5),
                    AccueilBody.buildText(
                        20,
                        "sold au ${DateFormat.yMd().format(DateTime.now())}",
                        13,
                        Colors.black54,
                        false),
                    AccueilBody.buildText(20, "Facilité de caisse: 300.00 €",
                        13, Colors.black54, false),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AccueilBody.buildText(
                        30, "${user['sold']} €", 22, Colors.black54, true),
                    const SizedBox(height: 15),
                    if(user['avenir'] != null) 
                    Row(
                      children: [
                        AccueilBody.buildText(
                            17, "À venir: ", 12, Colors.black54, false),
                        user['avenir'] >  0 ? 
                        AccueilBody.buildText(
                            17, "+${user['avenir']} €", 12, Colors.green, false)
                        :     
                        AccueilBody.buildText(
                            17, "${user['avenir']} €", 12, Colors.red, false)
                      
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
          const CourbeStatistics(),
          const Divider(),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AccueilBody.buildText(25, "EFFECTUER UN VIREMENT", 15,
                    Theme.of(context).primaryColor, true),
                AccueilBody.buildText(25, "ÉDITER UN RIB", 15,
                    Theme.of(context).primaryColor, true),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
