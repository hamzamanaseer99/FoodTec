import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/home_cubit.dart';
import 'package:foodtek/view/screens/widgets/category_bar.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/recommended_products.dart';
import 'package:foodtek/view/screens/widgets/search_widget.dart';
import 'allscreen.dart';
import 'burger_screen.dart';
import 'pizza_screen.dart';
import 'sandwich_screen.dart';
//
// class MainScreen extends StatelessWidget {
//   final List<Map<String, String>> categories = [
//     {"name": "All"},
//     {"name": "Burger", "image": "assets/images/b.png"},
//     {"name": "Pizza", "image": "assets/images/p.png"},
//     {"name": "Sandwich", "image": "assets/images/s.png"},
//   ];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => HomeCubit(),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: _buildLocationIcon(),
//           title: _buildLocationTitle(),
//           actions: [NotificationIcon()],
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//
//               child: SearchWidget(),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
//               child: BlocBuilder<HomeCubit, HomeState>(
//                 builder: (context, state) {
//                   final selectedCategory = state is HomeCategorySelected
//                       ? state.category
//                       : "All";
//
//                   return CategoryBar(
//                     categories: categories,
//                     onCategorySelected: (category) {
//                       context.read<HomeCubit>().selectCategory(category);
//                     },
//                     selectedCategory: selectedCategory,
//                   );
//                 },
//               ),
//             ),
//             // محتوى متغير حسب الفئة
//             Expanded(
//               child: BlocBuilder<HomeCubit, HomeState>(
//                 builder: (context, state) {
//                   final selectedCategory = state is HomeCategorySelected
//                       ? state.category
//                       : "All";
//
//                   return _buildCategoryContent(selectedCategory);
//                 },
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// التبديل بين الشاشات
//   Widget _buildCategoryContent(String category) {
//     switch (category) {
//       case "Burger":
//         return BurgerScreen();
//       case "Pizza":
//         return PizzaScreen();
//       case "Sandwich":
//         return SandwichScreen();
//       case "All":
//       default:
//         return AllScreen();
//     }
//   }
//
//   Widget _buildLocationIcon() {
//     return Container(
//       margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         color: Color(0xff4FAF5A).withOpacity(0.1),
//       ),
//       child: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
//     );
//   }
//
//   Widget _buildLocationTitle() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Current location", style: TextStyle(fontSize: 12, color: Color(0xff606060))),
//         SizedBox(height: 4),
//         Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//       ],
//     );
//   }
// }
class MainScreen extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {"name": "All"},
    {"name": "Burger", "image": "assets/images/b.png"},
    {"name": "Pizza", "image": "assets/images/p.png"},
    {"name": "Sandwich", "image": "assets/images/s.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: theme.colorScheme.background, // ✅ ديناميكي حسب الثيم
        appBar: AppBar(
          backgroundColor: theme.colorScheme.background,
          elevation: 0,
          leading: _buildLocationIcon(theme),
          title: _buildLocationTitle(theme),
          actions: [NotificationIcon()],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: SearchWidget(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final selectedCategory = state is HomeCategorySelected
                      ? state.category
                      : "All".tr();

                  return CategoryBar(
                    categories: categories,
                    onCategorySelected: (category) {
                      context.read<HomeCubit>().selectCategory(category);
                    },
                    selectedCategory: selectedCategory,
                  );
                },
              ),
            ),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  final selectedCategory = state is HomeCategorySelected
                      ? state.category
                      : "All".tr();

                  return _buildCategoryContent(selectedCategory);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContent(String category) {
    switch (category) {
      case "Burger":
        return BurgerScreen();
      case "Pizza":
        return PizzaScreen();
      case "Sandwich":
        return SandwichScreen();
      case "All":
      default:
        return AllScreen();
    }
  }

  Widget _buildLocationIcon(ThemeData theme) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: theme.primaryColor.withOpacity(0.1), // ✅ استخدام primary
      ),
      child: Icon(Icons.location_on, color: theme.primaryColor),
    );
  }

  Widget _buildLocationTitle(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Current location",
          style: TextStyle(
            fontSize: 12,
            color: theme.textTheme.bodySmall!.color,
          ),
        ),

        SizedBox(height: 4),
        Text(
          "Jl. Soekarno Hatta 15A...",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: theme.textTheme.bodyLarge!.color,
          ),
        ),
      ],
    );
  }
}
