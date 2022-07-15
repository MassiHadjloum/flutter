import 'package:adkar_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("adkar")),
      drawer: const MyDrawer(),
      body: const Center(child: Text("adkar")),
    );
  }
}
