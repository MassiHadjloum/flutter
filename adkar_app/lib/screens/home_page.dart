
import 'package:adkar_app/widgets/header_image.dart';
import 'package:adkar_app/widgets/hijri_calendar.dart';
import 'package:adkar_app/widgets/home_page_menu.dart';
import 'package:adkar_app/widgets/my_second_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/parametre.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/build_icon_btn.dart';
import 'package:adkar_app/widgets/drawer.dart';

class MyHomePage extends StatelessWidget {
  static const routName = "/home";
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    final provider = Provider.of<ParametresProvider>(context);
    //final providertimes = Provider.of<TimesSalatProvider>(context, listen: false);
    //providertimes.getLocationG();
   
    provider.initializeParams();
    /*print("initial values param ${provider.getInitialParamsValue()}"); */
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final type = provider.getMenuType;
    final isNightMode = provider.getNightMode;
   
    final textColor = isNightMode ? whitingcolor : secondaryColor;
    final backgroundScreen = isNightMode ? secondaryColor : whitingcolor;
    return Scaffold(
      appBar: MyAppBar(
        title: "أذكار",
        actions: [
          BuildIconBtn(
            icon: isNightMode
                ? Icons.wb_sunny_sharp
                : Icons.nightlight_round_outlined,
            goTo: () => provider.activeateNightMode(!isNightMode),
          ),
          BuildIconBtn(
            icon: Icons.settings,
            goTo: () =>
                Navigator.of(context).pushNamed(ParametrsScreen.routeName),
          ),
          const SizedBox(width: 20),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: backgroundScreen,
      body: SizedBox(
        child: CustomScrollView(
          slivers: [
            const MySecondSliverAppBar(backgroundAppBar: HeaderImage(title: "",otherChild:
            MyHijriCalendar(),),),
            MenuHomePage(
              type: type,
              width: width,
              textColor: textColor,
            )
          ]
        ) /* Column(
          children: [
            const SizedBox(height: 15),
            const MyHijriCalendar(),
          ],
        ), */
      ),
    );
  }
}
