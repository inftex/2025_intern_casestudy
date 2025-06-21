import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import '../blocs/cart_bloc.dart';
import '../blocs/cart_event.dart';
import 'cart_page.dart';

class ProductPage extends StatelessWidget {
  final List<Product> products = [
    Product("Trà sữa", 30000),
    Product("Cà phê", 25000),
    Product("Nước cam", 20000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sản phẩm"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => CartPage()));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (_, i) {
          final product = products[i];
          return ListTile(
            title: Text(product.name),
            subtitle: Text("${product.price} VND"),
            trailing: ElevatedButton(
              child: Text("Thêm"),
              onPressed: () {
                context.read<CartBloc>().add(AddProduct(product));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${product.name} đã được thêm vào giỏ"))
                );
              },
            ),
          );
        },
      ),
    );
  }
}