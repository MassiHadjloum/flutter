import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';

class PaimenetMobileScreen extends StatelessWidget {
  static const routeName = "/paiment_mobile";
  const PaimenetMobileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paiment mobile", style: TextStyle(fontSize: 15),),
        backgroundColor: Theme.of(context).colorScheme.secondary, //rgba(47, 54, 64,1.0)
      ),
      drawer: const MyDrawer(title: routeName),
      body: const Center(child: Text("Paimenet mobile")),
    );
  }
}