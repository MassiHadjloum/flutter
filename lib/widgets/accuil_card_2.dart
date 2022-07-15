import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/widgets/body_accueil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccueilCard2 extends StatelessWidget {
  const AccueilCard2({Key? key}) : super(key: key);

  Widget _buildText(String text, double size, Color color, bool bold) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final user = Provider.of<AuthProvider>(context, listen: false).getUser['user'];
    return InkWell(
      onTap: (){},
      splashColor: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildText("Synthése des comptes", 17, Colors.black, true),
          const SizedBox(height: 15),
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.grey[200]),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildText(
                      "Vous pouvez visualiser les comptes de vos différentes banque sur votre application Mes Comptes.",
                      15,
                      Colors.black,
                      false),
                  _buildText("AGRÉGER UN COMPTE EXTETRNE", 16, color, false)
                ],
              ),
            ),
          ),
          const Divider(),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AccueilBody.buildText(0, "MES AVOIRS", 16, Colors.black, false),
                  AccueilBody.buildText(0, "${user['sold']} €", 16, Colors.black, false),
                ],
              ),
              const SizedBox(height: 5),
              Container(
                height: 10,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 2),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          color: color,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Liquidités",
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ],
                  ),
                  Text("${user['sold']} €"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
