// order_history.dart

import '../cubit/cart_cubit.dart';

class OrderHistory {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime date;
  final String status;

  OrderHistory({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
    required this.status,
  });
}