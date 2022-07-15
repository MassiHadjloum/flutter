import 'package:flutter/material.dart';

class ShowIcons extends StatelessWidget {
  const ShowIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Icons"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListView.builder(itemBuilder: (ctx, idx) => const ListTile())
          ],
        ),
      ),
    );
  }
}
