import 'package:flutter/material.dart';
import 'package:photo_app/providers/greate_places.dart';
import 'package:photo_app/screens/places_add_screen.dart';
import 'package:photo_app/screens/places_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Your places"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(PlaceAddScreen.routeName);
          },
          child: const Icon(Icons.add),
        ),
        body: FutureBuilder(
          future:
              Provider.of<GreatePlaces>(context, listen: false).fetchPlaces(),
          builder: (ctx, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : Consumer<GreatePlaces>(
                  builder: (ctx, greateplaces, ch) =>
                      greateplaces.places.isEmpty
                          ? ch!
                          : ListView.builder(
                              itemCount: greateplaces.places.length,
                              itemBuilder: (ctx, idx) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(greateplaces.places[idx].image),
                                ),
                                title: Text(greateplaces.places[idx].title),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      PlaceDetilScreen.routName,
                                      arguments: greateplaces.places[idx]);
                                },
                              ),
                            ),
                  child: const Center(
                    child: Text('Add Image Now !'),
                  ),
                ),
        ));
  }
}
