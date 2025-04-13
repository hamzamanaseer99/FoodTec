import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/model/product.dart';

class CartItem {
  final Product product;
  final double spicyLevel;
  final int quantity;

  CartItem({
    required this.product,
    required this.spicyLevel,
    required this.quantity,
  });

  CartItem copyWith({int? quantity, double? spicyLevel}) {
    return CartItem(
      product: product,
      spicyLevel: spicyLevel ?? this.spicyLevel,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  /// Add product to the cart or update quantity if it already exists
  void addToCart(Product product, double spicyLevel, int quantity) {
    final index = state.indexWhere((item) =>
    item.product.name == product.name &&
        item.spicyLevel == spicyLevel);

    if (index != -1) {
      final updatedItem = state[index].copyWith(
        quantity: state[index].quantity + quantity,
      );
      final updatedList = List<CartItem>.from(state);
      updatedList[index] = updatedItem;
      emit(updatedList);
    } else {
      emit([
        ...state,
        CartItem(product: product, spicyLevel: spicyLevel, quantity: quantity),
      ]);
    }
  }

  /// Remove a specific item from cart
  void removeFromCart(CartItem itemToRemove) {
    emit(state.where((item) => item != itemToRemove).toList());
  }

  /// Clear the entire cart
  void clearCart() {
    emit([]);
  }

  /// Update the quantity of a specific item
  void updateQuantity(CartItem item, int newQuantity) {
    if (newQuantity < 1) return;
    final updatedItem = item.copyWith(quantity: newQuantity);
    final updatedCart = state.map((i) {
      return i.product == item.product ? updatedItem : i;
    }).toList();
    emit(updatedCart);
  }


  /// Get total cost
  double get total {
    return state.fold(
      0.0,
          (sum, item) => sum + (item.product.price * item.quantity),
    );
  }
}
