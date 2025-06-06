import 'models/product.dart';

class CartModel {
  final List<Product> _items = [];

  List<Product> get items => _items;

  void add(Product product) {
    _items.add(product);
  }

  void remove(Product product) {
    _items.remove(product);
  }

  int get totalPrice => _items.fold(0, (sum, item) => sum + item.price);
}
