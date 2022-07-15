import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/ville.dart';
import 'package:geninc/widgets/appbar.dart';
import 'package:geninc/widgets/progression.dart';

class DetailVille extends StatelessWidget {
  static const routeName = '/terrain/detail_ville';
  const DetailVille({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ville = ModalRoute.of(context)!.settings.arguments as Ville;
    return Scaffold(
      appBar: const MyAppBar(title: 'Detail'),
      body: SingleChildScrollView(
        child: Container(
          color: secondaryColor,
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  ville.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ville.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text("${ville.code}"),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Nombre de visites',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text("${ville.visites}"),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      //padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              const Text("Statut:"),
                              const SizedBox(width: 60),
                              Text(
                                ville.statut!,
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Progression(ville: ville),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //floatingActionButton:  TerrainSelectButton(ville: ville),
    );
  }
}
