import 'package:flutter/material.dart';
import 'package:flutter_intern_plan3/cart_model.dart';


class CartScreen extends StatelessWidget {
  final CartModel cart;

  CartScreen({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Giỏ hàng')),
      body: cart.items.isEmpty
          ? Center(child: Text('Giỏ hàng trống'))
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: cart.items
                        .map((item) => ListTile(
                              title: Text(item.name),
                              subtitle: Text('${item.price} VNĐ'),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Tổng tiền: ${cart.totalPrice} VNĐ',
                      style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
    );
  }
}
