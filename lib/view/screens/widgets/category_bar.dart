// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/home_cubit.dart';
// import 'package:foodtek/view/screens/burger_screen.dart';
// import 'package:foodtek/view/screens/sandwich_screen.dart';
//
// class CategoryBar extends StatelessWidget {
//   final List<String> categories;
//
//   CategoryBar({required this.categories});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         final selectedCategory = state is HomeCategorySelected ? state.category : "All";
//
//         return Container(
//           height: 50,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: categories.length,
//             itemBuilder: (context, index) {
//               final category = categories[index];
//
//               return Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: ChoiceChip(
//                   label: Text(category),
//                   selected: category == selectedCategory,
//                   selectedColor: Colors.green,
//                   labelStyle: TextStyle(
//                     color: category == selectedCategory ? Colors.white : Colors.black,
//                   ),
//                   onSelected: (_) => _onCategorySelected(context, category),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   void _onCategorySelected(BuildContext context, String category) {
//     if (category == "Burger") {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => BurgerScreen()));
//     } else if (category == "Pizza") {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => PizzaScreen()));
//     } else if (category == "Sandwich") {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => SandwichScreen()));
//     } else {
//       context.read<HomeCubit>().selectCategory(category);
//     }
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/home_cubit.dart';
// import 'package:foodtek/view/screens/burger_screen.dart';
// import 'package:foodtek/view/screens/pizza_screen.dart';
// import 'package:foodtek/view/screens/sandwich_screen.dart';
//
// class CategoryBar extends StatelessWidget {
//   final List<Map<String, String>> categories;
//
//   CategoryBar({required this.categories});
//
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         final selectedCategory = state is HomeCategorySelected
//             ? state.category
//             : "All";
//
//         return Container(
//           height: 50,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: categories.length,
//             itemBuilder: (context, index) {
//               final category = categories[index];
//               final isSelected = category["name"] == selectedCategory;
//
//               return Padding(
//                 padding: const EdgeInsets.only(right: 20),
//                 child: GestureDetector(
//                   onTap: () => _onCategorySelected(context, category["name"]!),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: isSelected ? Colors.green : Colors.white,
//                       border: Border.all(
//                         color: isSelected ? Colors.green : Colors.grey[300]!,
//                         width: 1,
//                       ),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//                     child: Row(
//                       children: [
//                         if (category["image"] != null)
//                           Padding(
//                             padding: const EdgeInsets.only(right: 8),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                 category["image"]!,
//                                 width: 20,
//                                 height: 20,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (_, __, ___) => SizedBox.shrink(),
//                               ),
//                             ),
//                           ),
//                         Text(
//                           category["name"]!,
//                           style: TextStyle(
//                             fontSize: screenWidth * 0.035,
//                             fontWeight: FontWeight.w600,
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
//
//   void _onCategorySelected(BuildContext context, String category) {
//     if (category == "Burger") {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => BurgerScreen()));
//     } else if (category == "Pizza") {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => PizzaScreen()));
//     } else if (category == "Sandwich") {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => SandwichScreen()));
//     } else {
//       context.read<HomeCubit>().selectCategory(category);
//     }
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/home_cubit.dart';
// import 'package:foodtek/view/screens/burger_screen.dart';
// import 'package:foodtek/view/screens/pizza_screen.dart';
// import 'package:foodtek/view/screens/sandwich_screen.dart';
// class CategoryBar extends StatelessWidget {
//   final List<Map<String, String>> categories;
//   final Function(String) onCategorySelected;  // دالة اختيار الفئة
//
//   CategoryBar({
//     required this.categories,
//     required this.onCategorySelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         final selectedCategory = state is HomeCategorySelected
//             ? state.category
//             : "All";  // الفئة الافتراضية هي "All"
//
//         return SizedBox(
//           height: 50,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: categories.length,
//             itemBuilder: (context, index) {
//               final category = categories[index];
//               final isSelected = category["name"] == selectedCategory;
//
//               return Padding(
//                 padding: const EdgeInsets.only(right: 15),
//                 child: GestureDetector(
//                   onTap: () {
//                     onCategorySelected(category["name"]!);  // استدعاء الدالة عند الضغط
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: isSelected ? Color(0xff4FAF5A) : Colors.white,
//                       border: Border.all(
//                         color: isSelected ? Color(0xff4FAF5A) : Colors.grey[300]!,
//                         width: 1,
//                       ),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                     child: Row(
//                       children: [
//                         if (category["image"] != null)
//                           Padding(
//                             padding: const EdgeInsets.only(right: 8),
//                             child: ClipRRect(
//                               borderRadius: BorderRadius.circular(10),
//                               child: Image.asset(
//                                 category["image"]!,
//                                 width: 20,
//                                 height: 20,
//                                 fit: BoxFit.cover,
//                                 errorBuilder: (_, __, ___) => SizedBox.shrink(),
//                               ),
//                             ),
//                           ),
//                         Text(
//                           category["name"]!,
//                           style: TextStyle(
//                             fontSize: screenWidth * 0.035,
//                             fontWeight: FontWeight.w600,
//                             color: isSelected ? Colors.white : Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/home_cubit.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/burger_screen.dart';
import 'package:foodtek/view/screens/pizza_screen.dart';
import 'package:foodtek/view/screens/sandwich_screen.dart';
class CategoryBar extends StatelessWidget {
  final List<Map<String, String>> categories;
  final ValueChanged<String> onCategorySelected;

  CategoryBar({required this.categories, required this.onCategorySelected, required String selectedCategory});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final selectedCategory = state is HomeCategorySelected
            ? state.category
            : "All"; // الخيار الافتراضي هو "All"

        return SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category["name"] == selectedCategory;

              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: GestureDetector(
                  onTap: () {
                    debugPrint('Selected Category: ${category["name"]}'); // إضافة للتتبع
                    onCategorySelected(category["name"]!); // إرسال الفئة المختارة
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isSelected ? Color(0xff4FAF5A) : Colors.white,
                      border: Border.all(
                        color: isSelected ? Color(0xff4FAF5A) : Colors.grey[300]!,
                        width: 1,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        if (category["image"] != null)
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                category["image"]!,
                                width: responsiveWidth(context, 20),
                                height: responsiveHeight(context, 20),
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => SizedBox.shrink(),
                              ),
                            ),
                          ),
                        Text(
                          category["name"]!.tr(),
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
