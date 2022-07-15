import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/widgets/appbar.dart';
import 'package:geninc/widgets/chart.dart';
import 'package:geninc/widgets/ly_flexibleSpace.dart';
import 'package:geninc/widgets/my_drawer.dart';

class Statistics extends StatefulWidget {
  static const routeName = '/stat';
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> with TickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistiques'),
        bottom: TabBar(
            controller: _controller,
            unselectedLabelColor: Colors.white38,
            labelColor: Colors.white,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: secondaryColor,
            //isScrollable: true,
            indicatorWeight: 3,
            tabs: const [
              Tab(text: 'Mois'),
              Tab(text: 'Semaine'),
              Tab(text: 'Jour'),
            ]),
        flexibleSpace: MyFlexibleSpace(
          gradient: gradientColors,
        ),
      ),
      drawer: const MyDrawer(),
      body: Container(
          child: TabBarView(
        controller: _controller,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[400],
                  child: const Text(
                    "SRJ Group",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                ChartLinear(
                  maxX: 12,
                  maxY: 850,
                  minY: 100,
                  ventes: ventes_mois_group,
                  typeChart: MOIS,
                ),
                ChartLinear(
                  maxX: 12,
                  maxY: 850,
                  minY: 100,
                  ventes: ventes_mois_group,
                  typeChart: MOIS,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[400],
                  child: const Text(
                    "SRJ Group",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 500,
                    child: Column(
                      children: [
                        ChartLinear(
                          maxX: 8,
                          maxY: 200,
                          minY: 110,
                          ventes: ventes_semaine_group,
                          typeChart: SEMAINE,
                        ),
                        ChartLinear(
                          maxX: 8,
                          maxY: 200,
                          minY: 110,
                          ventes: ventes_semaine_group,
                          typeChart: SEMAINE,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[400],
                  child: const Text(
                    "SRJ Group",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                ChartLinear(
                  maxX: 7,
                  maxY: 60,
                  minY: 20,
                  ventes: ventes_jour_group,
                  typeChart: JOUR,
                ),
                ChartLinear(
                  maxX: 7,
                  maxY: 50,
                  minY: 20,
                  ventes: ventes_jour_group,
                  typeChart: JOUR,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
