import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/widgets/drawer.dart';
import 'package:shop_app/widgets/user_product_item.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "/user_products";

  const UserProductsScreen({Key? key}) : super(key: key);

  Future<void> _refresh(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false).fetchAndSetProduct(true);

  }

  @override
  Widget build(BuildContext context) {
    //final provider = Provider.of<ProductsProvider>(context);
    //final data = provider.getitems;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder(
        future: _refresh(context),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting ? 
        const Center(child: CircularProgressIndicator()) :
          RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: Consumer<ProductsProvider>(
              builder: (ctx, productsData, _) =>
              Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemBuilder: (ctx, idx) => UserProductItem(
                    id: productsData.getitems[idx].id,
                    title: productsData.getitems[idx].title,
                    imageUrl: productsData.getitems[idx].imageUrl,
                  ),
                  itemCount: productsData.getitems.length,
                ),
              ),
            ),
          ),
      ),
    );
  }
}
