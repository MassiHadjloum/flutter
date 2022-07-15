
import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/screens/crossScreens/offres_les_cartes.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class OffresScreen extends StatelessWidget {
  static const routeName = "/offres";
  const OffresScreen({Key? key}) : super(key: key);

 

  Widget _buildPaddingText(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  void navigateTo(BuildContext context, TypeData typedata) {
    switch (typedata) {
      case TypeData.CARTES:
        Navigator.of(context).pushNamed(OffresLesCartes.routeName);
    }
  }

  Widget _buildGridChild(
      BuildContext context, Map<String, Object>item, Color color) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      elevation: 10,
      child: InkWell(
        onTap: () => navigateTo(context, item['typeData']! as TypeData),
        splashColor: accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(6),
              width: 100,
              height: 100,
              child: Image.asset(item['image'] as String, color: color),
            ),
            Text(
              item['title'] as String,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final offset = data['offset'] as double;
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const MyAppBar(
        title: "OFFRES",
        actions: [
          Icon(Icons.power_settings_new_rounded),
          SizedBox(width: 20),
        ],
      ),
      drawer: MyDrawer(title: routeName, offset: offset),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ReuseWidgets.buildHeader(_buildPaddingText("Offres à la une", Colors.white),
                mediaQuery.height * .3),
            _buildPaddingText("Nos offres", Colors.black),
            SizedBox(
              height: mediaQuery.height * .8,
              child: GridView(
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                children: itemsGridEpargne
                    .map(
                      (item) => SizedBox(
                        width: 100,
                        child: item['image'] != null
                            ? _buildGridChild(context, item as Map<String, Object>
                                , theme.primaryColor)
                            : Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(15),
                                child: Text(
                                  item['title']! as String,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 5),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Vous pouvez aussi retrouvez l'intégralité de nos offres sur mabanque.bnppariba",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
