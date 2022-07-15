import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class RIBScreen extends StatefulWidget {
  static const routeName = "/rib";
  const RIBScreen({Key? key}) : super(key: key);

  @override
  State<RIBScreen> createState() => _RIBScreenState();
}

class _RIBScreenState extends State<RIBScreen>
    with SingleTickerProviderStateMixin {
  final listItem = ["RIB", "CHÈQUES", "RELEVÉS", "CONTRAT", "À SIGNER"];
  TabController? _controller;
  var isLoading = true;
  @override
  void initState() {
    _controller = TabController(length: 5, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final offset = data['offset'] as double;
    final theme = Theme.of(context);
    return DefaultTabController(
      length: 5,
      initialIndex: 1,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            "RIB, CHÈQUES & DOCUMENTS",
            style: TextStyle(fontSize: 15),
          ),
          actions: const [
            Icon(
              Icons.power_settings_new_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 10),
          ],
          backgroundColor: theme.colorScheme.secondary,
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
        drawer: MyDrawer(title: RIBScreen.routeName, offset: offset),
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
