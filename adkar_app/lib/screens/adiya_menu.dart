import 'package:adkar_app/constants/data.dart';
import 'package:adkar_app/providers/paramertes_provider.dart';
import 'package:adkar_app/screens/home_page.dart';
import 'package:adkar_app/screens/parametre.dart';
import 'package:adkar_app/widgets/adiya_item.dart';
import 'package:adkar_app/widgets/appbar.dart';
import 'package:adkar_app/widgets/build_icon_btn.dart';
import 'package:adkar_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdiyaScreenMenu extends StatelessWidget {
  static const routeName = "adiya_menu";
  const AdiyaScreenMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final provider = Provider.of<ParametresProvider>(context);
    final title = args['title'] as String;
    final list = args['data'] as List<String>;
    return Scaffold(
      appBar: MyAppBar(
        title: title,
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
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (ctx, idx) => AdiyaItem(name: list[idx], index: idx),
          itemCount: list.length,
        ),
      ),
    );
  }
}
