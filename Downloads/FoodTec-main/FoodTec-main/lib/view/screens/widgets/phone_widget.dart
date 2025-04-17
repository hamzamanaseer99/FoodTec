// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// //
// // class PhoneWidget extends StatelessWidget {
// //   final TextEditingController phoneEditingController;
// //   final String? Function(String?)? validator;
// //
// //   PhoneWidget({
// //     super.key,
// //     required this.phoneEditingController,
// //     this.validator,
// //   });
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 0),
// //       child: Container(
// //         decoration: BoxDecoration(
// //           color: Colors.white, // Background color
// //           borderRadius: BorderRadius.circular(12), // Rounded corners
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.black.withOpacity(0.2), // Soft shadow color
// //               blurRadius: 2, // How soft the shadow is
// //               spreadRadius: 0, // How much the shadow spreads
// //               offset: Offset(0, 1), // Moves shadow down (x: 0, y: 4)
// //             ),
// //           ],
// //         ),
// //         child: TextFormField(
// //           controller: phoneEditingController,
// //           validator: validator, // Validation logic passed from parent widget
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontWeight: FontWeight.bold,
// //             fontSize: 14,
// //           ),
// //           decoration: InputDecoration(
// //             labelText: 'Phone Number',
// //             hintText: "079/077/078",
// //             fillColor: Colors.white, // ✅ Matches container color
// //             border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(10),
// //               borderSide: BorderSide.none, // ✅ No border (shadow does the job)
// //             ),
// //             enabledBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(12),
// //               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 1),
// //             ),
// //             focusedBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(12),
// //               borderSide: BorderSide(color: Color(0xffEDF1F3), width: 2),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// class PhoneWidget extends StatelessWidget {
//   final TextEditingController phoneEditingController;
//   final String? Function(String?)? validator;
//
//   const PhoneWidget({
//     Key? key,
//     required this.phoneEditingController,
//     this.validator,
//   }) : super(key: key);
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
//               offset: const Offset(0, 1), // Moves shadow down (x: 0, y: 1)
//             ),
//           ],
//         ),
//         child: IntlPhoneField(
//           controller: phoneEditingController,
//          // validator: validator, // Validation logic passed from parent widget
//           style:  TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: screenWidth * 0.03,
//           ),
//           decoration: InputDecoration(
//             labelText: 'Phone Number'.tr(),
//             labelStyle: TextStyle(
//               fontSize: screenWidth * 0.025,
//
//             ),
//             hintText: "79/77/78",hintStyle: TextStyle(
//             fontSize: screenWidth * 0.025,
//
//           ),
//             filled: true, // Ensure the background is filled
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
//
//           initialCountryCode: 'JO', // Default country code (Jordan in this case)
//           onChanged: (phone) {
//             print(phone.completeNumber); // Get the complete phone number
//           },
//
//           disableLengthCheck: true, // Disable length validation (optional)
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController phoneEditingController;
  final String? Function(String?)? validator;

  const PhoneWidget({
    Key? key,
    required this.phoneEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fillColor = Theme.of(context).colorScheme.surface;
    final textColor = isDark ? Colors.white : Colors.black;
    final hintColor = isDark ? Colors.grey[500] : Colors.grey[600];
    final labelColor = isDark ? Colors.grey[300] : Colors.grey[700];

    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: fillColor, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : Colors.black12, // Shadow color
              blurRadius: 4, // Soft shadow
              spreadRadius: 1, // Shadow spread
              offset: const Offset(0, 2), // Shadow position
            ),
          ],
        ),
        child: IntlPhoneField(
          controller: phoneEditingController,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.04,
          ),
          decoration: InputDecoration(
            labelText: 'Phone Number'.tr(),
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: labelColor,
            ),
            hintText: "79/77/78",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.035,
              color: hintColor,
            ),
            filled: true, // Ensure the background is filled
            fillColor: fillColor, // Matches container color
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.045,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // No border
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
                color: isDark ? Colors.greenAccent : const Color(0xff25AE4B),
                width: 2,
              ),
            ),
          ),
          initialCountryCode: 'JO', // Default country code (Jordan)
          onChanged: (phone) {
            print(phone.completeNumber); // Get the complete phone number
          },
          disableLengthCheck: true, // Disable length validation (optional)
        ),
      ),
    );
  }
}
