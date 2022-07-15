import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:photo_app/helpers/db_helper.dart';
import 'package:photo_app/models/place.dart';

class GreatePlaces with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places {
    return [..._places];
  }

  void addPlace(String title, File image) {
    final newPlace = Place(
      id: DateTime.now().toIso8601String(),
      title: title,
      image: image,
      location: null,
    );
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchPlaces() async {
    final data = await DBHelper.getData('places');
    print(data);
    _places = data
        .map((elem) => Place(
            id: elem['id'],
            title: elem['title'],
            location: null,
            image: File(elem['image'])))
        .toList();
    notifyListeners();
  }
}
