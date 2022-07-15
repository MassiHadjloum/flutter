import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/providers/cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime start;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.start,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  final String? authToken;
  final String? userId;

  Orders(this.authToken, this.userId, this._orders);

  List<OrderItem> get getOrders {
    return [..._orders];
  }

  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        "https://flutter-a03c7-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken");
    final res = await http.get(url);
    try {
      final respanse = await http.get(url);
      final extractedData = json.decode(respanse.body) as Map<String, dynamic>;
      final List<OrderItem> loadedOrders = [];
      if(extractedData == null) {
        return;
      }
      extractedData.forEach((keyid, order) {
        loadedOrders.add(
          OrderItem(
            id: keyid,
            amount: order['amount'],
            start: DateTime.parse(order['dateTime']),
            products: (order['products'] as List<dynamic>).map(
              (item) => CartItem(
                  id: item['id'],
                  title: item['title'],
                  price: item['price'],
                  quantity: item['quantity'],
            ),
          ).toList(),
        ),);
      });
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        "https://flutter-a03c7-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken");
    final timestamp = DateTime.now();
    final res = await http.post(url,
        body: json.encode({
          'amount': total,
          'dateTime': timestamp.toIso8601String(),
          'products': cartProducts
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quantity': cp.quantity,
                    'price': cp.price,
                  })
              .toList(),
        }));
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(res.body)['name'], // timestamp.toString(),
        amount: total,
        products: cartProducts,
        start: timestamp,
      ),
    );
    notifyListeners();
  }
}
