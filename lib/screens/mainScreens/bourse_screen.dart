import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:bnparisbas/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BourseScreen extends StatelessWidget {
  static const routeName = "/bourse";
  const BourseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<VirementProvider>(context, listen: false);
    final _id = Provider.of<AuthProvider>(context, listen: false)
        .getUser['user']['_id'];
    provider.getBeneficaireFromServer(_id);
   // print("bource _id $_id");
    final data =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object?>;
    final offset = data['offset'] as double;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bourse",
          style: TextStyle(fontSize: 15),
        ),
        backgroundColor:
            Theme.of(context).colorScheme.secondary, //rgba(47, 54, 64,1.0)
      ),
      drawer: MyDrawer(title: routeName, offset: offset),
      body: /* const Center(child: */ FutureBuilder(
          future: provider.getBeneficaireFromServer(_id),
          builder: (ctx, snapshot) {
            var child = const Center(child: Text('Bource'));
            if (snapshot.connectionState == ConnectionState.waiting) {
              child = const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              child = Center(child: Text('${snapshot.data}'));
            } else {
              child = Center(child: Text('${snapshot.error}'));
            }
            return Center(child: child);
          } //) ,
          //Text("Bourse")
          ),
    );
  }
}
