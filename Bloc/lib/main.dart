import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_page.dart';
import 'blocs/cart_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App with BLoC',
        home: LoginPage(),
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}