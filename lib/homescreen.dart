// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:foodtek/view/screens/cart_screen.dart';
// // import 'package:foodtek/cubit/botten_nav_cubit.dart';
// // import 'package:foodtek/view/screens/favorite_screen.dart';
// // import 'package:foodtek/view/screens/history_screen.dart';
// // import 'package:foodtek/view/screens/main_screen.dart';
// // import 'package:foodtek/view/screens/profile%20screen.dart';
// //
// //
// // class HomeScreen extends StatelessWidget {
// //   final List<String> categories = ["All", "Burger", "Pizza", "Sandwich"];
// //
// //   final List<Widget> screens = [
// //     MainScreen(), // ✅ شاشة المحتوى الفعلي للـ Home
// //     FavoriteScreen(),
// //     HistoryScreen(),
// //     ProfileScreen(),
// //     CartScreen()
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => BottomNavCubit(),
// //       child: BlocBuilder<BottomNavCubit, int>(
// //         builder: (context, currentIndex) {
// //           return Scaffold(
// //             backgroundColor: Colors.white,
// //             body: screens[currentIndex],
// //             bottomNavigationBar: BottomNavigationBar(
// //               currentIndex: currentIndex,
// //               selectedItemColor: Colors.green,
// //               unselectedItemColor: Colors.grey,
// //               onTap: (index) {
// //                 context.read<BottomNavCubit>().changeTab(index);
// //               },
// //               items: [
// //                 BottomNavigationBarItem(
// //                     icon: Icon(Icons.home),
// //                     label: "Home"),
// //                 BottomNavigationBarItem(
// //                     icon: Icon(Icons.favorite),
// //                     label: "Favorites"),
// //                 BottomNavigationBarItem(
// //                     icon: Icon(Icons.history),
// //                     label: "History"),
// //                 BottomNavigationBarItem(
// //                     icon: Icon(Icons.person),
// //                     label: "Profile"),
// //                 BottomNavigationBarItem(
// //                     icon: Icon(
// //                         Icons.shopping_cart_outlined
// //                     ),
// //                         label: "Cart")
// //
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:foodtek/view/screens/cart_screen.dart';
// // import 'package:foodtek/cubit/botten_nav_cubit.dart';
// // import 'package:foodtek/view/screens/favorite_screen.dart';
// // import 'package:foodtek/view/screens/history_screen.dart';
// // import 'package:foodtek/view/screens/main_screen.dart';
// // import 'package:foodtek/view/screens/profile%20screen.dart';
// //
// // class HomeScreen extends StatelessWidget {
// //   final List<String> categories = ["All", "Burger", "Pizza", "Sandwich"];
// //
// //   final List<Widget> screens = [
// //     MainScreen(), // ✅ شاشة المحتوى الفعلي للـ Home
// //     FavoriteScreen(favoriteProducts: [],),
// //     HistoryScreen(),
// //     ProfileScreen(),
// //     CartScreen()
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => BottomNavCubit(),
// //       child: BlocBuilder<BottomNavCubit, int>(
// //         builder: (context, currentIndex) {
// //           return Scaffold(
// //             backgroundColor: Colors.white,
// //             body: screens[currentIndex],
// //             floatingActionButton: FloatingActionButton(
// //               onPressed: () {
// //                 context.read<BottomNavCubit>().changeTab(4); // الانتقال إلى صفحة السلة
// //               },
// //               backgroundColor: Colors.green,
// //               child: Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 30),
// //               shape: CircleBorder(),
// //
// //             ),
// //             floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //             bottomNavigationBar: BottomAppBar(
// //
// //               shape: CircularNotchedRectangle(),
// //               notchMargin: 4.0,
// //               color: Colors.green[100], // لون الخلفية
// //               child: Row(
// //
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
// //                   _buildNavItem(context, Icons.favorite_outline, "Favorites", 1, currentIndex),
// //                   SizedBox(width: 48), // مسافة لزر المنتصف
// //                   _buildNavItem(context, Icons.history, "History", 2, currentIndex),
// //                   _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
// //     return GestureDetector(
// //       onTap: () {
// //         context.read<BottomNavCubit>().changeTab(index);
// //       },
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Icon(icon, color: currentIndex == index ? Colors.green : Colors.black54, size: 28),
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: currentIndex == index ? Colors.green : Colors.black54,
// //               fontSize: 12,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/view/screens/cart_screen.dart';
// import 'package:foodtek/cubit/botten_nav_cubit.dart';
// import 'package:foodtek/view/screens/favorite_screen.dart';
// import 'package:foodtek/view/screens/history_screen.dart';
// import 'package:foodtek/view/screens/main_screen.dart';
// import 'package:foodtek/view/screens/profile%20screen.dart';
//
// import 'cubit/favorite_products_cubit.dart';
// import 'model/product.dart';
//
// // class HomeScreen extends StatelessWidget {
// //   final List<String> categories = ["All", "Burger", "Pizza", "Sandwich"];
// //
// //   final List<Widget> screens = [
// //     MainScreen(), // ✅ شاشة المحتوى الفعلي للـ Home
// //     FavoriteScreen(favoriteProducts: []), // شاشة المفضلة
// //     HistoryScreen(),
// //     ProfileScreen(),
// //     CartScreen()
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => BottomNavCubit(),
// //       child: BlocBuilder<BottomNavCubit, int>(
// //         builder: (context, currentIndex) {
// //           return Scaffold(
// //             backgroundColor: Colors.white,
// //             body: screens[currentIndex],
// //             floatingActionButton: FloatingActionButton(
// //               onPressed: () {
// //                 context.read<BottomNavCubit>().changeTab(4); // الانتقال إلى صفحة السلة
// //               },
// //               backgroundColor: Colors.green,
// //               child: Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 30),
// //               shape: CircleBorder(),
// //             ),
// //             floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //             bottomNavigationBar: BottomAppBar(
// //               shape: CircularNotchedRectangle(),
// //               notchMargin: 4.0,
// //               color: Colors.green[100], // لون الخلفية
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
// //                   _buildNavItem(context, Icons.favorite_outline, "Favorites", 1, currentIndex),
// //                   SizedBox(width: 48), // مسافة لزر المنتصف
// //                   _buildNavItem(context, Icons.history, "History", 2, currentIndex),
// //                   _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
// //     return GestureDetector(
// //       onTap: () {
// //         context.read<BottomNavCubit>().changeTab(index);
// //       },
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Icon(icon, color: currentIndex == index ? Colors.green : Colors.black54, size: 28),
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: currentIndex == index ? Colors.green : Colors.black54,
// //               fontSize: 12,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // class HomeScreen extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocProvider(
// //       create: (_) => BottomNavCubit(),
// //       child: BlocBuilder<BottomNavCubit, int>(
// //         builder: (context, currentIndex) {
// //           return Scaffold(
// //             backgroundColor: Colors.white,
// //             body: _buildScreen(context, currentIndex),
// //             floatingActionButton: FloatingActionButton(
// //               onPressed: () {
// //                 context.read<BottomNavCubit>().changeTab(4); // الانتقال إلى صفحة السلة
// //               },
// //               backgroundColor: Colors.green,
// //               child: Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 30),
// //               shape: CircleBorder(),
// //             ),
// //             floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// //             bottomNavigationBar: BottomAppBar(
// //               shape: CircularNotchedRectangle(),
// //               notchMargin: 4.0,
// //               color: Colors.green[100],
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                 children: [
// //                   _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
// //                   _buildNavItem(context, Icons.favorite_outline, "Favorites", 1, currentIndex),
// //                   SizedBox(width: 48),
// //                   _buildNavItem(context, Icons.history, "History", 2, currentIndex),
// //                   _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
// //                 ],
// //               ),
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// //
// //   Widget _buildScreen(BuildContext context, int currentIndex) {
// //     switch (currentIndex) {
// //       case 0:
// //         return MainScreen();
// //       case 1:
// //       // استخدام BlocProvider لتمرير حالة المفضلة إلى FavoriteScreen
// //         return BlocBuilder<FavoriteProductsCubit, List<Product>>(
// //           builder: (context, favoriteProducts) {
// //             return FavoriteScreen(favoriteProducts: favoriteProducts);
// //           },
// //         );
// //       case 2:
// //         return HistoryScreen();
// //       case 3:
// //         return ProfileScreen();
// //       default:
// //         return MainScreen();
// //     }
// //   }
// //
// //   Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
// //     return GestureDetector(
// //       onTap: () {
// //         context.read<BottomNavCubit>().changeTab(index);
// //       },
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Icon(icon, color: currentIndex == index ? Colors.green : Colors.black54, size: 28),
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: currentIndex == index ? Colors.green : Colors.black54,
// //               fontSize: 12,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => BottomNavCubit(),
//       child: BlocProvider<FavoriteProductsCubit>( // إضافة هذه السطر
//         create: (_) => FavoriteProductsCubit(),
//         child: BlocBuilder<BottomNavCubit, int>(
//           builder: (context, currentIndex) {
//             return Scaffold(
//               backgroundColor: Colors.white,
//               body: _buildScreen(context, currentIndex),
//               floatingActionButton: FloatingActionButton(
//                 onPressed: () {
//                   context.read<BottomNavCubit>().changeTab(4); // الانتقال إلى صفحة السلة
//                 },
//                 backgroundColor: Colors.green,
//                 child: Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 30),
//                 shape: CircleBorder(),
//               ),
//               floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//               bottomNavigationBar: BottomAppBar(
//                 shape: CircularNotchedRectangle(),
//                 notchMargin: 4.0,
//                 color: Colors.green[100],
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
//                     _buildNavItem(context, Icons.favorite_outline, "Favorites", 1, currentIndex),
//                     SizedBox(width: 48),
//                     _buildNavItem(context, Icons.history, "History", 2, currentIndex),
//                     _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget _buildScreen(BuildContext context, int currentIndex) {
//     switch (currentIndex) {
//       case 0:
//         return MainScreen();
//       case 1:
//         return BlocBuilder<FavoriteProductsCubit, List<Product>>(
//           builder: (context, favoriteProducts) {
//             return FavoriteScreen();
//           },
//         );
//       case 2:
//         return HistoryScreen();
//       case 3:
//         return ProfileScreen();
//       default:
//         return MainScreen();
//     }
//   }
//
//   Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
//     return GestureDetector(
//       onTap: () {
//         context.read<BottomNavCubit>().changeTab(index);
//       },
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(icon, color: currentIndex == index ? Colors.green : Colors.black54, size: 28),
//           Text(
//             label,
//             style: TextStyle(
//               color: currentIndex == index ? Colors.green : Colors.black54,
//               fontSize: 12,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/favorite_products_cubit.dart';
import 'package:foodtek/model/product.dart';
import 'package:foodtek/view/screens/cart_screen.dart';
import 'package:foodtek/view/screens/favorite_screen.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:foodtek/view/screens/main_screen.dart';
import 'package:foodtek/view/screens/profile%20screen.dart';

import 'cubit/botten_nav_cubit.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => FavoriteProductsCubit()),
      ],
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: _buildScreen(context, currentIndex),
            floatingActionButton: _buildCartButton(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: _buildBottomAppBar(context, currentIndex),
          );
        },
      ),
    );
  }

  Widget _buildScreen(BuildContext context, int currentIndex) {
    switch (currentIndex) {
      case 0:
        return MainScreen();
      case 1:
        return BlocBuilder<FavoriteProductsCubit, List<Product>>(
          builder: (context, favoriteProducts) {
            return FavoriteScreen(favoriteProducts: favoriteProducts);
          },
        );
      case 2:
        return HistoryTab();
      case 3:
        return ProfileScreen();
      case 4:
        return CartScreen(); // تمت إضافة حالة لشاشة السلة

      default:
        return MainScreen();
    }
  }

  Widget _buildCartButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<BottomNavCubit>().changeTab(4); // الانتقال إلى صفحة السلة
      },
      backgroundColor: Colors.green,
      child: const Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 30),
      shape: const CircleBorder(),
    );
  }

  Widget _buildBottomAppBar(BuildContext context, int currentIndex) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: Colors.green[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
          _buildNavItem(context, Icons.favorite_outline, "Favorites", 1, currentIndex),
          const SizedBox(width: 48), // مساحة للزر العائم
          _buildNavItem(context, Icons.history, "History", 2, currentIndex),
          _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
    return GestureDetector(
      onTap: () => _handleNavItemTap(context, index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.green : Colors.black54,
            size: 28,
          ),
          Text(
            label,
            style: TextStyle(
              color: currentIndex == index ? Colors.green : Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _handleNavItemTap(BuildContext context, int index) {
    context.read<BottomNavCubit>().changeTab(index);

    // يمكنك إضافة منطق إضافي هنا إذا لزم الأمر
    if (index == 4) {
      // إذا كانت الصفحة المطلوبة هي صفحة السلة
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen()),
      );
    }
  }
}