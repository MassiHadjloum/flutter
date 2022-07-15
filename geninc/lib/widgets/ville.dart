import 'package:flutter/material.dart';
import 'package:geninc/model/ville.dart';
import 'package:geninc/screens/detail_ville.dart';

class VillsWidget extends StatelessWidget {
  final Ville ville;
  const VillsWidget({
    required this.ville,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(DetailVille.routeName, arguments: ville);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 7, right: 7),
        width: 200, // mediaQuery.width * .4,
        height: 300, // mediaQuery.height * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          // border: Border.all(width: 1, color: primaryColor),
          image: DecorationImage(
            image: NetworkImage(ville.imageUrl, scale: 0.9),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ville.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.code,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${ville.code}',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
