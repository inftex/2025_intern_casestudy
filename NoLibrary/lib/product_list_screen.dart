import 'package:flutter/material.dart';
import 'models/product.dart';
import 'cart_model.dart';

class ProductListScreen extends StatelessWidget {
  final CartModel cart;

  ProductListScreen({required this.cart});

  final List<Product> products = [
    Product(name: 'Trà sữa', price: 30000),
    Product(name: 'Cà phê', price: 25000),
    Product(name: 'Nước cam', price: 20000),
    Product(name: 'Nước suối', price: 10000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách sản phẩm'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          )
        ],
      ),
      body: ListView(
        children: products
            .map(
              (product) => ListTile(
                title: Text(product.name),
                subtitle: Text('${product.price} VNĐ'),
                trailing: ElevatedButton(
                  onPressed: () {
                    cart.add(product);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Đã thêm ${product.name} vào giỏ')),
                    );
                  },
                  child: Text('Thêm'),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
