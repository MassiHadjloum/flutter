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
    final list = Data.listParams;
   

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
