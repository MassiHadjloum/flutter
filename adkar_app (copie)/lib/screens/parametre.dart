import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/build_icon_btn.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:adkar_app/widgets/divider.dart';
import 'package:adkar_app/widgets/parametre_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParametrsScreen extends StatefulWidget {
  static const routeName = "/parametres";
  const ParametrsScreen({Key? key}) : super(key: key);

  @override
  State<ParametrsScreen> createState() => _ParametrsScreenState();
}

class _ParametrsScreenState extends State<ParametrsScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    //final backgroungColor = isNightMode ? Colors.black87 : secondcolor;
    final list = Data.listParams;
    //final change = provider.checkChangesParameters();
    //final mediaQuery = MediaQuery.of(context).size;

    return
        Scaffold(
      appBar: MyAppBar(
        title: "إعدادات",
        actions: [
          BuildIconBtn(
            icon: isNightMode
                ? Icons.wb_sunny_sharp
                : Icons.nightlight_round_outlined,
            goTo: () => provider.activeateNightMode(!isNightMode),
          ),
          BuildIconBtn(
            icon: Icons.home,
            goTo: () => Navigator.of(context).pushNamed(MyHomePage.routName),
          ),
          const SizedBox(width: 20),
        ],
      ),
      backgroundColor: provider.getNightMode ? secondaryColor : whitingcolor,
      body: Stack(children: <Widget>[
        Column(
          children: <Widget>[
            //const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    onPressed: () {
                      provider.resetParamsToDefault();
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.restart_alt_rounded,
                      size: 30,
                      color: textColor,
                    )),
                BuildText(
                  title: "الإعدادات الأولية",
                  color: textColor,
                  size: 18,
                  bold: false,
                )
              ],
            ),
            const MyDivider(),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(children: [
                ...list.map((item) => ParametreItem(title: item)).toList(),
                const SizedBox(height: 20)
              ]),
            ),
          ],
        ),
      ]),
      // ),
    );
  }
}
/* 
class SaveBtn extends StatefulWidget {
  const SaveBtn({
    Key? key,
    required this.isNightMode,
    required this.textColor,
    required this.saved,
  }) : super(key: key);

  final bool isNightMode;
  final Color textColor;
  final bool saved;

  @override
  State<SaveBtn> createState() => _SaveBtnState();
}

class _SaveBtnState extends State<SaveBtn> {
  void confirmSaving() {
    setState(() {
      widget.saved != widget.saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: confirmSaving,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: widget.isNightMode ? Colors.black54 : secondcolor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 2, color: primaryColor),
        ),
        child: Text(
          "حفظ",
          style: TextStyle(
            color: widget.textColor,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
 */