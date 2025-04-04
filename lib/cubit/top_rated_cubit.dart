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
      "name": "Cheese Burger",
      "rating": 4.5,
      "price": 15.0,
      "category": "Burger",
      "image": "assets/images/Chese burger.png"
    },
    {
      "name": "Pizza",
      "rating": 4.8,
      "price": 18.0,
      "category": "Pizza",
      "image": "assets/images/Chese burger.png"
    },
    {
      "name": "Sandwich",
      "rating": 3.2,
      "price": 12.0,
      "category": "Sandwich",
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
