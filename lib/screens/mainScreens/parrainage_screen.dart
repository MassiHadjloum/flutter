import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ParrainageScreen extends StatelessWidget {
  static const routeName = "/parrainage";
  const ParrainageScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final offset = data['offset'] as double;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Parrainage", style: TextStyle(fontSize: 15),),
        backgroundColor: Theme.of(context).colorScheme.secondary, //rgba(47, 54, 64,1.0)
      ),
      drawer: MyDrawer(title: routeName, offset: offset),
      body: const Center(child: Text("Parrainage")),
    );
  }
}