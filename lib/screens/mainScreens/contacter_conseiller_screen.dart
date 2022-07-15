import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class ContacterConseillerScreen extends StatelessWidget {
  static const routeName = "/contacter_conseiller";
  const ContacterConseillerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final offset = data['offset'] as double;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contacter mon conseiller", style: TextStyle(fontSize: 15),),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      drawer: MyDrawer(title: routeName, offset: offset),
      body: const Center(child: Text("Contacter mon conseiller")),
    );
  }
}