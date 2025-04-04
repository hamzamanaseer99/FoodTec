// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/home_cubit.dart';
//
// class TopRatedProducts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     return SizedBox(
//       height: 209,
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           List<Map<String, dynamic>> displayProducts = context.read<HomeCubit>().allProducts;
//
//           if (state is HomeSearchResults) {
//             displayProducts = state.filteredProducts;
//           } else if (state is HomeCategorySelected) {
//             displayProducts = context.read<HomeCubit>().filterProductsByCategory(state.category);
//           }
//
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: displayProducts.length,
//             itemBuilder: (context, index) {
//               final product = displayProducts[index];
//               return _buildProductCard(screenWidth, product);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildProductCard(double screenWidth, Map<String, dynamic> product) {
//     return SizedBox(
//       width: 155,
//       child: Card(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//           side: BorderSide(color: Color(0xffDBF4D1)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 12, top: 8),
//               child: Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.orange, size: 16),
//                   SizedBox(width: screenWidth * 0.013),
//                   Text(product["rating"].toString(), style: TextStyle(fontSize: screenWidth * 0.040)),
//                 ],
//               ),
//             ),
//             SizedBox(height: 4),
//             _buildProductImage(product),
//             _buildProductDetails(screenWidth, product),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProductImage(Map<String, dynamic> product) {
//     return Container(
//       height: 50,
//       width: double.infinity,
//       decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
//       child: ClipRRect(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//         child: Image.asset(product["image"], fit: BoxFit.contain),
//       ),
//     );
//   }
//
//   Widget _buildProductDetails(double screenWidth, Map<String, dynamic> product) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(product["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.035)),
//           Text(
//             '100 gr chicken + tomato + cheese  Lettuce',
//             style: TextStyle(fontSize: screenWidth * 0.028, color: Color(0xff3B3B3B)),
//           ),
//           SizedBox(height: 4),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("\$${product["price"]}", style: TextStyle(color: Color(0xff25AE4B), fontSize: screenWidth * 0.030)),
//               _buildAddButton(screenWidth),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAddButton(double screenWidth) {
//     return Container(
//       decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff25AE4B)),
//       child: IconButton(
//         onPressed: () {},
//         icon: Icon(Icons.add, size: screenWidth * 0.04, color: Colors.white),
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/home_cubit.dart';
//
// class TopRatedProducts extends StatelessWidget {
//   @override
//   final String? filter;
//
//   const TopRatedProducts({this.filter, Key? key}) : super(key: key);
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//
//     return SizedBox(
//       height: 230, // زيادة ارتفاع العنوان لتناسب العناصر بشكل أفضل
//       child: BlocBuilder<HomeCubit, HomeState>(
//         builder: (context, state) {
//           List<Map<String, dynamic>> displayProducts = context.read<HomeCubit>().allProducts;
//
//           if (state is HomeSearchResults) {
//             displayProducts = state.filteredProducts;
//           } else if (state is HomeCategorySelected) {
//             displayProducts = context.read<HomeCubit>().filterProductsByCategory(state.category);
//           }
//
//           return ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: displayProducts.length,
//             itemBuilder: (context, index) {
//               final product = displayProducts[index];
//               return _buildProductCard(screenWidth, product);
//             },
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildProductCard(double screenWidth, Map<String, dynamic> product) {
//     return SizedBox(
//       width: 170,
//
//       // زيادة عرض المنتج قليلاً ليكون أكبر
//       child: Card(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(12), // زيادة التدوير لجعل الزوايا أنعم
//           side: BorderSide(color: Color(0xffDBF4D1)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 14, top: 10),
//               child: Row(
//                 children: [
//                   Icon(Icons.star, color: Colors.orange, size: 18), // زيادة حجم الأيقونة
//                   SizedBox(width: screenWidth * 0.015),
//                   Text(product["rating"].toString(), style: TextStyle(fontSize: screenWidth * 0.045)), // تعديل حجم النص
//                 ],
//               ),
//             ),
//             SizedBox(height: 6), // زيادة المسافة بين الصورة والتفاصيل
//             _buildProductImage(product),
//             _buildProductDetails(screenWidth, product),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProductImage(Map<String, dynamic> product) {
//     return Container(
//       height: 60, // زيادة ارتفاع الصورة لتحسين العرض
//       width: double.infinity,
//       decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
//       child: ClipRRect(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//         child: Image.asset(product["image"], fit: BoxFit.contain),
//       ),
//     );
//   }
//
//   Widget _buildProductDetails(double screenWidth, Map<String, dynamic> product) {
//     return Padding(
//       padding: const EdgeInsets.all(10), // زيادة الهوامش لتوسيع المساحة
//
//       child: Column(
//
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(product["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.040)), // تعديل حجم النص
//           Text(
//             '100 gr chicken + tomato + cheese Lettuce',
//             style: TextStyle(fontSize: screenWidth * 0.030, color: Color(0xff3B3B3B)),
//           ),
//           SizedBox(height: 6),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("\$${product["price"]}", style: TextStyle(color: Color(0xff25AE4B), fontSize: screenWidth * 0.035)), // تعديل حجم النص
//               _buildAddButton(screenWidth),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildAddButton(double screenWidth) {
//     return Container(
//       width: 30, // تصغير الدائرة أكثر
//       height: 30, // تصغير الدائرة أكثر
//       decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff25AE4B)),
//       child: Center( // استخدام Center لضمان تموضع الأيقونة في المنتصف
//         child: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.add, size: screenWidth * 0.035, color: Colors.white), // تصغير حجم الأيقونة
//         ),
//       ),
//     );
//
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/top_rated_cubit.dart';

class TopRatedProducts extends StatelessWidget {
  const TopRatedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => TopRatedCubit(),
      child: SizedBox(
        height: 230,
        child: BlocBuilder<TopRatedCubit, TopRatedState>(
          builder: (context, state) {
            if (state is TopRatedLoaded) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return _buildProductCard(screenWidth, product);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(double screenWidth, Map<String, dynamic> product) {
    return SizedBox(
      width: 170,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Color(0xffDBF4D1)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 10),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  SizedBox(width: screenWidth * 0.015),
                  Text(product["rating"].toString(), style: TextStyle(fontSize: screenWidth * 0.045)),
                ],
              ),
            ),
            SizedBox(height: 6),
            _buildProductImage(product),
            _buildProductDetails(screenWidth, product),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Map<String, dynamic> product) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        child: Image.asset(product["image"], fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildProductDetails(double screenWidth, Map<String, dynamic> product) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product["name"], style: TextStyle(fontWeight: FontWeight.bold, fontSize: screenWidth * 0.040)),
          Text(
            '100 gr chicken + tomato + cheese Lettuce',
            style: TextStyle(fontSize: screenWidth * 0.030, color: Color(0xff3B3B3B)),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${product["price"]}", style: TextStyle(color: Color(0xff25AE4B), fontSize: screenWidth * 0.035)),
              _buildAddButton(screenWidth),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(double screenWidth) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xff25AE4B)),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(Icons.add, size: screenWidth * 0.035, color: Colors.white),
        ),
      ),
    );
  }
}
