import 'dart:async';
import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/screens/mainScreens/accueille_screen.dart';
import 'package:bnparisbas/widgets/row_login_code.dart';
import 'package:bnparisbas/widgets/show_dialogue.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _listNumbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];

  var code = [];
  var index = 0;
  var colors = [];
  var loged = false;
  var unloged = false;
  void _mixArray() {
    _listNumbers.shuffle();
  }

  @override
  void initState() {
    _mixArray();
    colors = [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ];
    code = <String>["", "", "", "", "", ""];
    super.initState();
  }

  Future<Map<String, dynamic>> submit(String code) async {
    return await Provider.of<AuthProvider>(context, listen: false)
        .login("1234567890", code);
  }

  void _setCode(String nbrcode) {
    setState(() {
      if (index < 6 && index >= 0) {
        code[index] = nbrcode;
        colors[index] = Colors.black;
        if (index == 5) {
          final finalcode = code.join("");
          submit(finalcode).then((value) {
            if (value != null && value['success'] == true) {
              Timer(const Duration(microseconds: 1500), () {
                setState(() {
                  loged = true;
                });
              });
              loged ? const CircularProgressIndicator() : _goToAccueille();
            } else {
              showDialog(
                context: context,
                builder: (ctx) => MyShowDialogue(
                  text:
                      "Votre saisie est incrorrecte. Veuillez renouvlez votre identification",
                  btnText: "OK",
                  pressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                ),
              );
            }
          });
        }
        index = index + 1;
      } else {
        index = 5;
      }
    });
  }

  void _setAndDeleteCode() {
    setState(() {
      if (index > 0) {
        index--;
        colors[index] = Colors.transparent;
        code[index] = "";
      } else {
        index = 0;
      }
    });
  }

  void _goToAccueille() {
    Timer(
      const Duration(milliseconds: 900),
      () => Navigator.of(context).pushNamed(AccueilScreen.routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    // Provider.of<AuthProvider>(context, listen: false)
    //    .login("1234437890", "876543");

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/bnp_back1.jpeg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Container(
            height: mediaQuery.size.height * .06,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: TextButton.icon(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/");
              },
              icon: const Icon(Icons.arrow_back, size: 25),
              label: const Text(""),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: mediaQuery.size.height * .1),
            alignment: Alignment.center,
            /*  decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.yellow)),
             */
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: mediaQuery.size.height * .05),
                SizedBox(
                  width: mediaQuery.size.width * 0.64,
                  child: const Text(
                    "Saisissez votre code secret pour accéder à vos comptes.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "OpenSans"),
                  ),
                ),
                SizedBox(height: mediaQuery.size.height * .04),
                SizedBox(
                  width: mediaQuery.size.width * 0.64,
                  child: RowLoginCode(colors: colors),
                ),
                Container(
                  alignment: Alignment.center,
                  width: mediaQuery.size.width * 0.72,
                  height: mediaQuery.size.height * 0.44,
                  child: loged
                      ? (const CircularProgressIndicator())
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1.3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: _listNumbers.length + 2,
                          itemBuilder: (ctx, idx) => idx <= 9
                              ? //ContainerCode(nbr: _listNumbers[idx], setCode: _setCode)
                              InkWell(
                                  splashColor: accentColor,
                                  onTap: () => _setCode(_listNumbers[idx]),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                   /*  decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 2,
                                        color: primaryColor,
                                      ),
                                    ), */
                                    alignment: Alignment.center,
                                    child: Text(
                                      _listNumbers[idx],
                                      style: const TextStyle(
                                          fontSize: 35,
                                          fontFamily: "OpenSans",
                                          color: Colors.white
                                          //fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                )
                              : idx == 10
                                  ? const Text("")
                                  : InkWell(
                                      splashColor: Colors.amber,
                                      onTap: _setAndDeleteCode,
                                      child: const Icon(
                                        Icons.backspace_rounded,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    ),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
