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
      "name": "Cheese Burger".tr(),
      "rating": 4.5,
      "price": 15.0,
      "description": "Grilled beef patty with lettuce, tomato, and cheese.".tr(),
      "image": "assets/images/Chese burger.png"
    },
    {
      "name": "Pepperoni Pizza".tr(),
      "rating": 4.8,
      "price": 18.0,
      "description": "Loaded with pepperoni and melted cheese.".tr(),
      "image": "assets/images/pizza10.png"
    },
    {
      "name": "Sandwich1".tr(),
      "rating": 3.2,
      "price": 12.0,
      "description": "Grilled chicken breast with lettuce, tomato, and mayo.".tr(),
      "image": "assets/images/img_1.png"
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
