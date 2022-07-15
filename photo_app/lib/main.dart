
import 'package:photo_app/providers/greate_places.dart';
import 'package:photo_app/screens/places_add_screen.dart';
import 'package:photo_app/screens/places_detail_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:photo_app/screens/places_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatePlaces(),
      child: MaterialApp(
      title: 'Greate Places',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        secondaryHeaderColor: Colors.grey,
      ),
      home: const PlacesListScreen(),
      routes:  {
        PlaceAddScreen.routeName: (ctx) => const PlaceAddScreen(),
        PlaceDetilScreen.routName: (ctx) => const PlaceDetilScreen(),
      },
    ));
  }
}
