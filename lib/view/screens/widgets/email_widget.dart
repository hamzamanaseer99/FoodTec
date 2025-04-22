// // import 'package:easy_localization/easy_localization.dart';
// // import 'package:flutter/material.dart';
// //
// // class EmailWidget extends StatelessWidget {
// //   const EmailWidget({
// //     super.key,
// //     required this.emailEditingController,
// //   });
// //
// //   final TextEditingController emailEditingController;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: Colors.white, // لون الخلفية
// //         borderRadius: BorderRadius.circular(12), // زوايا دائرية
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black.withOpacity(0.2), // لون الظل الناعم
// //             blurRadius: 2, // مدى نعومة الظل
// //             spreadRadius: 0, // مدى انتشاره
// //             offset: const Offset(0, 1), // تحريك الظل للأسفل قليلًا
// //           ),
// //         ],
// //       ),
// //       child: TextField(
// //         controller: emailEditingController,
// //         keyboardType: TextInputType.emailAddress,
// //         style: TextStyle(
// //           color: Colors.black,
// //           fontWeight: FontWeight.w500,
// //           fontSize: screenWidth * 0.03, // ✅ حجم خط متجاوب
// //         ),
// //         decoration: InputDecoration(
// //           labelText: 'Email'.tr(),
// //           labelStyle: TextStyle(
// //             fontSize: screenWidth * 0.025,
// //
// //           ),
// //           hintText: "Enter your email".tr(),
// //           hintStyle: TextStyle(
// //             fontSize: screenWidth * 0.025,
// //
// //           ),
// //           fillColor: Colors.white,
// //           contentPadding: EdgeInsets.symmetric(
// //             vertical: screenWidth * 0.04, // ✅ التناسب مع الشاشة
// //             horizontal: screenWidth * 0.04,
// //           ),
// //           border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(12),
// //             borderSide: BorderSide.none, // ✅ إزالة الإطار الافتراضي
// //           ),
// //           enabledBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(12),
// //             borderSide: const BorderSide(color: Color(0xffEDF1F3), width: 1),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(12),
// //             borderSide: const BorderSide(color: Color(0xff25AE4B), width: 2), // ✅ لون مميز عند التركيز
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class EmailWidget extends StatelessWidget {
//   const EmailWidget({
//     super.key,
//     required this.emailEditingController,
//   });
//
//   final TextEditingController emailEditingController;
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.white,
//             blurRadius: 4,
//             spreadRadius: 1,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: emailEditingController,
//         keyboardType: TextInputType.emailAddress,
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//           fontSize: screenWidth * 0.04,
//         ),
//         decoration: InputDecoration(
//           labelText: 'Email'.tr(),
//           labelStyle: TextStyle(
//             fontSize: screenWidth * 0.035,
//             color:Colors.black,
//           ),
//           hintText: "Enter your email".tr(),
//           hintStyle: TextStyle(
//             fontSize: screenWidth * 0.035,
//             color:Colors.white,
//           ),
//           filled: true,
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.symmetric(
//             vertical: screenWidth * 0.045,
//             horizontal: screenWidth * 0.04,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(
//               color: Colors.black,
//               width: 1,
//             ),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide(
//               color: Colors.black,
//               width: 2,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget({
    super.key,
    required this.emailEditingController,
  });

  final TextEditingController emailEditingController;

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
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
          controller: widget.emailEditingController,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.045,
          ),
          decoration: InputDecoration(
            labelText: 'Email'.tr(),
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.04,
              color: labelColor,
            ),
            hintText: "Enter your email".tr(),
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
