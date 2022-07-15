import 'package:flutter/material.dart';
import 'package:photo_app/models/place.dart';

class PlaceDetilScreen extends StatelessWidget {
  static const routName = "/detail/place";
  const PlaceDetilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context)!.settings.arguments as Place;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail place"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.file(
              place.image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(place.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 19),)
        ],
      ),
    );
  }
}
