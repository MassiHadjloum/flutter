import 'package:bnparisbas/screens/crossScreens/compte_carte_moncompte.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class CompteCartesScreen extends StatefulWidget {
  static const routeName = "/comptes_cartes";
  const CompteCartesScreen({Key? key}) : super(key: key);

  @override
  State<CompteCartesScreen> createState() => _CompteCartesScreenState();
}

class _CompteCartesScreenState extends State<CompteCartesScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  var isLoading = true;
  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context).size;
    //final theme = Theme.of(context);
    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "COMPTES & CARTES",
            style: TextStyle(fontSize: 15),
          ),
          actions: const [
            Icon(Icons.power_settings_new_rounded),
            SizedBox(width: 20),
          ],
          backgroundColor: Theme.of(context).colorScheme.secondary,
          bottom: TabBar(
              controller: _controller,
              //isScrollable: true,
              unselectedLabelColor: Colors.white38,
              labelColor: Colors.white,
              automaticIndicatorColorAdjustment: true,
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: "MON COMPTE"),
                Tab(text: "MES CARTES"),
              ]),
        ),
        backgroundColor: Colors.blueGrey[50],
        drawer: const MyDrawer(),
        body: TabBarView(
          controller: _controller,
          children: const <Widget>[
           CompteCartesMonCompte(),
            Center(
              child: Text("cartes"),
            )
          ],
        ),
      ),
    );
  }
}
