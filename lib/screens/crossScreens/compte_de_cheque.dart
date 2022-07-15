import 'package:bnparisbas/models/menu_item.dart';
import 'package:bnparisbas/screens/crossScreens/telecharger_rib.dart';
import 'package:bnparisbas/screens/mainScreens/virements_screen.dart';
import 'package:flutter/material.dart';

class CompteDeChequeScreen extends StatefulWidget {
  static const routeName = "/accueil/cheque_de_compte";
  const CompteDeChequeScreen({Key? key}) : super(key: key);

  @override
  _CompteDeChequeScreenState createState() => _CompteDeChequeScreenState();
}

class _CompteDeChequeScreenState extends State<CompteDeChequeScreen>
    with SingleTickerProviderStateMixin {
 /*  Widget _buildText(String text, double? size, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  } */

  final listItem = ["RELEVÉ", "À VENIR", "CARTES", "DÉPENSES", "RECETTES"];
  TabController? _controller;
  var isLoading = true;
  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);

    super.initState();
  }

  /* @override
  void didChangeDependencies() {
    if (isLoading) {
      final data =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
      print(data);
      if (data['index'].runtimeType == int) {
        _controller!.index = data['index'] as int;
      }
    }
    isLoading = false;
    super.didChangeDependencies();
  } */

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  void _selectedItem(BuildContext context, MenuItem item) {
    switch (item.typeItem!) {
      case TypeItem.VIREMENT:
        Navigator.of(context).pushNamed(VirementsScreen.routeName,
            arguments: {"index": 0, "beneficaire": null});
        break;
      case TypeItem.RIB:
        Navigator.of(context).pushNamed(DownloadRIB.routeName);
        break;
      case TypeItem.CHEQUIER:
        break;
      case TypeItem.TRIEROP:
        break;
      case TypeItem.POINTEROP:
        break;
      case TypeItem.CATEGOROP:
        break;
      case TypeItem.LIBELLESET:
        break;
      case TypeItem.LOGOUT:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            "COMPTE DE CHÈQUES",
            style: TextStyle(fontSize: 15),
          ),
          backgroundColor:
              theme.colorScheme.secondary, //colorScheme.secondary, //rgba(47, 54, 64,1.0)
          actions: [
            PopupMenuButton<MenuItem>(
                elevation: 5,
                offset: const Offset(-5, 40),
                onSelected: (item) => _selectedItem(context, item),
                itemBuilder: (ctx) => [...MenuItems.itemsList]
                    .map(
                      (item) => PopupMenuItem<MenuItem>(
                        value: item,
                        child: ListTile(
                          horizontalTitleGap: 0,
                          selectedColor: theme.primaryColor,
                          visualDensity: VisualDensity.compact,
                          contentPadding: const EdgeInsets.all(0),
                          iconColor: theme.primaryColor,
                          leading: Icon(item.icon),
                          title: Text(item.title),
                        ),
                      ),
                    )
                    .toList()),
          ],
          bottom: TabBar(
            controller: _controller,
            isScrollable: true,
            unselectedLabelColor: Colors.white38,
            labelColor: Colors.white,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 3,
            tabs: listItem.map((item) => Tab(text: item)).toList(),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: listItem
              .map(
                (item) => Center(child: Text(item)),
              )
              .toList(),
        ),
      ),
    );
  }
}
