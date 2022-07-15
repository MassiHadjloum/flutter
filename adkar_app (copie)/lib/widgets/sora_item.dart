import 'package:flutter/material.dart';
//import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/sora_page.dart';
import 'package:adkar_app/widgets/divider.dart';
import 'package:quran/quran.dart' as qoran;

class MenuSowar extends StatelessWidget {
  final String name;
  final int index;

  const MenuSowar({Key? key, required this.name, required this.index})
      : super(key: key);

  Widget _buildText(String text, Color color, double size, bool bold,
      [String drc = "ltr"]) {
    return Text(
      text,
      textDirection: drc == "rtl" ? TextDirection.rtl : null,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ayat = qoran.getVerseCount(index);
    final place =
        qoran.getPlaceOfRevelation(index) == "Makkah" ? "مكية" : "مدنية";

    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    final background = isNightMode ? Colors.black87 : qoranmenuColor;
    final dividercolor = isNightMode ? whitingcolor : Colors.grey;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          color: background,
          child: InkWell(
              splashColor: Colors.grey,
              onTap: () {
                Navigator.of(context)
                    .pushNamed(SoraPage.routeName, arguments: index);
              },
              child: ListTile(
                minLeadingWidth: 150,
                title: _buildText(name, textColor, 26.0, true, "rtl"),
                leading: SizedBox(
                  width: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/box5.png"),
                          ),
                        ),
                        child: _buildText("$index", primaryColor, 16.0, false),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          _buildText(place, textColor, 15, true),
                          _buildText("$ayat آياتها", textColor, 13, false)
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ),
        MyDivider(color: dividercolor),
      ],
    );
  }
}


  /*  GridTile(
            child: Container(),
            header: Text(
              sora.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
            footer: GridTileBar(
              title: const Text(
                'zzz',
                style: TextStyle(color: Colors.black),
              ),
              trailing: Text(sora.type),
              backgroundColor: opacityPrimaryColor, // Colors.white,
            ),
          ),
        */