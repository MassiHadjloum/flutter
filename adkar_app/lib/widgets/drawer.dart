import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/AsmaAllahGrid.dart';
import 'package:adkar_app/screens/adiya_menu.dart';
import 'package:adkar_app/screens/adkar_btn_grid.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/screens/mousabiha.dart';
import 'package:adkar_app/screens/parametre.dart';
import 'package:adkar_app/screens/qoran_grid.dart';
import 'package:adkar_app/widgets/build_text.dart';
import 'package:adkar_app/widgets/divider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(String title, Widget icon, VoidCallback tapHandler,
      [Color? color = secondaryColor]) {
    return ListTile(
      selectedColor: primaryColor,
      leading: icon,
      title: BuildText(title: title, color: color!, bold: true, size: 18, textDirection: TextDirection.rtl,),
      onTap: tapHandler,
    );
  }

  Widget _buildImage(String url, Color textColor) {
    return Image.asset(url,
        height: 30, width: 30,  color: textColor );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context, listen: false);
    final isNightMode = provider.getNightMode;
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    return Drawer(
      backgroundColor: isNightMode ? secondaryColor : whitingcolor,
      child: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              "assets/images/external-content.duckduckgo.comcoran1.jpeg",
              fit: BoxFit.fill,
            ),
          ),
          _buildListTile("الرئيسية ", Icon(Icons.home,  size: 30, color: textColor), () {
            Navigator.of(context).pushReplacementNamed(MyHomePage.routName);
          }, textColor),
          const MyDivider(color: secondcolor,),
          //ListTile(leading: const Icon(Icons.doua),)
          _buildListTile(
              "أذكار المسلم ",
              _buildImage("assets/images/box.png",
                  textColor), () {
            Navigator.of(context).pushReplacementNamed(AdkarGridBtns.routeName);
          }, textColor),
          const MyDivider(color: secondcolor,),
          _buildListTile(
              "أسماء الله الحسنى ",
              _buildImage("assets/images/allah_icon.png",
                  textColor), () {
            Navigator.of(context).pushReplacementNamed(AsmaAllahGrid.routeName);
          }, textColor),
          const MyDivider(color: secondcolor,),
          _buildListTile("القرآن", _buildImage("assets/images/qoranicon.png", textColor), () {
            Navigator.of(context).pushReplacementNamed(QoranGrid.routeName);
          }, textColor),
          const MyDivider(color: secondcolor,),
          _buildListTile("جوامع الدعاء", _buildImage("assets/images/douae.png", textColor), () {
            Navigator.of(context)
                .pushReplacementNamed(AdiyaScreenMenu.routeName, arguments: {
              'title': "جوامع الدعاء",
              'data': Data.adiyaname, 
            });
          }, textColor),
          const MyDivider(color: secondcolor,),
          _buildListTile("فضائل", _buildImage("assets/images/dua-hands.png", textColor), () {
            Navigator.of(context)
                .pushReplacementNamed(AdiyaScreenMenu.routeName, arguments: {
              'title': "فضائل",
              'data': Data.fadhailname,
            });
          }, textColor),
          const MyDivider(color: secondcolor,),
          _buildListTile("المسبحة", _buildImage("assets/images/mousabih.png", textColor), () {
            Navigator.of(context)
                .pushReplacementNamed(MousabihaScreen.routeName);
          }, textColor),
         
          const MyDivider(color: secondcolor,),
          _buildListTile("إعدادات", Icon(
              Icons.settings,
              color: textColor,
              size: 30,
            ), () {
              Navigator.of(context).pushNamed(ParametrsScreen.routeName);
            },
            textColor),
          const MyDivider(color: secondcolor,),
        ],
      ),
    );
  }
}
