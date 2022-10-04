import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/product_item.dart';

import '../provider/products.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key, required this.isShowFavouritesItem})
      : super(key: key);
  final bool isShowFavouritesItem;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products =
        isShowFavouritesItem ? productsData.favoritesItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        var item = products[index];
        return ChangeNotifierProvider.value(
          value: item,
          // create: (context) {
          //   return item;
          // },
          child: const ProductItem(),
        );
      },
    );
  }
}
