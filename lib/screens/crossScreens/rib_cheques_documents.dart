import 'package:flutter/material.dart';

class RIBChequesDocuments extends StatefulWidget {
  static const routeName = "/rib_cheques_documents";
  const RIBChequesDocuments({Key? key}) : super(key: key);

  @override
  _RIBChequesDocumentsState createState() => _RIBChequesDocumentsState();
}

class _RIBChequesDocumentsState extends State<RIBChequesDocuments>
    with SingleTickerProviderStateMixin {
  /* Widget _buildText(String text, double? size, Color color) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size),
    );
  } */

  final listItem = ["RIB", "CHÈQUES", "RELEVÉS", "CONTRAT", "À SIGNER"];
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
            "RIB, CHÈQUES & DOCUMENTS",
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            FloatingActionButton.extended(
              onPressed: () {},
              label: const Text(""),
              icon: const Icon(Icons.power_settings_new_rounded, color: Colors.white,),
            )
          ],
          backgroundColor:
              theme.colorScheme.secondary, //colorScheme.secondary, //rgba(47, 54, 64,1.0)
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
