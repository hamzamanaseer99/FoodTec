import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class TopRatedState {}

class TopRatedInitial extends TopRatedState {}

class TopRatedLoaded extends TopRatedState {
  final List<Map<String, dynamic>> products;
  TopRatedLoaded(this.products);
}

class TopRatedCubit extends Cubit<TopRatedState> {
  TopRatedCubit() : super(TopRatedInitial()) {
    loadTopRatedProducts();
  }

  final List<Map<String, dynamic>> topProducts = [
    {
      "name": "Chicken burger".tr(),
      "rating": 3.8,
      "price": 20.00,
      "description": "100 gr chicken + tomato + cheese  Lettuce".tr(),
      "image": "assets/images/Chicken burger.png"
    },
    {
      "name": "Chese burger".tr(),
      "rating": 4.5,
      "price": 15.00,
      "description": "100 gr meat + onion + tomato + Lettuce cheese".tr(),
      "image": "assets/images/Chese burger.png"
    },
    {
      "name": "Chicken burger".tr(),
      "rating": 3.8,
      "price": 20.00,
      "description": "100 gr chicken + tomato + cheese  Lettuce".tr(),
      "image": "assets/images/Chicken burger.png"
    },
    {
      "name": "Chese burger".tr(),
      "rating": 4.5,
      "price": 15.00,
      "description": "100 gr meat + onion + tomato + Lettuce cheese".tr(),
      "image": "assets/images/Chese burger.png"
    },
  ];

  void loadTopRatedProducts() {
    List<Map<String, dynamic>> topRated = topProducts
        .where((product) => product["rating"] >= 2)
        .toList();
    emit(TopRatedLoaded(topRated));
  }

  void search(String query) {
    List<Map<String, dynamic>> filtered = topProducts
        .where((product) =>
    product["name"].toLowerCase().contains(query.toLowerCase()) &&
        product["rating"] >= 4.0)
        .toList();
    emit(TopRatedLoaded(filtered));
  }
}
