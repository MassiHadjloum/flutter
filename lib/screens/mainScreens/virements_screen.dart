import 'dart:async';

import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/screens/crossScreens/ajout_virement.dart';
import 'package:bnparisbas/screens/crossScreens/historique_virement.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:bnparisbas/widgets/virement_beneficaire.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VirementsScreen extends StatefulWidget {
  static const routeName = "/virements";
  const VirementsScreen({Key? key}) : super(key: key);

  @override
  State<VirementsScreen> createState() => _VirementsScreenState();
}

class _VirementsScreenState extends State<VirementsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  var isLoading = true;
  var isLoading1 = false;
  List<Widget> children = [];
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isLoading) {
      final data =
          ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
      if (data['index'].runtimeType == int) {
        _controller!.index = data['index'] as int;
      }
      //setchildren();
    }
    isLoading = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  /*  void prepar() {
    Future.delayed(const Duration(milliseconds: 200), () => {
      setState((){
        isLoading1 = true;
      })
    });
  } */

  @override
  Widget build(BuildContext context) {
    final authprovider = Provider.of<AuthProvider>(context, listen: false);
    final _id = authprovider.getUser['user']['_id'];
    final provider = Provider.of<VirementProvider>(context, listen: false);
    //provider.fetchBeneficaires(benefList);

    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            "VIREMENTS",
            style: TextStyle(fontSize: 17),
          ),
          backgroundColor:
              Theme.of(context).colorScheme.secondary, //rgba(47, 54, 64,1.0)
          bottom: TabBar(
            controller: _controller,
            unselectedLabelColor: Colors.white38,
            labelColor: Colors.white,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: Theme.of(context).primaryColor,
            indicatorWeight: 3,
            tabs: const <Widget>[
              Tab(text: "NOUVEAU"),
              Tab(text: "BÉNÉFICAIRES"),
              Tab(text: "HISTORIQUE"),
            ],
          ),
        ),
        drawer: const MyDrawer(title: VirementsScreen.routeName),
        body: FutureBuilder(
            future: provider.getBeneficaireFromServer(_id),
            builder: (ctx, snapshot) {
              var children;
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                provider.fetchBeneficaires(snapshot.data as List);
                children = const [
                  VirementsAddOneScreen(),
                  VirementBenefaicaireList(),
                  HistoriqueVirement(),
                ];
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                //print("je suis dans waiting");
                children = const [
                  Center(child: CircularProgressIndicator()),
                  Center(child: CircularProgressIndicator()),
                  Center(child: CircularProgressIndicator())
                ];
              }
              return TabBarView(controller: _controller, children: children);
            }),
        //]
        //),
      ),
    );
  }
}

// child: _buildText("NOUVEAU", null, Colors.white)),
// child: _buildText("BÉNÉFICAIRES", null, Colors.white)),
// child: _buildText("HISTORIQUE", null, Colors.white)),