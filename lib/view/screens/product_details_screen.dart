import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/homescreen.dart';
import 'package:foodtek/model/product.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/cart_screen.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/search_widget.dart';
import 'package:foodtek/view/screens/widgets/selector_widget.dart';
import 'package:foodtek/view/screens/widgets/spicy_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double spicyLevel = 0.0;
  int quantity = 1;

  @override
  // Widget build(BuildContext context) {
  //   final product = widget.product;
  //
  //   return Scaffold(
  //     backgroundColor: Colors.white,
  //     appBar: AppBar(
  //       backgroundColor: Colors.white,
  //       elevation: 0,
  //       leading: _buildLocationIcon(),
  //       title: _buildLocationTitle(),
  //       actions: [NotificationIcon()],
  //     ),
  //     body: Column(
  //       children: [
  //         Expanded(
  //           child: SingleChildScrollView(
  //             padding: const EdgeInsets.only(left: 30, right: 30, top: 22),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SearchWidget(),
  //                  SizedBox(height: responsiveHeight(context, 30)),
  //                 // Product image
  //                 Container(
  //                   height: 203,
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     image:  DecorationImage(
  //                       image: AssetImage(product.image),
  //                       fit: BoxFit.cover,
  //                     ),
  //                   ),
  //                   clipBehavior: Clip.antiAlias,
  //                 ),
  //                 SizedBox(height: responsiveHeight(context, 24)),
  //                 // Product name and rating
  //                 Text(product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
  //                 SizedBox(height: responsiveHeight(context, 8)),
  //                 Row(
  //                   children: [
  //                     ...List.generate(4, (_) =>  Icon(Icons.star, color: Colors.amber, size: responsiveWidth(context, 16))),
  //                      Icon(Icons.star_half, color: Colors.amber, size: responsiveWidth(context, 16)),
  //                     SizedBox(width: responsiveWidth(context, 8)),
  //                     Text('4.5 (89 reviews)', style: TextStyle(fontSize: responsiveWidth(context, 14), color: Colors.grey[600])),
  //                   ],
  //                 ),
  //                  SizedBox(height: responsiveHeight(context, 8)),
  //                 Row(
  //                   children: [
  //                     Text("\$${product.price.toStringAsFixed(2)}",
  //                         style: TextStyle(fontSize: responsiveWidth(context, 20), fontWeight: FontWeight.bold, color: Colors.green[800])),
  //                      SizedBox(width: responsiveWidth(context, 8)),
  //                      Text('\$9.5',
  //                         style: TextStyle(fontSize: responsiveWidth(context, 16), color: Colors.grey, decoration: TextDecoration.lineThrough)),
  //                   ],
  //                 ),
  //                 SizedBox(height: responsiveHeight(context, 12)),
  //
  //                 Text(product.description, style:  TextStyle(fontSize: responsiveWidth(context, 16))),
  //                  SizedBox(height: responsiveHeight(context, 24)),
  //                  Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Text('Spicy', style: TextStyle(fontSize: responsiveWidth(context, 16), color: Color(0xff838383), fontWeight: FontWeight.w500)),
  //                     Text('Quantity', style: TextStyle(fontSize: responsiveWidth(context, 16), color: Color(0xff838383), fontWeight: FontWeight.w500)),
  //                   ],
  //                 ),
  //                 SizedBox(height: responsiveHeight(context, 12)),
  //
  //                 // Spicy slider and quantity
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     // Slider to select spicy level
  //                     Expanded(
  //                       child: SpicySlider(
  //                         value: spicyLevel,
  //                         onChanged: (value) {
  //                           setState(() {
  //                             spicyLevel = value;
  //                           });
  //                         },
  //                       ),
  //                     ),
  //                      SizedBox(width: responsiveWidth(context, 16)),
  //                     // Quantity selector
  //                     QuantitySelector(
  //                       quantity: quantity,
  //                       onIncrease: (newQuantity) {
  //                         setState(() {
  //                           quantity = newQuantity;
  //                         });
  //                       },
  //                       onDecrease: (newQuantity) {
  //                         setState(() {
  //                           quantity = newQuantity;
  //                         });
  //                       },
  //                     ),
  //                   ],
  //                 ),
  //                  SizedBox(height: responsiveHeight(context, 24)),
  //
  //               ],
  //             ),
  //           ),
  //         ),
  //
  //         // Add to Cart button
  //         Padding(
  //           padding:  EdgeInsets.symmetric(
  //               horizontal: responsiveWidth(context, 30),
  //               vertical: responsiveHeight(context, 16)),
  //           child: ElevatedButton(
  //             onPressed: () {
  //               // 1. إضافة المنتج إلى السلة
  //               context.read<CartCubit>().addToCart(
  //                 product: product,      // المنتج
  //                 spicyLevel: spicyLevel,   // مستوى البهارات
  //                 quantity: quantity,     // الكمية
  //               );
  //
  //               // 2. عرض تأكيد للمستخدم
  //               ScaffoldMessenger.of(context).showSnackBar(
  //                 SnackBar(
  //                   content: Text("تمت إضافة ${product.name} إلى السلة"),
  //                   duration: Duration(seconds: 2),
  //                   action: SnackBarAction(
  //                     label: 'عرض السلة',
  //                     onPressed: () {
  //                       Navigator.push(
  //                         context,
  //                         MaterialPageRoute(builder: (context) => HomeScreen()),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               );
  //
  //               // 3. الانتقال إلى الشاشة الرئيسية
  //               Navigator.pushAndRemoveUntil(
  //                 context,
  //                 MaterialPageRoute(builder: (context) => HomeScreen()),
  //                     (route) => false,
  //               );
  //             },
  //             style: ElevatedButton.styleFrom(
  //               backgroundColor: Colors.green,
  //               minimumSize: Size(double.infinity, 50),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //             child: Text(
  //               "Add To Cart",
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 18,
  //                 fontWeight: FontWeight.bold,
  //               ),
  //             ),
  //           ),
  //
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xff1B1B1B) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xff1B1B1B) : Colors.white,
        elevation: 0,
        leading: _buildLocationIcon(isDark),
        title: _buildLocationTitle(isDark),
        actions: [NotificationIcon()],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchWidget(),
                  SizedBox(height: responsiveHeight(context, 30)),

                  Container(
                    height: 203,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                  ),

                  SizedBox(height: responsiveHeight(context, 24)),

                  Text(
                    product.name.tr(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 8)),

                  Row(
                    children: [
                      ...List.generate(4, (_) => Icon(Icons.star, color: Colors.amber, size: responsiveWidth(context, 16))),
                      Icon(Icons.star_half, color: Colors.amber, size: responsiveWidth(context, 16)),
                      SizedBox(width: responsiveWidth(context, 8)),
                      Text(
                        '4.5 (89 reviews).'.tr(),
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 14),
                          color: isDark ? Colors.grey[400] : Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: responsiveHeight(context, 8)),

                  Row(
                    children: [
                      Text(
                        "\$${product.price.toStringAsFixed(2)}".tr(),
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 20),
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      SizedBox(width: responsiveWidth(context, 8)),
                      Text(
                        '\$9.5',
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 16),
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: responsiveHeight(context, 12)),

                  Text(
                    product.description.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 16),
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),

                  SizedBox(height: responsiveHeight(context, 24)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Spicy'.tr(),
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 16),
                          color: isDark ? Colors.grey[300] : const Color(0xff838383),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Quantity'.tr(),
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 16),
                          color: isDark ? Colors.grey[300] : const Color(0xff838383),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: responsiveHeight(context, 12)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: SpicySlider(
                          value: spicyLevel,
                          onChanged: (value) {
                            setState(() {
                              spicyLevel = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: responsiveWidth(context, 16)),
                      QuantitySelector(
                        quantity: quantity,
                        onIncrease: (newQuantity) {
                          setState(() {
                            quantity = newQuantity;
                          });
                        },
                        onDecrease: (newQuantity) {
                          setState(() {
                            quantity = newQuantity;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 24)),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(context, 30),
              vertical: responsiveHeight(context, 16),
            ),
            child: ElevatedButton(
              onPressed: () {
                context.read<CartCubit>().addToCart(
                  product: product,
                  spicyLevel: spicyLevel,
                  quantity: quantity,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("تمت إضافة ${product.name.tr()} إلى السلة"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: 'عرض السلة',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                    ),
                  ),
                );

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child:  Text(
                "Add To Cart".tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildLocationIcon() {
  //   return Container(
  //     margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(4),
  //       color: Color(0xff4FAF5A).withOpacity(0.1),
  //     ),
  //     child: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
  //   );
  // }
  //
  // Widget _buildLocationTitle() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text("Current location", style: TextStyle(fontSize: 12, color: Color(0xff606060))),
  //       SizedBox(height: 4),
  //       Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
  //     ],
  //   );
  // }
  Widget _buildLocationIcon(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xff4FAF5A).withOpacity(0.1),
      ),
      child: Icon(Icons.location_on, color: isDark ? Colors.green[300] : const Color(0xff4FAF5A)),
    );
  }

  Widget _buildLocationTitle(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Current location",
          style: TextStyle(fontSize: 12, color: isDark ? Colors.grey[400] : const Color(0xff606060)),
        ),
        const SizedBox(height: 4),
        Text(
          "Jl. Soekarno Hatta 15A...",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }



}
