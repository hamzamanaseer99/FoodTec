import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/cart_screen.dart';
import 'package:foodtek/view/screens/favorite_screen.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:foodtek/homescreen.dart';
import 'package:foodtek/view/screens/profile%20screen.dart';


class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // تبدأ الشاشة الأولى "Home"

  // تغيير الشاشة عند النقر على العنصر
  void changeTab(int index) {
    emit(index);
  }

  // إرجاع الشاشة المناسبة بناءً على المؤشر الحالي
  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return FavoriteScreen(favoriteProducts: [],);
      case 2:
        return HistoryTab();
      case 3:
        return ProfileScreen();
      case 4:
        return CartScreen();
      default:
        return HomeScreen();
    }
  }
}
