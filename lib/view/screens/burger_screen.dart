// import 'package:flutter/material.dart';
//
// class BurgerScreen extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//
//         body: Center(
//           child: Text("Burger Content Here"),
//         ),
//
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screens/product_details_screen.dart';
import '../../cubit/favorite_products_cubit.dart';
import '../../model/product.dart';
import '../../model/productcard.dart';
import 'favorite_screen.dart';
//
// class BurgerScreen extends StatefulWidget {
//   @override
//   _BurgerScreenState createState() => _BurgerScreenState();
// }
//
// class _BurgerScreenState extends State<BurgerScreen> {
//   List<Product> products = [];
//   List<Product> favoriteProducts = []; // قائمة لتخزين المنتجات المفضلة
//
//   @override
//   void initState() {
//     super.initState();
//     loadMenu();
//   }
//
//   Future<void> loadMenu() async {
//     final String response = await rootBundle.loadString("assets/menub.json");
//     final List<dynamic> data = jsonDecode(response);
//     setState(() {
//       products = data.map((json) => Product.fromJson(json)).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: products.isEmpty
//             ? Center(child: CircularProgressIndicator())
//             : GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 5,
//             childAspectRatio: 0.7,
//           ),
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             final item = products[index];
//             return ProductCard(
//               item: item,
//               onFavoriteToggle: () {
//                 setState(() {
//                   item.isFavorite = !item.isFavorite;
//                   // إضافة أو إزالة المنتج من المفضلة بناءً على حالته
//                   if (item.isFavorite) {
//                     favoriteProducts.add(item);
//                   } else {
//                     favoriteProducts.remove(item);
//                   }
//                 });
//               },
//               onOrderNow: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => ProductDetailsScreen(product: item),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodtek/model/product.dart';
import 'package:foodtek/view/screens/favorite_screen.dart';
import 'package:foodtek/view/screens/product_details_screen.dart';
//
// class BurgerScreen extends StatefulWidget {
//   @override
//   _BurgerScreenState createState() => _BurgerScreenState();
// }class _BurgerScreenState extends State<BurgerScreen> {
//   List<Product> products = [];
//
//   @override
//   void initState() {
//     super.initState();
//     loadMenu();
//   }
//
//   Future<void> loadMenu() async {
//     final String response = await rootBundle.loadString("assets/menub.json");
//     final List<dynamic> data = jsonDecode(response);
//     setState(() {
//       products = data.map((json) => Product.fromJson(json)).toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: products.isEmpty
//             ? Center(child: CircularProgressIndicator())
//             : GridView.builder(
//
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 5,
//             crossAxisSpacing: 5,
//             childAspectRatio: 0.7,
//           ),
//           itemCount: products.length,
//           itemBuilder: (context, index) {
//             final item = products[index];
//             return ProductCard(
//               item: item,
//
//               onFavoriteToggle: () {
//                 if (item.isFavorite) {
//                   context.read<FavoriteProductsCubit>().removeFromFavorites(item);
//                 } else {
//                   context.read<FavoriteProductsCubit>().addToFavorites(item);
//                 }
//                 setState(() {
//                   item.isFavorite = !item.isFavorite;
//                 });
//               },
//               onOrderNow: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (_) => ProductDetailsScreen(product: item),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class BurgerScreen extends StatefulWidget {
  @override
  _BurgerScreenState createState() => _BurgerScreenState();
}

class _BurgerScreenState extends State<BurgerScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    loadMenu();
  }

  Future<void> loadMenu() async {
    final String response = await rootBundle.loadString("assets/menub.json");
    final List<dynamic> data = jsonDecode(response);
    setState(() {
      products = data.map((json) => Product.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background, // ✅ خلفية ديناميكية
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: products.isEmpty
            ? Center(
          child: CircularProgressIndicator(
            color: theme.primaryColor, // ✅ لون المؤشر من الثيم
          ),
        )
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
