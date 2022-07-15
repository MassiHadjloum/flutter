import 'dart:math';

import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/screens/parametre.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/build_icon_btn.dart';
import 'package:adkar_app/widgets/drawer.dart';
import 'package:adkar_app/widgets/header_image.dart';
import 'package:adkar_app/widgets/menu_dikr.dart';
import 'package:adkar_app/widgets/my_second_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdkarGridBtns extends StatelessWidget {
  static const routeName = "/adkar_menu";
  const AdkarGridBtns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Data.adkarbtns;
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final provider = Provider.of<ParametresProvider>(context);
    final type = provider.getMenuType;
    final idx = Random().nextInt(Data.msgScreens.length);
    return Scaffold(
      appBar: MyAppBar(
        title: "أذكار المسلم",
        actions: [
          BuildIconBtn(
            icon: Icons.home,
            goTo: () => Navigator.of(context).pushNamed(MyHomePage.routName),
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
      backgroundColor: provider.getNightMode ? secondaryColor : whitingcolor,
      body: CustomScrollView(
        slivers: [
          MySecondSliverAppBar(
            backgroundAppBar: HeaderImage(title: Data.msgScreens[idx]),
          ),
          type == 'grid'
              ? SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, idx) => MenuDikr(
                      title: list[idx]['title'],
                      imageUrl: list[idx]['imageUrl']!,
                    ),
                    childCount: list.length,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: width > 420 ? 2.8 : 1.6,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (ctx, idx) => MenuDikr(
                      title: list[idx]['title'],
                      imageUrl: list[idx]['imageUrl']!,
                      height: mediaQuery.height * .1,
                    ),
                    childCount: list.length,
                  ),
                ),
        ],
      ),
    );
  }
}
