import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screen/edit_product.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/user_product.dart';

import '../provider/products.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Your Products"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        drawer: const AppDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemCount: productsData.items.length,
            itemBuilder: (context, index) {
              var item = productsData.items[index];
              return Column(
                children: [
                  UserProductItem(
                    title: item.title,
                    imageUrl: item.imageUrl,
                    id: item.id.toString(),
                  ),
                  const Divider(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
