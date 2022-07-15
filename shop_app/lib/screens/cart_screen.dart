import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final cart = context.read<Cart>();
    final cart = Provider.of<Cart>(context);
    final cartvalues = cart.getItems.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Column(
        children: <Widget>[
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text("Total", style: TextStyle(fontSize: 20)),
                  const Spacer(),
                  Chip(
                    label: Text(
                      '\$${cart.totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  OrderButton(cart: cart, cartvalues: cartvalues)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, idx) => CartItemItem(
                id: cartvalues[idx].id,
                productId: cart.getItems.keys.toList()[idx],
                title: cartvalues[idx].title,
                price: cartvalues[idx].price,
                quantity: cartvalues[idx].quantity,
              ),
              itemCount: cart.getItemCount,
            ),
          )
        ],
      ),
    );
  }
}

class OrderButton extends StatefulWidget {
  const OrderButton({
    Key? key,
    required this.cart,
    required this.cartvalues,
  }) : super(key: key);

  final Cart cart;
  final List<CartItem> cartvalues;

  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  var _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.cart.totalPrice <= 0 || _isLoading ? null : () async {
        setState(() {
          _isLoading = true;
        });
        await Provider.of<Orders>(context, listen: false)
            .addOrder(widget.cartvalues, widget.cart.totalPrice);
        setState(() {
          _isLoading = false;
        });
        widget.cart.clear();
      },
      child: _isLoading ? const CircularProgressIndicator() : const Text("Order Now"),
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Theme.of(context).primaryColor,
        ),
        //TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}
