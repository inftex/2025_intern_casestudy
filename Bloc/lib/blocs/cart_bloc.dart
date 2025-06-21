import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/product.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState([])) {
    on<AddProduct>((event, emit) {
      final updated = List<Product>.from(state.products)..add(event.product);
      emit(CartState(updated));
    });

    on<RemoveProduct>((event, emit) {
      final updated = List<Product>.from(state.products)..remove(event.product);
      emit(CartState(updated));
    });
  }
}
