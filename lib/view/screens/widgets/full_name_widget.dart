// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class FullNameWidget extends StatelessWidget {
//   FullNameWidget({
//     super.key,
//     required this.nameEditingController,
//   });
//   bool showErrorName = false;
//   final TextEditingController nameEditingController;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding:  EdgeInsets.symmetric(horizontal: 0),
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
//           controller: nameEditingController,
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth * 0.03,
//           ),
//           decoration: InputDecoration(
//             labelText: 'Full Name'.tr(),labelStyle: TextStyle(
//             fontSize: screenWidth * 0.025,
//
//           ),
//             hintText: "Enter your Name".tr(),
//             hintStyle:TextStyle(
//             fontSize: screenWidth * 0.025,
//
//           ),
//             fillColor: Colors.white, // ✅ Matches container color
//             contentPadding: EdgeInsets.symmetric(
//               vertical: screenWidth * 0.04, // ✅ نفس التناسب مع الشاشة
//               horizontal: screenWidth * 0.04,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none, // ✅ No border (shadow does the job)
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 1),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 2),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FullNameWidget extends StatefulWidget {
  final TextEditingController nameEditingController;

  const FullNameWidget({
    Key? key,
    required this.nameEditingController,
  }) : super(key: key);

  @override
  State<FullNameWidget> createState() => _FullNameWidgetState();
}

class _FullNameWidgetState extends State<FullNameWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final labelColor = isDark ? Colors.grey[300] : Colors.grey[700];
    final fillColor = Theme.of(context).colorScheme.surface;

    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : Colors.black12,
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: widget.nameEditingController,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: screenWidth * 0.04,
          ),
          decoration: InputDecoration(
            labelText: 'Full Name'.tr(),
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: labelColor,
            ),
            hintText: "Enter your Name".tr(),
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: isDark ? Colors.grey[500] : Colors.grey[600],
            ),
            filled: true,
            fillColor: fillColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.045,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
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
          ),
        ),
      ),
    );
  }
}
