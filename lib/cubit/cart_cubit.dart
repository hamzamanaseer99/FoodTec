// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:foodtek/model/product.dart';
// //
// // class CartItem {
// //   final Product product;
// //   final double spicyLevel;
// //   final int quantity;
// //
// //   CartItem({
// //     required this.product,
// //     required this.spicyLevel,
// //     required this.quantity,
// //   });
// //
// //   CartItem copyWith({int? quantity, double? spicyLevel}) {
// //     return CartItem(
// //       product: product ?? this.product,
// //       spicyLevel: spicyLevel ?? this.spicyLevel,
// //       quantity: quantity ?? this.quantity,
// //     );
// //   }
// //   @override
// //   bool operator ==(Object other) =>
// //       identical(this, other) ||
// //           other is CartItem &&
// //               runtimeType == other.runtimeType &&
// //               product.name == other.product.name &&
// //               spicyLevel == other.spicyLevel;
// //
// //   @override
// //   int get hashCode => product.name.hashCode ^ spicyLevel.hashCode;
// // }
// //
// // class CartCubit extends Cubit<List<CartItem>> {
// //   CartCubit() : super([]);
// //
// //   /// Add product to the cart or update quantity if it already exists
// //   // في ملف cart_cubit.dart
// //   void addToCart({required Product product, required int quantity, required double spicyLevel}) {
// //     // تنفيذ الإضافة
// //
// //     final index = state.indexWhere(
// //           (item) =>
// //       item.product.name == product.name &&
// //           item.spicyLevel == spicyLevel,
// //     );
// //
// //     if (index != -1) {
// //       final updatedItem = state[index].copyWith(
// //         quantity: state[index].quantity + quantity,
// //       );
// //       final updatedList = List<CartItem>.from(state);
// //       updatedList[index] = updatedItem;
// //       emit(updatedList);
// //     } else {
// //       emit([
// //         ...state,
// //         CartItem(product: product, spicyLevel: spicyLevel, quantity: quantity),
// //       ]);
// //     }
// //   }
// //
// //   /// Remove a specific item from cart
// //   void removeFromCart(CartItem itemToRemove) {
// //     emit(state.where((item) => item != itemToRemove).toList());
// //   }
// //
// //   /// Clear the entire cart
// //   void clearCart() {
// //     emit([]);
// //   }
// //
// //   /// Update the quantity of a specific item
// //   void updateQuantity(CartItem item, int newQuantity) {
// //     if (newQuantity < 1) return;
// //     final updatedItem = item.copyWith(quantity: newQuantity);
// //     final updatedCart = state.map((i) {
// //       return (i.product.name == item.product.name &&
// //           i.spicyLevel == item.spicyLevel)
// //           ? updatedItem
// //           : i;
// //     }).toList();
// //     emit(updatedCart);
// //   }
// //
// //
// //   /// Get total cost
// //   double get subTotal {
// //     return state.fold(
// //       0.0,
// //           (sum, item) => sum + (item.product.price * item.quantity),
// //     );
// //   }
// //
// //   /// Total after delivery & discount
// //   double totalWithCharges({double deliveryCharge = 3.0, double discount = 2.0}) {
// //     return subTotal + deliveryCharge - discount;
// //   }
// // }
//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/model/product.dart';
//
// class CartItem {
//   final Product product;
//   final double spicyLevel;
//   final int quantity;
//
//   CartItem({
//     required this.product,
//     required this.spicyLevel,
//     required this.quantity,
//   });
//
//   CartItem copyWith({int? quantity, double? spicyLevel}) {
//     return CartItem(
//       product: product,
//       spicyLevel: spicyLevel ?? this.spicyLevel,
//       quantity: quantity ?? this.quantity,
//     );
//   }
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is CartItem &&
//               runtimeType == other.runtimeType &&
//               product.name == other.product.name &&
//               spicyLevel == other.spicyLevel;
//
//   @override
//   int get hashCode => product.name.hashCode ^ spicyLevel.hashCode;
// }
//
// class CartCubit extends Cubit<List<CartItem>> {
//   CartCubit() : super([]);
//
//   Future<void> addToCart({
//     required Product product,
//     required double spicyLevel,
//     required int quantity,
//   }) async {
//     final index = state.indexWhere(
//           (item) =>
//       item.product.name == product.name &&
//           item.spicyLevel == spicyLevel,
//     );
//
//     if (index != -1) {
//       final updatedItem = state[index].copyWith(
//         quantity: state[index].quantity + quantity,
//       );
//       final updatedList = List<CartItem>.from(state);
//       updatedList[index] = updatedItem;
//       emit(updatedList);
//     } else {
//       emit([
//         ...state,
//         CartItem(product: product, spicyLevel: spicyLevel, quantity: quantity),
//       ]);
//     }
//   }
//
//
//   void removeFromCart(CartItem itemToRemove) {
//     emit(state.where((item) => item != itemToRemove).toList());
//   }
//
//   void clearCart() {
//     emit([]);
//   }
//
//   void updateQuantity(CartItem item, int newQuantity) {
//     if (newQuantity < 1) return;
//
//     final updatedItem = item.copyWith(quantity: newQuantity);
//     final updatedCart = state.map((i) {
//       return (i.product.name == item.product.name &&
//           i.spicyLevel == item.spicyLevel)
//           ? updatedItem
//           : i;
//     }).toList();
//     emit(updatedCart);
//   }
//
//   /// Total without delivery or discount
//   double get subTotal {
//     return state.fold(
//       0.0,
//           (sum, item) => sum + (item.product.price * item.quantity),
//     );
//   }
//
//   /// Total after delivery & discount
//   double totalWithCharges({double deliveryCharge = 3.0, double discount = 2.0}) {
//     return subTotal + deliveryCharge - discount;
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/model/product.dart';

class CartItem {
  final Product product;
  final int quantity;
  final double spicyLevel;

  CartItem({
    required this.product,
    required this.quantity,
    required this.spicyLevel,
  });

  CartItem copyWith({
    Product? product,
    int? quantity,
    double? spicyLevel,
  }) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      spicyLevel: spicyLevel ?? this.spicyLevel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is CartItem &&
              runtimeType == other.runtimeType &&
              product.name == other.product.name &&
              spicyLevel == other.spicyLevel;

  @override
  int get hashCode => product.name.hashCode ^ spicyLevel.hashCode;
}

class CartCubit extends Cubit<List<CartItem>> {
  CartCubit() : super([]);

  Future<void> addToCart({
    required Product product,
    required double spicyLevel,
    required int quantity,
  }) async {
    final index = state.indexWhere(
          (item) =>
      item.product.name == product.name &&
          item.spicyLevel == spicyLevel,
    );

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

  void removeFromCart(CartItem itemToRemove) {
    emit(state.where((item) => item != itemToRemove).toList());
  }

  void clearCart() {
    emit([]);
  }

  void updateQuantity(CartItem item, int newQuantity) {
    if (newQuantity < 1) return;

    final updatedItem = item.copyWith(quantity: newQuantity);
    final updatedCart = state.map((i) {
      return (i.product.name == item.product.name &&
          i.spicyLevel == item.spicyLevel)
          ? updatedItem
          : i;
    }).toList();
    emit(updatedCart);
  }

  double get subTotal {
    return state.fold(
      0.0,
          (sum, item) => sum + (item.product.price * item.quantity),
    );
  }

  double totalWithCharges({double deliveryCharge = 3.0, double discount = 2.0}) {
    return subTotal + deliveryCharge - discount;
  }
}
