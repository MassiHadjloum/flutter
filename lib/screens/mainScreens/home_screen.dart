import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/screens/mainScreens/login_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget _buildText(BuildContext context, String text, double size, bool bold) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          //fontFamily: 'OpenSans',
          fontSize: size,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bnp_back1.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            padding: const EdgeInsets.all(0),
                            child: Image.asset("assets/images/bnp_logo1.jpeg",
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(height: 5),
                          _buildText(context, "BNP PARIBAS", 23, true),
                          _buildText(context,
                              "La banque d'un monde qui change.", 10, false),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        _buildText(context, "M. HADJLOUM", 22, true),
                        const SizedBox(height: 15),
                        _buildText(
                          context,
                          "Balayer l'écran vers la gauche pour afficher votre solde et vos dernières opération.",
                          15,
                          false,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).primaryColor, //rgba(26, 188, 156,1.0)
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
                margin: const EdgeInsets.only(left: 25, right: 25),
                child: FloatingActionButton.extended(onPressed: (){
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                backgroundColor: primaryColor,
                elevation: 0,
                 label: _buildText(context, "Accéder à mes comptes", 13, true)),
                /*  GestureDetector(
                  child: _buildText(context, "Accéder à mes comptes", 13, true),
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                ), */
              ),
            ],
          ),
        ],
      ),
    );
  }
}
