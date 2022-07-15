import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/models/list_tile_info.dart';
import 'package:bnparisbas/widgets/appbar.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  static const routeName = "/profil";
  const ProfilScreen({Key? key}) : super(key: key);

  Widget _buildText(
      String text, Color? color, double? size, double? height, bool bold,
      [alignment = Alignment.center]) {
    return Container(
      alignment: alignment, //.center,
      /*  decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
       */
      height: height,
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget _buildCard(Widget child, double height, [String tag = "card"]) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(5),
        alignment: Alignment.center,
        height: height,
        child: child,
      ),
    );
  }

  Widget _buildCircleAvatar() {
    return Container(
      width: 90,
      height: 90,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image:
            DecorationImage(image: AssetImage("assets/images/bnp_logo1.jpeg")),
      ),
    );
  }

  Widget _buildContainer(String text, double height) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: height,
      child: Text(text, textAlign: TextAlign.left),
    );
  }

  Widget _buildColumn(List<ListTileInfo> list, Color color) {
    return Column(
      children: <Widget>[
        ...list
            .map(
              (item) => Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 5, bottom: 10),
                    minLeadingWidth: 20,
                    leading: item.leading,
                    title: Text(item.title),
                    subtitle: Text(item.subtitle!),
                    trailing: item.trailing != null
                        ? SizedBox(
                            width: 70,
                            child: ReuseWidgets.buildButton(
                                () {}, color, item.trailing, false, 25, 0, 10),
                          )
                        : null,
                  ),
                  const Divider(height: 4, color: Colors.black54),
                ],
              ),
            )
            .toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const MyAppBar(title: "PROFILE ET PARAMÈTRES", actions: [
        Icon(Icons.power_settings_new_rounded),
        SizedBox(width: 20),
      ]),
      backgroundColor: Colors.blueGrey[50],
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildCard(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildCircleAvatar(),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildText("M. HADJLOUM", Colors.black, 15,
                              mediaQuery.height * .07, true),
                          Icon(Icons.edit,
                              color: Theme.of(context).primaryColor),
                        ],
                      ),
                    ),
                    const Divider(height: 4, color: Colors.black54),
                    _buildText("AFFICHER LE N° CLIENT", theme.primaryColor, 15,
                        mediaQuery.height * .07, false),
                  ],
                ),
                mediaQuery.height * .35,
                'tag1'),
            const SizedBox(height: 10),
            _buildCard(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildText("Mes pièces justificatives", Colors.black87, 16,
                        mediaQuery.height * .07, false, Alignment.centerLeft),
                    const Divider(height: 4, color: Colors.black54),
                    ListTile(
                      title: const Text("Adresse e-mail"),
                      trailing: SizedBox(
                        width: 70,
                        child: ReuseWidgets.buildButton(() {},
                            theme.primaryColor, "ACTIVÉE", false, 25, 0, 10),
                      ),
                    ),
                    const Divider(height: 4, color: Colors.black54),
                    const ListTile(
                      title: Text("Mes infos personnelles"),
                      minVerticalPadding: 5,
                      subtitle: Text(
                        "Consulter et actualiser vos informationobligaoires.",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                mediaQuery.height * .3,
                'tag2'),
            _buildContainer("SÉCURITÉ", mediaQuery.height * .05),
            _buildCard(
                _buildColumn(listTileInfoSecuretyProfile,
                    theme.primaryColor),
                mediaQuery.height * .62,
                'tag3'),
            _buildContainer("PARAMÈTRES", mediaQuery.height * .05),
            _buildCard(
                _buildColumn(listTileInfoParametresProfile,
                    theme.primaryColor),
                mediaQuery.height * .7,
                'tag4'),
            _buildContainer("PERMISSION", mediaQuery.height * .05),
            _buildCard(
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 5),
                  minLeadingWidth: 20,
                  leading: Icon(
                    Icons.admin_panel_settings_rounded,
                    color: theme.primaryColor,
                    size: 40,
                  ),
                  title: const Text("Paramétres des cookies"),
                  subtitle: const Text(
                      "Gérez vos consentements pour l'utilisation des cookies dans l'application."),
                ),
                mediaQuery.height * .12,
                'tag5'),
            _buildContainer("ÉPARGNE", mediaQuery.height * .05),
            _buildCard(
                Column(
                  children: <Widget>[
                    _buildText("Mon Profil Client", Colors.black87, 16,
                        mediaQuery.height * .07, false, Alignment.centerLeft),
                    const Divider(height: 4, color: Colors.black54),
                    _buildText("Mon Profil de risque", Colors.black87, 16,
                        mediaQuery.height * .07, false, Alignment.centerLeft),
                  ],
                ),
                mediaQuery.height * .17,
                'tag6'),
          ],
        ),
      ),
    );
  }
}
