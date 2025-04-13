import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/botten_nav_cubit.dart';

class MainLayout extends StatelessWidget {
  final Widget body;

  const MainLayout({required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<BottomNavCubit>().changeTab(4);
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.shopping_cart_rounded, color: Colors.white, size: 30),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        color: Colors.green[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home_outlined, "Home", 0),
            _buildNavItem(context, Icons.favorite_outline, "Favorites", 1),
            SizedBox(width: 48),
            _buildNavItem(context, Icons.history, "History", 2),
            _buildNavItem(context, Icons.person_outline_outlined, "Profile", 3),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index) {
    final currentIndex = context.watch<BottomNavCubit>().state;
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
