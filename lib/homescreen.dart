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
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                context.read<BottomNavCubit>().changeTab(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "Favorites"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.history),
                    label: "History"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: "Profile"),
                BottomNavigationBarItem(
                    icon: Icon(
                        Icons.shopping_cart_outlined
                    ),
                        label: "Cart")

              ],
            ),
          );
        },
      ),
    );
  }
}
