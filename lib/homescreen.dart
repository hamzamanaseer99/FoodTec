// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/view/screens/cart_screen.dart';
// import 'package:foodtek/cubit/botten_nav_cubit.dart';
// import 'package:foodtek/view/screens/favorite_screen.dart';
// import 'package:foodtek/view/screens/history_screen.dart';
// import 'package:foodtek/view/screens/main_screen.dart';
// import 'package:foodtek/view/screens/profile%20screen.dart';
//
//
// class HomeScreen extends StatelessWidget {
//   final List<String> categories = ["All", "Burger", "Pizza", "Sandwich"];
//
//   final List<Widget> screens = [
//     MainScreen(), // ✅ شاشة المحتوى الفعلي للـ Home
//     FavoriteScreen(),
//     HistoryScreen(),
//     ProfileScreen(),
//     CartScreen()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => BottomNavCubit(),
//       child: BlocBuilder<BottomNavCubit, int>(
//         builder: (context, currentIndex) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: screens[currentIndex],
//             bottomNavigationBar: BottomNavigationBar(
//               currentIndex: currentIndex,
//               selectedItemColor: Colors.green,
//               unselectedItemColor: Colors.grey,
//               onTap: (index) {
//                 context.read<BottomNavCubit>().changeTab(index);
//               },
//               items: [
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.home),
//                     label: "Home"),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.favorite),
//                     label: "Favorites"),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.history),
//                     label: "History"),
//                 BottomNavigationBarItem(
//                     icon: Icon(Icons.person),
//                     label: "Profile"),
//                 BottomNavigationBarItem(
//                     icon: Icon(
//                         Icons.shopping_cart_outlined
//                     ),
//                         label: "Cart")
//
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screens/cart_screen.dart';
import 'package:foodtek/cubit/botten_nav_cubit.dart';
import 'package:foodtek/view/screens/favorite_screen.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:foodtek/view/screens/main_screen.dart';
import 'package:foodtek/view/screens/profile%20screen.dart';

class HomeScreen extends StatelessWidget {
  final List<String> categories = ["All", "Burger", "Pizza", "Sandwich"];

  final List<Widget> screens = [
    MainScreen(), // ✅ شاشة المحتوى الفعلي للـ Home
    FavoriteScreen(),
    HistoryScreen(),
    ProfileScreen(),
    CartScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavCubit(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: screens[currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<BottomNavCubit>().changeTab(4); // الانتقال إلى صفحة السلة
              },
              backgroundColor: Colors.green,
              child: Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 30),
              shape: CircleBorder(),

            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(

              shape: CircularNotchedRectangle(),
              notchMargin: 4.0,
              color: Colors.green[100], // لون الخلفية
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(context, Icons.home_outlined, "Home", 0, currentIndex),
                  _buildNavItem(context, Icons.favorite_outline, "Favorites", 1, currentIndex),
                  SizedBox(width: 48), // مسافة لزر المنتصف
                  _buildNavItem(context, Icons.history, "History", 2, currentIndex),
                  _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3, currentIndex),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
    return GestureDetector(
      onTap: () {
        context.read<BottomNavCubit>().changeTab(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: currentIndex == index ? Colors.green : Colors.black54, size: 28),
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
}
