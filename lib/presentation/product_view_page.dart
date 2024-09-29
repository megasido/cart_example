import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testb6/application/cart_provider.dart';
import 'package:testb6/data/product_list.dart';
import 'package:testb6/presentation/cart_page.dart';
import 'package:testb6/presentation/product_detail_page.dart';

class ProductViewPage extends StatelessWidget {
  const ProductViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Produkte'),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              ),
            )
          ],
        ),
        body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  productList[index].name.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(productList[index].description.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    )),
                trailing: Text('\$${productList[index].price.toString()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      product: productList[index],
                    ),
                  ),
                ),
              );
            },
            itemCount: productList.length,
          );
        }));
  }
}
