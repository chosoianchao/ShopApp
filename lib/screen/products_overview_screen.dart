import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/products_grid.dart';

import '../provider/cart.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _isShowFavouritesItem = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("MyShop"),
          actions: [
            PopupMenuButton(
              onSelected: (selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favorites) {
                    _isShowFavouritesItem = true;
                  } else {
                    _isShowFavouritesItem = false;
                  }
                });
              },
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: FilterOptions.favorites,
                    child: Text('Only Favarourites'),
                  ),
                  const PopupMenuItem(
                    value: FilterOptions.all,
                    child: Text(
                      'Show All',
                    ),
                  ),
                ];
              },
              icon: const Icon(Icons.more_vert),
            ),
            Consumer<Cart>(
              builder: (context, cartData, widget) {
                return Badge(
                    value: cartData.itemCount.toString(), child: widget!);
              },
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: ProductsGrid(
          isShowFavouritesItem: _isShowFavouritesItem,
        ),
      ),
    );
  }
}
