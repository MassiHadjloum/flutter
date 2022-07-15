import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/build_icon_btn.dart';
import 'package:adkar_app/widgets/header_image.dart';
import 'package:adkar_app/widgets/my_second_sliver_appbar.dart';
import 'package:adkar_app/widgets/sora_item.dart';
import 'package:flutter/material.dart';
import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:quran/quran.dart' as qoran;

class QoranGrid extends StatelessWidget {
  static const routeName = "/qoran_menu";
  QoranGrid({Key? key}) : super(key: key);

  final qoranSowar =
      List.generate(113, (index) => qoran.getSurahNameArabic(index + 1));

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ParametresProvider>(context);
    final isNightMode = provider.getNightMode;
    final backgroundScreen = isNightMode ? secondaryColor : whitingcolor;

    return Scaffold(
      appBar: MyAppBar(
        title: "القرآن",
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
      backgroundColor: backgroundScreen,
      drawer: const MyDrawer(),
      body: CustomScrollView(
        slivers: [
          const MySecondSliverAppBar(
            backgroundAppBar: HeaderImage(title: "القرآن العظيم"),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (ctx, idx) => MenuSowar(name: qoranSowar[idx], index: idx + 1),
              childCount: 114,
            ),
          )
        ],
      ),
    );
  }
}
 /* SliverChildBuilderDelegate(
              (ctx, idx) => /* ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                primary: true,
                shrinkWrap: true,
                itemBuilder: (context, idx) => */
                  MenuSowar(name: qoranSowar[idx], index: idx + 1),

              // itemCount: qoranSowar.length,
              // ),

              childCount: 114,
            )
            ,*/