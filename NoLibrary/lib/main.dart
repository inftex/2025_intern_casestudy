import 'package:flutter/material.dart';
import 'package:flutter_intern_plan3/models/cart_screen.dart';
import 'login_screen.dart';
import 'product_list_screen.dart';
import 'cart_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CartModel cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Cart App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/products': (context) => ProductListScreen(cart: cart),
        '/cart': (context) => CartScreen(cart: cart),
      },
    );
  }
}
