import '../models/product.dart';

class CartState {
  final List<Product> products;
  CartState(this.products);

  double get totalPrice =>
      products.fold(0, (sum, item) => sum + item.price);
}