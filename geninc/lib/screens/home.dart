import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/providers/terrain_provider.dart';
import 'package:geninc/screens/terrain.dart';
import 'package:geninc/widgets/ly_flexibleSpace.dart';
import 'package:geninc/widgets/my_drawer.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<TerrainProvider>(context, listen: false).prepareHoleList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Acceuil'),
        flexibleSpace: MyFlexibleSpace(gradient: gradientColors),
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: Text('Acceuil'),
      ),
    );
  }
}
