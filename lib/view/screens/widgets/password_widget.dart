// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class PasswordWidget extends StatefulWidget {
//   final TextEditingController passwordEditingController;
//
//   const PasswordWidget({
//     super.key,
//     required this.passwordEditingController,
//   });
//
//   @override
//   State<PasswordWidget> createState() => _PasswordWidgetState();
// }
//
// class _PasswordWidgetState extends State<PasswordWidget> {
//   bool obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white, // ✅ نفس لون EmailWidget
//         borderRadius: BorderRadius.circular(12), // ✅ نفس الزوايا المستديرة
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2), // ✅ نفس الظل
//             blurRadius: 2,
//             spreadRadius: 0,
//             offset: const Offset(0, 1),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: widget.passwordEditingController,
//         obscureText: obscureText,
//         keyboardType: TextInputType.visiblePassword,
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.w500, // ✅ جعل الخط بنفس الوزن
//           fontSize: screenWidth * 0.03, // ✅ جعل الخط متجاوبًا
//         ),
//         decoration: InputDecoration(
//           labelText: 'Password'.tr(),
//           labelStyle: TextStyle(
//             fontSize: screenWidth * 0.025,
//
//           ),
//           hintText: "Enter your password".tr(),
//           hintStyle: TextStyle(
//             fontSize: screenWidth * 0.025,
//
//           ),
//           fillColor: Colors.white,
//           contentPadding: EdgeInsets.symmetric(
//             vertical: screenWidth * 0.04, // ✅ نفس التناسب مع الشاشة
//             horizontal: screenWidth * 0.04,
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none, // ✅ إزالة الإطار الافتراضي
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Color(0xffEDF1F3), width: 1),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: const BorderSide(color: Color(0xff25AE4B), width: 2), // ✅ لون أخضر عند التركيز
//           ),
//           suffixIcon: IconButton(
//             onPressed: () {
//               setState(() {
//                 obscureText = !obscureText;
//               });
//             },
//             icon: Icon(
//               obscureText ? Icons.visibility_off : Icons.visibility,
//               color: Colors.grey, // ✅ توحيد لون الأيقونة
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
//
// class PasswordWidget extends StatefulWidget {
//   final TextEditingController passwordEditingController;
//
//   const PasswordWidget({
//     super.key,
//     required this.passwordEditingController,
//   });
//
//   @override
//   State<PasswordWidget> createState() => _PasswordWidgetState();
// }
//
// class _PasswordWidgetState extends State<PasswordWidget> {
//   bool obscureText = true;
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white, // Background color
//         borderRadius: BorderRadius.circular(12), // Rounded corners
//         boxShadow: [
//           BoxShadow(
//             color:Colors.white, // Shadow color
//             blurRadius: 4, // Soft shadow
//             spreadRadius: 1, // Shadow spread
//             offset: const Offset(0, 2), // Shadow position
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: widget.passwordEditingController,
//         obscureText: obscureText,
//         keyboardType: TextInputType.visiblePassword,
//         style: TextStyle(
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//           fontSize: screenWidth * 0.03,
//         ),
//         decoration: InputDecoration(
//           labelText: 'Password'.tr(),
//           labelStyle: TextStyle(
//             fontSize: screenWidth * 0.035,
//             color: Colors.black,
//           ),
//           hintText: "Enter your password".tr(),
//           hintStyle: TextStyle(
//             fontSize: screenWidth * 0.035,
//             color: Colors.black,
//           ),
//           fillColor: Colors.black,
//           contentPadding: EdgeInsets.symmetric(
//             vertical: screenWidth * 0.04,
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
//           suffixIcon: IconButton(
//             onPressed: () {
//               setState(() {
//                 obscureText = !obscureText;
//               });
//             },
//             icon: Icon(
//               obscureText ? Icons.visibility_off : Icons.visibility,
//               color:Colors.black
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController passwordEditingController;

  const PasswordWidget({
    super.key,
    required this.passwordEditingController,
  });

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final labelColor = isDark ? Colors.grey[300] : Colors.grey[700];
    final hintColor = isDark ? Colors.grey[500] : Colors.grey[600];
    final fillColor = Theme.of(context).colorScheme.surface;

    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
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
        controller: widget.passwordEditingController,
        obscureText: obscureText,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: screenWidth * 0.045,
        ),
        decoration: InputDecoration(
          labelText: 'Password'.tr(),
          labelStyle: TextStyle(
            fontSize: screenWidth * 0.04,
            color: labelColor,
          ),
          hintText: "Enter your password".tr(),
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.035,
            color: hintColor,
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
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: hintColor,
            ),
          ),
        ),
      ),
    );
  }
}
