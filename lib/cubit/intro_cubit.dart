import 'package:flutter_bloc/flutter_bloc.dart';

class IntroCubit extends Cubit<int> {
  IntroCubit() : super(0);

  void goToNextPage(int totalPages) {
    if (state < totalPages - 1) {
      emit(state + 1);
    }
  }

  void goToPage(int page) {
    emit(page);
  }
}
