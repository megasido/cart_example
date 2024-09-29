import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:testb6/application/cart_provider.dart';
import 'package:testb6/presentation/product_view_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ProductViewPage(),
    );
  }
}
