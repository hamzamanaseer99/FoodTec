// history_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/orderhistory.dart';

class HistoryCubit extends Cubit<List<OrderHistory>> {
  HistoryCubit() : super([]);

  void addOrder(OrderHistory order) {
    final newState = List<OrderHistory>.from(state)..add(order);
    emit(newState);
  }

  void clearHistory() {
    emit([]);
  }
}