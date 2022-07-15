import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/user_products_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Widget _buildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 160,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Text(
              "Shoping",
              style: TextStyle(
                fontSize: 29,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 20),
          _buildListTile("Orders", Icons.payment, () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
          }),
          const Divider(),
          _buildListTile("Products", Icons.shop, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          const Divider(),
          _buildListTile("Manage Products", Icons.edit, () {
            Navigator.of(context)
                .pushReplacementNamed(UserProductsScreen.routeName);
          }),
          const Divider(),
          _buildListTile("Logout", Icons.exit_to_app, () {
            //Navigator.of(context).pushReplacementNamed(UserProductsScreen.routeName);
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          }),
          const Divider(),
        ],
      ),
    );
  }
}
