import 'package:flutter/material.dart';
import 'package:testb6/data/product_list.dart';
import 'package:testb6/domain/product.dart';

class CartProvider with ChangeNotifier {
  List<Product> get _cartList => cartList;

  List<Product> get _productList => productList;

  void addToCart(Product product) {
    product.availability--;

    _cartList.add(product);

    notifyListeners();
  }

  void removeFromCart(Product product) {
    product.availability++;
    _cartList.remove(product);
    notifyListeners();
  }

  void clearCart() {
    for (Product item in _cartList) {
      item.availability++;
    }
    _cartList.clear();
    notifyListeners();
  }
}
