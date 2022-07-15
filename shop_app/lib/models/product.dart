import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,

    this.isFavorite = false,
  });

  void _setbool(value) {
    isFavorite = value;
    notifyListeners();
  }

  void toggleFavoriteStatus(String id, String authToken, String userId) async {
    final oldstatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();
    final url = Uri.parse(
        "https://flutter-a03c7-default-rtdb.firebaseio.com/userFavorites/$userId/$id.json?auth=$authToken");
    try {
      final res = await http.put(
        url,
        body: json.encode(isFavorite),
      );
      if (res.statusCode >= 400) {
        _setbool(oldstatus);
      }
    } catch (error) {
      _setbool(oldstatus);
    }
  }

  Map<String, Object> toJson(String userId) {
    return {
      'title': title,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'userId': userId,
      //'isFavorite': isFavorite
    };
  }
}
