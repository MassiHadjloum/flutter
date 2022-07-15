import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/constants/data.dart';
import 'package:flutter/material.dart';

class CarteDetail extends StatelessWidget {
  final String title;
  final String image;
  final String text;
  const CarteDetail({
    Key? key,
    required this.title,
    required this.image,
    required this.text,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                 ReuseWidgets.buildContainerImage(
                  Image.asset(image, color: opacityPrimaryColor),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              text,
              style: const TextStyle(color: Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}
