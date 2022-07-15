// ignore_for_file: non_constant_identifier_names

import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BeneficaireAddOne extends StatefulWidget {
  static const routeName = "/virement/beneficaire_add";
  const BeneficaireAddOne({Key? key}) : super(key: key);

  @override
  State<BeneficaireAddOne> createState() => _BeneficaireAddOneState();
}

class _BeneficaireAddOneState extends State<BeneficaireAddOne> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _IBANFocusNode = FocusNode();
  var data = {
    "name": "",
    "IBAN": "",
  };
  var isLoading = false;

  void _showInfoIBAN(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        contentPadding: const EdgeInsets.only(left: 20, top: 5, right: 20),
        titlePadding: const EdgeInsets.only(top: 10, left: 20),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "OK",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          )
        ],
        title: const Text("IBAN"),
        content: const Text(
            "L'IBAN (International Bank Account Number) est le numéro de compte bancaire requis pour ajouter un compte à vos virements SEPA. Il a une longueur spécifique à chaque paye (34 caractères maximum).",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 13)),
      ),
    );
  }

  void submit(String _id) {
    final isValidate = _formKey.currentState!.validate();
    if (!isValidate) {
      return;
    }
    _formKey.currentState!.save();
    Provider.of<VirementProvider>(context, listen: false).addBeneficaires(
        Beneficaires(
            name: data['name']!,
            IBAN: data['IBAN']!,
            bankName: 'LCL',
            bankAddr: "20 avenue de paris, villejuif cedex"),
        _id);
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).pop();
    });
  }

  /* void _validateIBAN(String value) {
    if (value.isEmpty ||
        !value.startsWith(RegExp("r[A-Z]?[0-9]?")) ||
        value.length < 27) {}
  } */

  @override
  void dispose() {
    _IBANFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final id = Provider.of<AuthProvider>(context, listen: false).getUser['user']
        ['_id'];
    //print(id);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const MyAppBar(
        title: "AJOUT DE BÉNÉFICAIRE",
      ),
      backgroundColor: Colors.blueGrey[50],
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(13.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Form(
                key: _formKey,
                child: ListView(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextFormField(
                      initialValue: data['name'],
                      textInputAction: TextInputAction.next,
                      cursorColor: theme.primaryColor,
                      decoration: const InputDecoration(
                        hintText: "Renseignez le nom prenom ou raison social",
                        labelText: "Nom du bénéficaire*:",
                        //labelStyle: TextStyle(color: theme.primaryColor),
                      ),
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_IBANFocusNode);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer un nom!";
                        }
                      },
                      onSaved: (value) => data['name'] = value!,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      initialValue: data['IBAN'],
                      textInputAction: TextInputAction.done,
                      focusNode: _IBANFocusNode,
                      cursorColor: theme.primaryColor,
                      onSaved: (value) => data['IBAN'] = value!,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Veuillez entrer un IBAN.";
                        }
                        if (!value
                            .startsWith("FR" /* RegExp("r[A-Z]?[0-9]?") */)) {
                          return "IBAN Français incorrect! IBAN: FR..";
                        }
                        if (value.length < 27) {
                          return "Invalide IBAN, minimum 27 caractères";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Renseignez l'IBAN",
                        labelText: "IBAN*:",
                        //labelStyle: TextStyle(color: theme.accentColor),
                        suffixIcon: TextButton.icon(
                          icon: Icon(
                            Icons.info,
                            size: 30,
                            color: theme.primaryColor,
                          ),
                          label: const Text(''),
                          onPressed: () => _showInfoIBAN(context),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * .57),
                    ReuseWidgets.buildButton(() => submit(id),
                        theme.primaryColor, "Valider", false, 40, 15, 17),
                  ],
                ),
              ),
      ),
    );
  }
}
