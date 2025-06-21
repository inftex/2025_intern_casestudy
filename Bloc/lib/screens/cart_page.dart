import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';
import '../blocs/cart_state.dart';
import '../blocs/cart_event.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Giỏ hàng")),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.products.isEmpty) {
            return Center(child: Text("Chưa có sản phẩm nào"));
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                  itemBuilder: (_, i) {
                    final product = state.products[i];
                    return ListTile(
                      title: Text(product.name),
                      subtitle: Text("${product.price} VND"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          context.read<CartBloc>().add(RemoveProduct(product));
                        },
                      ),
                    );
                  },
                ),
              ),
              Text("Tổng tiền: ${state.totalPrice} VND", style: TextStyle(fontSize: 20)),
              SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }
}
