import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/models/virements.dart';
import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/widgets/virement_nouveau_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class VirementsAddOneScreen extends StatefulWidget {
  static const routeName = "/virements/nouveau";
  const VirementsAddOneScreen({Key? key}) : super(key: key);

  @override
  _VirementsAddOneScreenState createState() => _VirementsAddOneScreenState();
}

class _VirementsAddOneScreenState extends State<VirementsAddOneScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final datecontroller = TextEditingController();
  var dataVirement = {
    "IBANbenef": "",
    "namebenef": "",
    "monton": 0.0,
    "date": DateTime.now(),
    "motif": "",
  };

  @override
  void dispose() {
    datecontroller.dispose();
    super.dispose();
  }

  var taille = 0;
  var datevrm;
  Future<void> _showDateForm() async {
    var date = await showDatePicker(
      locale: const Locale('fr', 'FR'),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
      builder: (ctx, ch) => Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.teal,
          ),
        ),
        child: ch!,
      ),
    );
    dataVirement['date'] = date!;
    datevrm = date;
    setState(() {});
    //datecontroller.text = date.toString().substring(0, 10);
  }

  void submit(String _id, Beneficaires beneficaire) {
    final isValidate = _formKey.currentState!.validate();
    if (!isValidate) {
      return;
    }
    _formKey.currentState!.save();
    dataVirement['IBANbenef'] = beneficaire.IBAN;
    dataVirement['namebenef'] = beneficaire.name;
    final virement = Virements(
        IBANbenef: dataVirement['IBANbenef'] as String,
        namebenef: dataVirement['namebenef'] as String,
        date: dataVirement['date'] as DateTime,
        monton: dataVirement['monton'] as double,
        motif: dataVirement['motif'] as String);
    Provider.of<VirementProvider>(context, listen: false)
        .addVirement(_id, virement);
    print(dataVirement);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final beneficaire = data['beneficaire'] ??
        Provider.of<VirementProvider>(context, listen: false).getFirst;
    final _id = Provider.of<AuthProvider>(context, listen: false)
        .getUser['user']['_id'];

    return /*  SingleChildScrollView(
      child: Container(
          height: mediaQuery.height,
          padding: const EdgeInsets.all(8.0),
          child: */
        Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          VirementNouveauCard(beneficaire: beneficaire as Beneficaires),
          Form(
            key: _formKey,
            child: SizedBox(
              //height: 400,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: mediaQuery.width * .6,
                        child: TextFormField(
                          //textInputAction: TextInputAction.next,
                          //cursorColor: theme.primaryColor,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            hintText: "valeur",
                            labelText: "Montant",
                            //labelStyle: TextStyle(color: theme.primaryColor),
                          ),
                          onSaved: (value) =>
                              dataVirement['monton'] = double.parse(value!),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField<dynamic>(
                            //value: "EUR",
                            items: <String>["EUR", "DLR"]
                                .map<DropdownMenuItem>(
                                  (value) => DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  ),
                                )
                                .toList(),
                            hint: const Text('Devise'),
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: TextFormField(
                      initialValue: "Unitaire",
                      decoration: const InputDecoration(
                        labelText: "Type de virement",
                      ),
                    ),
                  ),
                  /* DateVirement(
                      theme: theme, showDateForm: _showDateForm, date: datevrm),
                   */
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: _showDateForm,
                    child: Container(
                      padding: const EdgeInsets.only(left: 3),
                      //height: 35,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    const Text(
                                      "Date de virement",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black45),
                                    ),
                                    datevrm != null
                                        ? Text(
                                            "${DateFormat.yMMMMd('fr').format(datevrm)} ")
                                        : const Text("Aujourd'hui"),
                                  ],
                                ),
                                IconButton(
                                  onPressed: _showDateForm,
                                  icon: Icon(Icons.calendar_today_rounded,
                                      color: theme.primaryColor),
                                )
                              ],
                            ),
                            const Divider(
                              height: 2,
                              thickness: 1,
                              color: Colors.black54,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Motif",
                        hintText: "Aide familiale",
                        //prefix: Text("$taille /140"),
                      ),
                      maxLength: 140,
                      onSaved: (value) => dataVirement['motif'] = value!,
                    ),
                  ),
                  ReuseWidgets.buildButton(() => submit(_id, beneficaire),
                      theme.primaryColor, "Valider", false, 40, 15, 17),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DateVirement extends StatefulWidget {
  const DateVirement({
    Key? key,
    required this.theme,
    required this.showDateForm,
    required this.date,
  }) : super(key: key);

  final ThemeData theme;
  final DateTime date;
  final VoidCallback showDateForm;

  @override
  State<DateVirement> createState() => _DateVirementState();
}

class _DateVirementState extends State<DateVirement> {
  var date;

  @override
  Widget build(BuildContext context) {
    print(date);
    return InkWell(
      splashColor: Colors.grey,
      onTap: widget.showDateForm,
      child: Container(
        padding: const EdgeInsets.only(left: 3),
        //height: 35,
        child: Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Date de virement",
                        style: TextStyle(fontSize: 12, color: Colors.black45),
                      ),
                      Text("Aujourd'hui"),
                    ],
                  ),
                  IconButton(
                    onPressed: widget.showDateForm,
                    icon: Icon(Icons.calendar_today_rounded,
                        color: widget.theme.primaryColor),
                  )
                ],
              ),
              const Divider(
                height: 2,
                thickness: 1,
                color: Colors.black54,
              )
            ],
          ),
        ),
      ),
    );
  }
}


/*TextFormField(
          enabled: false,
          initialValue: "Aujourd'hui",
          decoration: InputDecoration(
              labelText: "Date de virement",
              suffixIcon: InkWell(
                onTap: _showDateForm,
                child: Icon(Icons.calendar_today_rounded,
                    color: theme.primaryColor),
              )),
      ), */