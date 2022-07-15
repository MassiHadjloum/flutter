import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/widgets/appbar.dart';
import 'package:geninc/widgets/ly_flexibleSpace.dart';
import 'package:geninc/widgets/my_drawer.dart';
import 'package:geninc/widgets/tab_ville.dart';

class Terrain extends StatefulWidget {
  static const routeName = '/terrain';
  const Terrain({Key? key}) : super(key: key);

  @override
  State<Terrain> createState() => _TerrainState();
}

class _TerrainState extends State<Terrain> with SingleTickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Terrain'),
          //backgroundColor: secondaryColor,
          flexibleSpace: MyFlexibleSpace(gradient: gradientColors,),
          bottom: TabBar(
              controller: _controller,
              unselectedLabelColor: Colors.white38,
              labelColor: Colors.white,
              automaticIndicatorColorAdjustment: true,
              indicatorColor: secondaryColor,
              //isScrollable: true,
              indicatorWeight: 3,
              tabs: const [
                Tab(text: 'Villes'),
                Tab(text: 'En cours'),
                Tab(text: 'Terminer'),
              ]),
        ),
        drawer: const MyDrawer(),
        body: TabBarView(
          controller: _controller,
          children: const [
            TabVille(statut_terrain: ALL),
            TabVille(statut_terrain: EN_COUR_DE_VISITE),
            TabVille(statut_terrain: VISITEE),
          ],
        ),
      ),
    );
  }
}
