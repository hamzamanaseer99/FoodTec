// import 'package:flutter/material.dart';
// import 'package:foodtek/responsive.dart';
// import 'package:foodtek/view/screens/checkout_screen.dart';
//
//
// Widget buildCheckoutSection(
//     BuildContext context,
//     double subTotal,
//     double deliveryCharge,
//     double discount, {
//       required VoidCallback onPlaceOrderTap,
//     }) {  double total = subTotal + deliveryCharge - discount;
//
//   return Container(
//     width: double.infinity,
//     margin: EdgeInsets.all(responsiveWidth(context, 16)),
//     padding: EdgeInsets.symmetric(
//       horizontal: responsiveWidth(context, 20),
//       vertical: responsiveHeight(context, 24),
//     ),
//     decoration: BoxDecoration(
//       color: Color(0xff4FAF5A),
//       borderRadius: BorderRadius.circular(24),
//       image: DecorationImage(
//         image: AssetImage('assets/images/Pattern.png'),
//         fit: BoxFit.cover,
//       ),
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         _buildPriceRow("Sub-Total", subTotal),
//         SizedBox(height: responsiveHeight(context, 10)),
//         _buildPriceRow("Delivery Charge", deliveryCharge),
//         SizedBox(height: responsiveHeight(context, 10)),
//         _buildPriceRow("Discount", discount, isDiscount: true),
//         SizedBox(height: responsiveHeight(context, 16)),
//         _buildPriceRow("Total:", total, isTotal: true),
//         SizedBox(height: responsiveHeight(context, 16)),
//         GestureDetector(
//           onTap: () {
//             Navigator.pushNamed(context, '/checkout');
//           },
//
//           child: Container(
//             height: responsiveHeight(context, 56),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(16),
//             ),
//             child: Center(
//               child: Text(
//                 "Place My Order",
//                 style: TextStyle(
//                   color: Color(0xff4FAF5A),
//                   fontWeight: FontWeight.bold,
//                   fontSize: responsiveWidth(context, 16),
//                 ),
//               ),
//             ),
//           ),
//         )
//
//       ],
//     ),
//   );
// }
//
// Widget _buildPriceRow(String label, double amount, {bool isDiscount = false, bool isTotal = false}) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         label,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: isTotal ? 18 : 14,
//           fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//       Text(
//         "${isDiscount ? '-' : ''}${amount.toStringAsFixed(2)} \$",
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: isTotal ? 20 : 14,
//           fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     ],
//   );
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

Widget buildCheckoutSection(BuildContext context,
    double subTotal,
    double deliveryCharge,
    double discount,
    {required VoidCallback onPlaceOrderTap}) {


  double total = subTotal + deliveryCharge - discount;

  return Container(
    width: double.infinity,
    margin: EdgeInsets.all(responsiveWidth(context, 16)),
    padding: EdgeInsets.symmetric(
      horizontal: responsiveWidth(context, 20),
      vertical: responsiveHeight(context, 24),
    ),
    decoration: BoxDecoration(
      color: Color(0xff4FAF5A),
      borderRadius: BorderRadius.circular(7),
      image: DecorationImage(
        image: AssetImage('assets/images/Pattern.png'), // Add your green pattern here
        fit: BoxFit.cover,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Sub-Total Row
        _buildPriceRow("Sub-Total".tr(), subTotal),
        SizedBox(height: responsiveHeight(context, 10)),

        // Delivery Charge Row
        _buildPriceRow("Delivery Charge".tr(), deliveryCharge),
        SizedBox(height: responsiveHeight(context, 10)),

        // Discount Row
        _buildPriceRow("Discount".tr(), discount, isDiscount: true),
        SizedBox(height: responsiveHeight(context, 16)),

        // Total Row
        _buildPriceRow("Total:".tr(), total, isTotal: true),
        SizedBox(height: responsiveHeight(context, 16)),

        // Place My Order Button
        GestureDetector(
          onTap: onPlaceOrderTap,
          child: Container(
            height: responsiveHeight(context, 56),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Center(
              child: Text(
                "Place My Order".tr(),
                style: TextStyle(
                  color: Color(0xff4FAF5A),
                  fontWeight: FontWeight.bold,
                  fontSize: responsiveWidth(context, 16),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPriceRow(String label, double amount, {bool isDiscount = false, bool isTotal = false}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: isTotal ? 18 : 14,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      Text(
        "${isDiscount ? '-' : ''}${amount.toStringAsFixed(2)} \$",
        style: TextStyle(
          color: Colors.white,
          fontSize: isTotal ? 20 : 14,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ],
  );
}