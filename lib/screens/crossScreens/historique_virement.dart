import 'package:bnparisbas/models/virements.dart';
import 'package:bnparisbas/providers/auth_provider.dart';
import 'package:bnparisbas/providers/virement_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HistoriqueVirement extends StatelessWidget {
  const HistoriqueVirement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*  final virements = [
      Virements(
          IBANbenef: "",
          namebenef: "",
          date: DateTime.now(),
          monton: 233.43,
          motif: "remboursement"),
      Virements(
          IBANbenef: "",
          namebenef: "",
          date: DateTime.now(),
          monton: 233.43,
          motif: "remboursement")
    ]; */
    final _id = Provider.of<AuthProvider>(context, listen: false)
        .getUser['user']['_id'];
    final provider = Provider.of<VirementProvider>(context, listen: false);

    return SingleChildScrollView(
      child: FutureBuilder(
        future: provider.getVirementsFromServer(_id),
        builder: (ctx, snapshot) {
          var child;
          if (snapshot.connectionState == ConnectionState.waiting) {
            child = const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            provider.fetchVirement(snapshot.data as List);
            final virements = provider.getVirements;
            child = Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                itemBuilder: (ctx, idx) => Container(
                  //color: Colors.amberAccent,
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 10),
                  //margin: const EdgeInsets.all(10),
                  height: 115,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${virements[idx].motif} ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                  "${DateFormat.yMMMMd('fr').format(virements[idx].date)} "),
                              const Text(
                                "Exécuté", 
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          Text(
                            "-${virements[idx].monton} €",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ],
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      )
                    ],
                  ),
                ),
                itemCount: virements.length,
              ),
            );
          }
          return child;
        },
      ),
    );
  }
}
