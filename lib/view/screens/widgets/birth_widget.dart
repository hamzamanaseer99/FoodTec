// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class BirthWidget extends StatelessWidget {
//   BirthWidget({
//     super.key,
//     required this.BithEditingController,
//   });
//   bool showErrorName = false;
//   final TextEditingController BithEditingController;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white, // Background color
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
//           controller: BithEditingController,
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//               fontSize: screenWidth * 0.03
//           ),
//           decoration: InputDecoration(
//             labelText: 'Birth of date'.tr(),
//             labelStyle: TextStyle(
//               fontSize: screenWidth * 0.025,
//
//             ),
//             hintText: "YYYY-MM-DD".tr(),
//             hintStyle: TextStyle(
//               fontSize: screenWidth * 0.025,
//
//             ),
//             suffixIcon: Icon(Icons.calendar_month_rounded),
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
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class BirthWidget extends StatelessWidget {
//   BirthWidget({
//     super.key,
//     required this.BithEditingController,
//   });
//   bool showErrorName = false;
//   final TextEditingController BithEditingController;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[200], // ✅ تم تعديل اللون لخلفية أنعم
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1), // ✅ ظل أخف وأرقى
//               blurRadius: 2,
//               spreadRadius: 0,
//               offset: Offset(0, 1),
//             ),
//           ],
//         ),
//         child: TextField(
//           controller: BithEditingController,
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth * 0.03,
//           ),
//           decoration: 
//           InputDecoration(
//             labelText: 'Birth of date'.tr(),
//             labelStyle: TextStyle(
//               fontSize: screenWidth * 0.025,
//               color: Colors.black87, // ✅ لون أوضح لليبل
//             ),
//             hintText: "YYYY-MM-DD".tr(),
//             hintStyle: TextStyle(
//               fontSize: screenWidth * 0.025,
//               color: Colors.black45, // ✅ لون هينت أوضح
//             ),
//             suffixIcon: Icon(Icons.calendar_month_rounded, color: Colors.black54), // ✅ لون الأيقونة
//             fillColor: Colors.transparent,
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
//               borderSide: BorderSide(color: Colors.black12, width: 1), // ✅ لون خفيف للحدود
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.black26, width: 2), // ✅ لون عند التركيز
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class BirthWidget extends StatefulWidget {
  final TextEditingController BithEditingController;

  const BirthWidget({
    super.key,
    required this.BithEditingController,
  });

  @override
  State<BirthWidget> createState() => _BirthWidgetState();
}

class _BirthWidgetState extends State<BirthWidget> {
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
          controller: widget.BithEditingController,
          keyboardType: TextInputType.datetime,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.045,
          ),
          decoration: InputDecoration(
            labelText: 'Birth of date'.tr(),
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.04,
              color: labelColor,
            ),
            hintText: "YYYY-MM-DD".tr(),
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: isDark ? Colors.grey[500] : Colors.grey[600],
            ),
            suffixIcon: Icon(
              Icons.calendar_month_rounded,
              color: isDark ? Colors.grey[400] : Colors.grey[700],
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
