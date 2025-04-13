// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../model/product.dart';
// //
// // class FavoriteScreen extends StatefulWidget {
// //   @override
// //   _FavoriteScreenState createState() => _FavoriteScreenState();
// // }
// //
// // class _FavoriteScreenState extends State<FavoriteScreen> {
// //   List<Product> favoriteProducts = [];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Favorite Products"),
// //         automaticallyImplyLeading: false,
// //
// //       ),
// //       body: favoriteProducts.isEmpty
// //           ? Center(child: Text("No favorite products"))
// //           : ListView.builder(
// //         itemCount: favoriteProducts.length,
// //         itemBuilder: (context, index) {
// //           final item = favoriteProducts[index];
// //           return ListTile(
// //             leading: Image.asset(item.image ?? 'assets/images/default.png'),
// //             title: Text(item.name ?? "No Name"),
// //             subtitle: Text("\$${(item.price ?? 0).toStringAsFixed(0)}"),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   void addToFavorites(Product product) {
// //     setState(() {
// //       favoriteProducts.add(product);
// //     });
// //   }
// //
// //   void removeFromFavorites(Product product) {
// //     setState(() {
// //       favoriteProducts.remove(product);
// //     });
// //   }
// // }
// //
// // class FavoriteScreen extends StatelessWidget {
// //   final List<Product> favoriteProducts;
// //
// //   const FavoriteScreen({required this.favoriteProducts});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Favorite Products"),
// //       ),
// //       body: favoriteProducts.isEmpty
// //           ? Center(child: Text("No favorite products"))
// //           : ListView.builder(
// //         itemCount: favoriteProducts.length,
// //         itemBuilder: (context, index) {
// //           final item = favoriteProducts[index];
// //           return ListTile(
// //             leading: Image.asset(item.image ?? 'assets/images/default.png'),
// //             title: Text(item.name ?? "No Name"),
// //             subtitle: Text("\$${(item.price ?? 0).toStringAsFixed(0)}"),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:foodtek/model/product.dart';
// // import 'package:foodtek/view/screens/product_details_screen.dart';
// // import '../../cubit/favorite_products_cubit.dart';
// // import '../../model/productcard.dart';
// //
// // class FavoriteScreen extends StatelessWidget {
// //   final List<Product> favoriteProducts;
// //
// //   FavoriteScreen({required this.favoriteProducts});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Favorites"),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(8.0),
// //         child: favoriteProducts.isEmpty
// //             ? Center(child: Text("No Favorite Products"))
// //             : GridView.builder(
// //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //             crossAxisCount: 2,
// //             mainAxisSpacing: 10,
// //             crossAxisSpacing: 5,
// //             childAspectRatio: 0.7,
// //           ),
// //           itemCount: favoriteProducts.length,
// //           itemBuilder: (context, index) {
// //             final item = favoriteProducts[index];
// //             return ProductCard(
// //               item: item,
// //               onFavoriteToggle: () {
// //                 // يمكنك إضافة أو إزالة من المفضلة حسب الحاجة
// //                 context.read<FavoriteProductsCubit>().removeFromFavorites(item);
// //               },
// //               onOrderNow: () {
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                     builder: (_) => ProductDetailsScreen(product: item),
// //                   ),
// //                 );
// //               },
// //             );
// //           },
// //         ),
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/model/product.dart';
// import 'package:foodtek/view/screens/product_details_screen.dart';
// import '../../cubit/favorite_products_cubit.dart';
// import '../../model/productcard.dart';
//
// class FavoriteScreen extends StatelessWidget {
//   final List<Product> favoriteProducts;
//
//   FavoriteScreen({required this.favoriteProducts});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Favorites"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: favoriteProducts.isEmpty
//             ? Center(child: Text("No Favorite Products"))
//             : GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             mainAxisSpacing: 10,
//             crossAxisSpacing: 5,
//             childAspectRatio: 0.7,
//           ),
//           itemCount: favoriteProducts.length,
//           itemBuilder: (context, index) {
//             final item = favoriteProducts[index];
//             return ProductCard(
//               item: item,
//               onFavoriteToggle: () {
//                 // عند الضغط على زر إزالة من المفضلة، عرض Dialog لتأكيد العملية
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text("Remove from Favorites"),
//                       content: Text("Are you sure you want to remove this product from your favorites?"),
//                       actions: <Widget>[
//                         // إزالة زر "Cancel"
//                         TextButton(
//                           child: Container(
//                             width: 295, // العرض
//                             height: 48, // الارتفاع
//                             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
//                             decoration: BoxDecoration(
//                               color: Colors.green, // اللون
//                               borderRadius: BorderRadius.circular(10), // الزوايا
//                               border: Border.all(color: Colors.black12, width: 1), // الحدود
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "Yes",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             // إزالة المنتج من المفضلة
//                             context.read<FavoriteProductsCubit>().removeFromFavorites(item);
//                             Navigator.of(context).pop(); // إغلاق الـ Dialog
//                           },
//                         ),
//                       ],
//                     );
//                   },
//                 );
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
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/model/product.dart';
// import 'package:foodtek/view/screens/product_details_screen.dart';
// import '../../cubit/favorite_products_cubit.dart';
// import '../../model/productcard.dart';
//
// class FavoriteScreen extends StatelessWidget {
//   const FavoriteScreen({Key? key, required List favoriteProducts}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Favorites"),
//       ),
//       body: BlocBuilder<FavoriteProductsCubit, List<Product>>(
//         builder: (context, favoriteProducts) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: favoriteProducts.isEmpty
//                 ? Center(child: Text("No Favorite Products"))
//                 : GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 5,
//                 childAspectRatio: 0.7,
//               ),
//               itemCount: favoriteProducts.length,
//               itemBuilder: (context, index) {
//                 final item = favoriteProducts[index];
//                 return ProductCard(
//                   item: item,
//                   onFavoriteToggle: () {
//                     // عند الضغط على زر إزالة من المفضلة، عرض Dialog لتأكيد العملية
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text("Remove from Favorites"),
//                           content: Text(
//                               "Are you sure you want to remove this product from your favorites?"),
//                           actions: <Widget>[
//                             // إزالة زر "Cancel"
//                             TextButton(
//                               child: Container(
//                                 width: 295, // العرض
//                                 height: 48, // الارتفاع
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: 10, horizontal: 24),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green, // اللون
//                                   borderRadius:
//                                   BorderRadius.circular(10), // الزوايا
//                                   border: Border.all(
//                                       color: Colors.black12, width: 1), // الحدود
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Yes",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 // إزالة المنتج من المفضلة
//                                 context
//                                     .read<FavoriteProductsCubit>()
//                                     .removeFromFavorites(item);
//                                 Navigator.of(context).pop(); // إغلاق الـ Dialog
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   onOrderNow: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => ProductDetailsScreen(product: item),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/model/product.dart';
// import 'package:foodtek/view/screens/product_details_screen.dart';
// import '../../cubit/favorite_products_cubit.dart';
// import '../../model/productcard.dart';
// class FavoriteScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Favorites"),
//       ),
//       body: BlocBuilder<FavoriteProductsCubit, List<Product>>(
//         builder: (context, favoriteProducts) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: favoriteProducts.isEmpty
//                 ? Center(child: Text("No Favorite Products"))
//                 : GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 5,
//                 childAspectRatio: 0.7,
//               ),
//               itemCount: favoriteProducts.length,
//               itemBuilder: (context, index) {
//                 final item = favoriteProducts[index];
//                 return ProductCard(
//                   item: item,
//                   onFavoriteToggle: () {
//                     // عند الضغط على زر إزالة من المفضلة، عرض Dialog لتأكيد العملية
//                     showDialog(
//                       context: context,
//                       builder: (BuildContext context) {
//                         return AlertDialog(
//                           title: Text("Remove from Favorites"),
//                           content: Text("Are you sure you want to remove this product from your favorites?"),
//                           actions: <Widget>[
//                             TextButton(
//                               child: Container(
//                                 width: 295,
//                                 height: 48,
//                                 padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
//                                 decoration: BoxDecoration(
//                                   color: Colors.green,
//                                   borderRadius: BorderRadius.circular(10),
//                                   border: Border.all(color: Colors.black12, width: 1),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     "Yes",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               onPressed: () {
//                                 context.read<FavoriteProductsCubit>().removeFromFavorites(item);
//                                 Navigator.of(context).pop(); // إغلاق الـ Dialog
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   },
//                   onOrderNow: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => ProductDetailsScreen(product: item),
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/search_widget.dart';
import '../../cubit/favorite_products_cubit.dart';
import '../../model/product.dart';
import '../../model/productcard.dart';
import 'product_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _buildLocationIcon(),
        title: _buildLocationTitle(),
        actions: [NotificationIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(),
            SizedBox(
                height: 30),
            Text(
              'favorites',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: BlocBuilder<FavoriteProductsCubit, List<Product>>(
                builder: (context, favoriteProducts) {
                  print("Rebuilding FavoriteScreen with: $favoriteProducts");

                  if (favoriteProducts.isEmpty) {
                    return Center(child: Text("No Favorite Products"));
                  }

                  return GridView.builder(
                    itemCount: favoriteProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 5,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final item = favoriteProducts[index];
                      return ProductCard(
                        item: item,
                        onFavoriteToggle: () {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: Text("Remove from Favorites"),
                              content: Text("Are you sure?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.read<FavoriteProductsCubit>().removeFromFavorites(item);
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    height: 48,
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                                    decoration: BoxDecoration(
                                      color: Colors.green,

                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Colors.black12, width: 1),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Yes",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
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
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildLocationIcon() {
  return Container(
    margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xff4FAF5A).withOpacity(0.1),
    ),
    child: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
  );
}

Widget _buildLocationTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Current location", style: TextStyle(fontSize: 12, color: Color(0xff606060))),
      SizedBox(height: 4),
      Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    ],
  );
}
