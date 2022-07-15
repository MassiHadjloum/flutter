import 'package:flutter/material.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/ville.dart';
import 'package:geninc/widgets/ville.dart';

class RowListVille extends StatelessWidget {
  final List<Ville> list;
  const RowListVille({
    required this.list,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[300],
              ),
              child: Text(
                //list.keys.first,
                list[0].name[0],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.symmetric(horizontal:  4),
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green[300]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Secteur'),
                  //Text('${list.values.first.length} ')
                  Text('${list.length} ')
                ],
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: MediaQuery.of(context).size.height * .4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, idx) => Container(
              width: 200,
              height: 300,
              child: VillsWidget(ville: list[idx]),
            ),
            itemCount: list.length,
          ),
        ),
      ],
    );
  }
}
