import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;
import 'package:shop_app/widgets/drawer.dart';
import 'package:shop_app/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = "/orders";
  const OrderScreen({Key? key}) : super(key: key);

  /* void initState() {
    Future.delayed(Duration.zero).then((value) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    //final order = Provider.of<Orders>(context);
    //final orderData = order.getOrders;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Orders"),
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder(
        future: Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
        builder: (ctx, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.error != null) {
            //error message
          } else {
            return Consumer<Orders>(
              builder: (context, orderData, child) => ListView.builder(
                itemBuilder: (ctx, idx) =>
                    OrderItem(order: orderData.getOrders[idx]),
                itemCount: orderData.getOrders.length,
              ),
            );
          }
          return const Text('nothing');
        },
      ),
    );
  }
}
