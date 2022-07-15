import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/dummy_products.dart';
import 'package:shop_app/models/htt_exceptions.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  //List<Product> _items = [...dummyproducts];
  List<Product> _items = [];
  bool showFavorites = false;

  final String? authToken;
  final String? userId;

  ProductsProvider(this.authToken, this.userId, this._items);

  List<Product> get getitems {
    return [..._items];
  }

  List<Product> get getFavoriteitems {
    return _items.where((pro) {
      return pro.isFavorite;
    }).toList();
  }

  Future<void> fetchAndSetProduct([bool filterByUser = false]) async {
    final filter = filterByUser ? 'orderBy="userId"&equalTo="$userId"' : '';
    var url = Uri.parse( 
        '''https://flutter-a03c7-default-rtdb.firebaseio.com/products.json?auth=$authToken&$filter''');
    try {
      final respanse = await http.get(url); 
      final extractedData = json.decode(respanse.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];
      if (extractedData == null) {
        return;
      } 
      
      url = Uri.parse(
          "https://flutter-a03c7-default-rtdb.firebaseio.com/userFavorites/$userId.json?auth=$authToken");
      final favoriteProducts = await http.get(url);
      final favdata = json.decode(favoriteProducts.body);
      extractedData.forEach((keyid, product) {
        loadedProducts.add(Product(
          id: keyid,
          title: product['title'],
          description: product['description'],
          price: product['price'],
          imageUrl: product['imageUrl'],
          isFavorite: favdata == null ? false : favdata[keyid] ?? false,
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      rethrow ;//error;
    }
  }

  void setShowFavorites(bool show) {
    showFavorites = show;
    notifyListeners();
  }

  Product getProductById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        "https://flutter-a03c7-default-rtdb.firebaseio.com/products.json?auth=$authToken");
    try {
      final respanse = await http.post(
        url,
        body: json.encode(product.toJson(userId!)),
      );
      final newProduct = Product(
        id: json.decode(respanse.body)['name'],
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      throw error;
    }
    // .then((res) {

    // }).catchError((err) => throw err);
  }

  Future<void> updateProduct(String id, Product product) async {
    final idx = _items.indexWhere((element) => element.id == id);
    if (idx >= 0) {
      final url = Uri.parse(
          "https://flutter-a03c7-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken");
      http.patch(url, body: json.encode(product.toJson(userId!)));
      _items[idx] = product;
      notifyListeners();
    } else {
      print("...");
    }
  }

  Future<void> removeProduct(String id) async {
    final url = Uri.parse(
      "https://flutter-a03c7-default-rtdb.firebaseio.com/products/$id.json?auth=$authToken",
    );
    final existingProductIdx = _items.indexWhere((element) => element.id == id);
    var existingProduct = _items[existingProductIdx];
    _items.removeWhere((element) => element.id == id);
    notifyListeners();
    // try {
    final res = await http.delete(url);
    if (res.statusCode >= 400) {
      _items.insert(existingProductIdx, existingProduct);
      notifyListeners();
      throw HttpException("Could not delete product");
    }
    // } catch (_) {}
  }

  void filterProductFavorites() {
    _items.where((prod) => prod.isFavorite == true);
    notifyListeners();
  }
}
