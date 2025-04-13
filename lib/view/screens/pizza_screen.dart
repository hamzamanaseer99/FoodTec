//
// import 'package:flutter/material.dart';
//
// class PizzaScreen extends StatelessWidget {
//   const PizzaScreen({super.key});
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         body: Center(
//           child: Text("pizza Content Here"),
//         ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/model/product.dart';
import 'package:foodtek/view/screens/favorite_screen.dart';
import 'package:foodtek/view/screens/product_details_screen.dart';

import '../../cubit/favorite_products_cubit.dart';
import '../../model/productcard.dart';

class PizzaScreen extends StatefulWidget {
  @override
  _PizzaScreenState createState() => _PizzaScreenState();
}class _PizzaScreenState extends State<PizzaScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadMenu();
  }

  Future<void> loadMenu() async {
    final String response = await rootBundle.loadString("assets/pizzas.json");
    final List<dynamic> data = jsonDecode(response);
    setState(() {
      products = data.map((json) => Product.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: products.isEmpty
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final item = products[index];
            return ProductCard(
              item: item,

              onFavoriteToggle: () {
                if (item.isFavorite) {
                  context.read<FavoriteProductsCubit>().removeFromFavorites(item);
                } else {
                  context.read<FavoriteProductsCubit>().addToFavorites(item);
                }
                setState(() {
                  item.isFavorite = !item.isFavorite;
                });
              },
              onOrderNow: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProductDetailsScreen(product: item),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
