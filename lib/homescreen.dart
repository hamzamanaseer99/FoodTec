import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/favorite_products_cubit.dart';
import 'package:foodtek/model/product.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/cart_screen.dart';
import 'package:foodtek/view/screens/favorite_screen.dart';
import 'package:foodtek/view/screens/history_screen.dart';
import 'package:foodtek/view/screens/main_screen.dart';
import 'package:foodtek/view/screens/profile%20screen.dart';
import 'package:foodtek/view/screens/order_details_screen.dart'; // استيراد شاشة تفاصيل الطلب
import 'cubit/botten_nav_cubit.dart';
import 'model/user_location.dart';

class HomeScreen extends StatelessWidget {
  late final UserLocation? userLocation;

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(

      providers: [
        BlocProvider(create: (_) => BottomNavCubit()),
        BlocProvider(create: (_) => FavoriteProductsCubit()),
      ],
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          final isDark = Theme.of(context).brightness == Brightness.dark;
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: _buildScreen(context, currentIndex),
            floatingActionButton: _buildCartButton(context),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: _buildBottomAppBar(context, currentIndex, isDark),
          );
        },
      ),
    );
  }

  // عرض الشاشة بناءً على التحديد
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
        return CartScreen(); // شاشة السلة
      case 5:
        return OrderDetailsScreen(); // شاشة تفاصيل الطلب
      default:
        return MainScreen(); // شاشة افتراضية
    }
  }

  // زر السلة العائم
  Widget _buildCartButton(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final iconColor = Colors.white; // اللون الأبيض للأيقونة
    final buttonColor = Color(0xFF25AE4B); // اللون الأخضر للزر العائم

    return FloatingActionButton(
      onPressed: () {
        context.read<BottomNavCubit>().changeTab(4);
      },
      backgroundColor: buttonColor, // الخلفية تكون خضراء
      child: Icon(
        Icons.shopping_cart_outlined,
        color: iconColor, // الأيقونة تكون باللون الأبيض
        size: 30,
      ),
      shape: const CircleBorder(),
    );
  }

  // Bottom App Bar ثابت في أسفل الشاشة
  Widget _buildBottomAppBar(BuildContext context, int currentIndex, bool isDark) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 4.0,
      color: isDark ? Colors.green[100]?.withOpacity(0.5): Colors.green[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, Icons.home_outlined, "Home".tr(), 0, currentIndex),
          _buildNavItem(context, Icons.favorite_outline, "Favorites".tr(), 1, currentIndex),
          const SizedBox(width: 48), // مساحة للزر العائم
          _buildNavItem(context, Icons.history, "History".tr(), 2, currentIndex),
          _buildNavItem(context, Icons.person_outline_outlined, "Profile".tr(), 3, currentIndex),
        ],
      ),
    );
  }

  // بناء كل عنصر من عناصر الـ BottomNavigationBar
  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex) {
    return GestureDetector(
      onTap: () => _handleNavItemTap(context, index), // استدعاء التنقل عند النقر
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: currentIndex == index ? Colors.green : Colors.black54,
            size: 28,
          ),
          Text(
            label.tr(),
            style: TextStyle(
              color: currentIndex == index ? Colors.green : Colors.black54,
              fontSize: responsiveWidth(context, 12),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // منطق التبديل بين الشاشات بناءً على الضغط
  void _handleNavItemTap(BuildContext context, int index) {
    context.read<BottomNavCubit>().changeTab(index); // تغيير الفهرس

    // يمكنك إضافة منطق إضافي هنا إذا لزم الأمر
    if (index == 4) {
      context.read<BottomNavCubit>().changeTab(4);
    }
  }
}