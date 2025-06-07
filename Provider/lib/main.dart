import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Lấy cart từ Provider
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text('${product.price} VNĐ'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      cart.remove(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Đã xóa ${product.name} khỏi giỏ')),
                      );
                    },
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tổng cộng:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${cart.totalPrice} VNĐ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
