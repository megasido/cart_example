import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testb6/application/cart_provider.dart';
import 'package:testb6/data/product_list.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Warenkorb'),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<CartProvider>().clearCart();
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Consumer<CartProvider>(builder: (context, cartProvider, child) {
          return ListView.builder(
            itemCount: cartList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(cartList[index].name.toString()),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    cartProvider.removeFromCart(cartList[index]);
                  },
                ),
              );
            },
          );
        }));
  }
}
