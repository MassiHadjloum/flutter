import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showOnlyFavorites;
  const ProductsGrid({Key? key, required this.showOnlyFavorites})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    //final pro = context.read<ProductsProvider>().getitems;
    final loadedProducts = showOnlyFavorites ? products.getFavoriteitems : products.getitems;
    return GridView.builder(
      padding: const EdgeInsets.all(15),
      itemCount: loadedProducts.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, idx) => ChangeNotifierProvider.value(
        value: loadedProducts[idx],
        //create: (c) => loadedProducts[idx],
        child: const ProductItem(/* product: loadedProducts[idx] */),
      ),
    );
  }
}
