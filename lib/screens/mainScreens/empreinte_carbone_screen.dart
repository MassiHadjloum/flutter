import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class EmpreinteCarboneScreen extends StatelessWidget {
  static const routeName = "/empreinte_carbone";
  const EmpreinteCarboneScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final offset = data['offset'] as double;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Empreinte carbone", style: TextStyle(fontSize: 15),),
        backgroundColor: Theme.of(context).colorScheme.secondary, //rgba(47, 54, 64,1.0)
      ),
      drawer: MyDrawer(title: routeName, offset: offset),
      body: const Center(child: Text("Empreinte carbone")),
    );
  }
}