import 'package:flutter_bloc/flutter_bloc.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeCategorySelected extends HomeState {
  final String category;
  HomeCategorySelected(this.category);
}

class HomeSearchResults extends HomeState {
  final List<Map<String, dynamic>> filteredProducts;
  HomeSearchResults(this.filteredProducts);
}

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    // تأخير الإرسال لتجنب الأخطاء
    Future.microtask(() => emit(HomeSearchResults(allProducts)));
  }

  final List<Map<String, dynamic>> allProducts = [
    {
      "name": "Chicken Burger",
      "category": "Burger",
      "rating": 3.8,
      "price": 20.0,
      "image": "assets/images/Chicken burger.png"
    },
    {
      "name": "Cheese Burger",
      "category": "Burger",
      "rating": 4.5,
      "price": 15.0,
      "image": "assets/images/Chese burger.png"
    },
    {
      "name": "Chicken Pizza",
      "category": "Pizza",
      "rating": 4.7,
      "price": 18.0,
      "image": "assets/images/Chicken burger.png"
    },
    {
      "name": "Cheese Pizza",
      "category": "Pizza",
      "rating": 4.7,
      "price": 18.0,
      "image": "assets/images/Chese burger.png"
    },
  ];

  void searchProducts(String query) {
    if (query.isEmpty) {
      emit(HomeSearchResults(allProducts));
    } else {
      List<Map<String, dynamic>> filtered = allProducts
          .where((product) => product["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
      emit(HomeSearchResults(filtered));
    }
  }

  void selectCategory(String category) {
    emit(HomeCategorySelected(category));

    // تطبيق الفلترة بناءً على الفئة المحددة
    List<Map<String, dynamic>> filtered = (category == "All")
        ? allProducts
        : allProducts.where((product) => product["category"] == category).toList();

    emit(HomeSearchResults(filtered));
  }
}
