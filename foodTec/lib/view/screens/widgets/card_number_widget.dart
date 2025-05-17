// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/responsive.dart';
//
// class CardNumberWidget extends StatefulWidget {
//   CardNumberWidget({
//     super.key,
//     required this.cardNumberEditingController,
//   });
//   final TextEditingController cardNumberEditingController;
//
//   @override
//   State<CardNumberWidget> createState() => _CardNumberWidgetState();
// }
//
// class _CardNumberWidgetState extends State<CardNumberWidget> {
//   bool showErrorNumber = false;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey, // Background color
//           borderRadius: BorderRadius.circular(12), // Rounded corners
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2), // Soft shadow color
//               blurRadius: 2, // How soft the shadow is
//               spreadRadius: 0, // How much the shadow spreads
//               offset: Offset(0, 1), // Moves shadow down (x: 0, y: 4)
//             ),
//           ],
//         ),
//         child: TextField(
//           controller: widget.cardNumberEditingController,
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth * 0.03,
//           ),
//           decoration: InputDecoration(
//             labelText: 'Card Number'.tr(),
//             labelStyle: TextStyle(
//               fontSize: screenWidth * 0.025,
//             ),
//             hintText: "6578 8756 4238 92764",
//             hintStyle: TextStyle(
//               fontSize: screenWidth * 0.025,
//             ),
//             fillColor: Colors.white,
//             contentPadding: EdgeInsets.symmetric(
//               vertical: screenWidth * 0.04,
//               horizontal: screenWidth * 0.04,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 1),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 2),
//             ),
//             suffixIcon: Padding(
//               padding: EdgeInsets.all(6),
//               child: Image.asset(
//                 'assets/images/credit_card.png',
//                 height: responsiveWidth(context, 26),
//                 width: responsiveWidth(context, 26),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class CardNumberWidget extends StatefulWidget {
  CardNumberWidget({
    super.key,
    required this.cardNumberEditingController,
  });
  final TextEditingController cardNumberEditingController;

  @override
  State<CardNumberWidget> createState() => _CardNumberWidgetState();
}

class _CardNumberWidgetState extends State<CardNumberWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final labelColor = isDark ? Colors.grey[300] : Colors.grey[700];
    final fillColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: fillColor, // Background color from theme
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : Colors.black12, // Soft shadow color
              blurRadius: 4, // How soft the shadow is
              spreadRadius: 1, // How much the shadow spreads
              offset: Offset(0, 2), // Moves shadow down (x: 0, y: 4)
            ),
          ],
        ),
        child: TextField(
          controller: widget.cardNumberEditingController,
          keyboardType: TextInputType.number,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.03,
          ),
          decoration: InputDecoration(
            labelText: 'Card Number'.tr(),
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.025,
              color: labelColor,
            ),
            hintText: "6578 8756 4238 92764",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.025,
              color: isDark ? Colors.grey[500] : Colors.grey[600],
            ),
            filled: true,
            fillColor: fillColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : const Color(0xffEDF1F3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[500]! : const Color(0xffCED3DC),
                width: 2,
              ),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(6),
              child: Image.asset(
                'assets/images/credit_card.png',
                height: responsiveWidth(context, 26),
                width: responsiveWidth(context, 26),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
