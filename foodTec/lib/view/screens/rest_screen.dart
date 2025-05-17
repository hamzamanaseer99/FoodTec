// import 'package:flutter/material.dart';
// import 'login_screen.dart';
//
// class ResetScreen extends StatefulWidget {
//   const ResetScreen({super.key});
//
//   @override
//   State<ResetScreen> createState() => _ResetScreenState();
// }
//
// class _ResetScreenState extends State<ResetScreen> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 74),
//                 const Center(
//                   child: Text(
//                     'Foodtek',
//                     style: TextStyle(
//                       fontSize: 80,
//                       color: Colors.white,
//                       fontFamily: "Protest Riot",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 24, horizontal: 24),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 icon: const Icon(Icons.arrow_back, size: 24),
//                               ),
//                               const SizedBox(width: 4),
//
//
//                             ],
//                           ),
//                           const SizedBox(height: 5),
//                           Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 5),
//                             child: Row(
//                               children: const [
//                                 Text(
//                                   'Reset Password',
//                                   style: TextStyle(
//                                     fontSize: 32,
//                                     fontWeight: FontWeight.w700,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start, // توسيط العناصر أفقيًا
//                               children: [
//                                 const Text(
//                                   "Want to try with my current password?",
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 TextButton(
//                                   style: TextButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                     minimumSize: Size.zero,
//                                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => const LoginScreen()),
//                                     );
//                                   },
//                                   child: const Text(
//                                     " Login ",
//                                     style: TextStyle(
//                                       color: Color(0xff25AE4B),
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//

//                           const SizedBox(height: 24),
//
//                           TextField(
//                             controller: passwordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               labelText: "New Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//                           TextField(
//                             controller: confirmPasswordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               labelText: "Confirm Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//                           ElevatedButton(
//                             onPressed: () {
//                               if (passwordController.text ==
//                                   confirmPasswordController.text) {
//                                 // تنفيذ إعادة التعيين
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content: Text("Password reset successful!"),
//                                     backgroundColor: Colors.green,
//                                   ),
//                                 );
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                       const LoginScreen()),
//                                 );
//                               } else {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                     content:
//                                     Text("Passwords do not match!"),
//                                     backgroundColor: Colors.red,
//                                   ),
//                                 );
//                               }
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               minimumSize: const Size(double.infinity, 50),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: const Text(
//                               "Update Password",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'login_screen.dart';
//
// class ResetScreen extends StatefulWidget {
//   const ResetScreen({super.key});
//
//   @override
//   State<ResetScreen> createState() => _ResetScreenState();
// }
//
// class _ResetScreenState extends State<ResetScreen> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   /// ✅ **دالة للتحقق من قوة كلمة المرور**
//   bool isPasswordValid(String password) {
//     final RegExp passwordRegExp = RegExp(
//       r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
//     );
//     return passwordRegExp.hasMatch(password);
//   }
//
//   /// ✅ **دالة لحفظ كلمة المرور الجديدة (محاكاة لحفظها في قاعدة بيانات)**
//   void updatePassword() {
//     String newPassword = passwordController.text;
//     String confirmPassword = confirmPasswordController.text;
//
//     if (newPassword != confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Passwords do not match!"),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     if (!isPasswordValid(newPassword)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Password must contain uppercase, lowercase, number, special character, and be at least 8 characters long."),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     /// 🔹 **هنا يتم تنفيذ منطق حفظ كلمة المرور في قاعدة البيانات**
//     /// ملاحظة: هذا مثال فقط، يجب استبداله بمنطق قاعدة البيانات الحقيقية
//     print("Saving new password: $newPassword");
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Password reset successful!"),
//         backgroundColor: Colors.green,
//       ),
//     );
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const LoginScreen()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 74),
//                 const Center(
//                   child: Text(
//                     'Foodtek',
//                     style: TextStyle(
//                       fontSize: 80,
//                       color: Colors.white,
//                       fontFamily: "Protest Riot",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width * 0.9,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 icon: const Icon(Icons.arrow_back, size: 24),
//                               ),
//                               const SizedBox(width: 4),
//                             ],
//                           ),
//                           const SizedBox(height: 5),
//                           const Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 5),
//                             child: Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 'Reset Password',
//                                 style: TextStyle(
//                                   fontSize: 32,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5),
//                             child: Row(
//                               children: [
//                                 const Text(
//                                   "Want to try with my current password?",
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 TextButton(
//                                   style: TextButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                     minimumSize: Size.zero,
//                                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => const LoginScreen()),
//                                     );
//                                   },
//                                   child: const Text(
//                                     " Login ",
//                                     style: TextStyle(
//                                       color: Color(0xff25AE4B),
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//
//                           /// 🔹 **إدخال كلمة المرور الجديدة**
//                           TextField(
//                             controller: passwordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               labelText: "New Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//
//                           /// 🔹 **إدخال تأكيد كلمة المرور**
//                           TextField(
//                             controller: confirmPasswordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               labelText: "Confirm Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//
//                           /// 🔹 **زر تحديث كلمة المرور**
//                           ElevatedButton(
//                             onPressed: updatePassword, // استدعاء دالة تحديث كلمة المرور
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               minimumSize: const Size(double.infinity, 50),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: const Text(
//                               "Update Password",
//                               style: TextStyle(
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.w500,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import '../../utils/password_validator.dart';
// import 'login_screen.dart';
//
// class ResetScreen extends StatefulWidget {
//   const ResetScreen({super.key});
//
//   @override
//   State<ResetScreen> createState() => _ResetScreenState();
// }
//
// class _ResetScreenState extends State<ResetScreen> {
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//
//   /// ✅ **دالة لحفظ كلمة المرور الجديدة**
//   void updatePassword() {
//     String newPassword = passwordController.text;
//     String confirmPassword = confirmPasswordController.text;
//
//     if (newPassword != confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Passwords do not match!"),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     if (!PasswordValidator.isValid(newPassword)) { // ✅ التحقق باستخدام الكلاس المنفصل
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Password must contain uppercase, lowercase, number, special character, and be at least 8 characters long."),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     print("Saving new password: $newPassword"); // 🔹 محاكاة الحفظ في قاعدة البيانات
//
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("Password reset successful!"),
//         backgroundColor: Colors.green,
//       ),
//     );
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const LoginScreen()),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.green,
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(height: 74),
//                 const Center(
//                   child: Text(
//                     'Foodtek',
//                     style: TextStyle(
//                       fontSize: 80,
//                       color: Colors.white,
//                       fontFamily: "Protest Riot",
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(24),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () => Navigator.pop(context),
//                                 icon: const Icon(Icons.arrow_back, size: 24),
//                               ),
//                               const SizedBox(width: 4),
//                             ],
//                           ),
//                           const SizedBox(height: 5),
//                           const Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               'Reset Password',
//                               style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
//                             ),
//                           ),
//                           const SizedBox(height: 10),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 5),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start, // توسيط العناصر أفقيًا
//                               children: [
//                                 const Text(
//                                   "Want to try with my current password?",
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                     fontSize: 12,
//                                     color: Colors.grey,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 TextButton(
//                                   style: TextButton.styleFrom(
//                                     padding: EdgeInsets.zero,
//                                     minimumSize: Size.zero,
//                                     tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                                   ),
//                                   onPressed: () {
//                                     Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(builder: (context) => const LoginScreen()),
//                                     );
//                                   },
//                                   child: const Text(
//                                     " Login ",
//                                     style: TextStyle(
//                                       color: Color(0xff25AE4B),
//                                       fontWeight: FontWeight.w600,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
// SizedBox(height: 20,),
//
//                           TextField(
//                             controller: passwordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               labelText: "New Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 20),
//
//                           TextField(
//                             controller: confirmPasswordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               labelText: "Confirm Password",
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 24),
//
//                           ElevatedButton(
//                             onPressed: updatePassword,
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.green,
//                               minimumSize: const Size(double.infinity, 50),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                             ),
//                             child: const Text(
//                               "Update Password",
//                               style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/confirm_password_widget.dart';
import 'package:foodtek/view/screens/widgets/new_password_widget.dart';
import 'package:foodtek/view/screens/widgets/password_widget.dart';
import 'dart:ui';  // لإضافة تأثير الـ blur
import '../../utils/password_validator.dart';
import 'login_screen.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool _isOverlayVisible = false; // متغير لتحديد ظهور الشاشة الفوقية

  void updatePassword() {
    String newPassword = passwordController.text;
    String confirmPassword = confirmPasswordController.text;

    if (newPassword != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text("Passwords do not match!".tr()),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!PasswordValidator.isValid(newPassword)) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          content: Text("Password must contain uppercase, lowercase, number, special character, and be at least 8 characters long.".tr()),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // محاكاة الحفظ في قاعدة البيانات
    print("Saving new password: $newPassword");

    // عند النجاح في تحديث كلمة السر، إظهار الـ overlay
    setState(() {
      _isOverlayVisible = true;
    });

    // إخفاء الشاشة الفوقية بعد 2 ثانية
    Future.delayed(const Duration(seconds: 60), () {
      setState(() {
        _isOverlayVisible = false;
      });
    });

    // عرض رسالة نجاح
    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text("Password reset successful!".tr()),
        backgroundColor: Colors.green,
      ),
    );

    // الانتظار 2 ثانية ثم الانتقال إلى شاشة تسجيل الدخول
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  // دالة لعرض الشاشة الفوقية مع blur
  void showOverlay() {
    setState(() {
      _isOverlayVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.green,
      body: Stack(
        children: [
          // خلفية الصورة
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // المحتوى الأساسي
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 74),
                Center(
                  child: Text(
                    'Foodtek',
                    style: TextStyle(
                      fontSize: screenWidth * 0.12 < 72 ? screenWidth * 0.12 : 72,
                      color: Colors.white,
                      fontFamily: "Protest Riot",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.grey[900] : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back, size: 24),
                              ),
                              const SizedBox(width: 4),
                            ],
                          ),
                          const SizedBox(height: 5),
                           Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Reset Password'.tr(),
                              style: TextStyle(
                                  fontSize: screenWidth * 0.05 ,
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                 Text(
                                  "Want to try with my current password?".tr(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: responsiveWidth(context, 12) ,
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? Colors.white
                                        : Colors.grey,                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: responsiveWidth(context, 6),
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                                    );
                                  },
                                  child:  Text(
                                    "Login".tr(),
                                    style: TextStyle(
                                      color: Color(0xff25AE4B),
                                      fontWeight: FontWeight.w600,
                                      fontSize: responsiveWidth(context, 12) ,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          NewPasswordWidget(passwordEditingController: passwordController),
                          SizedBox(height: 16),
                         ConfirmPasswordWidget(confirmPasswordEditingController: confirmPasswordController),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: updatePassword,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:  Color(0xff25AE4B),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child:  Text(
                              "Update Password".tr(),
                              style: TextStyle(
                                  fontSize: screenWidth * 0.033,
                                  fontWeight: FontWeight.w500, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // عرض الشاشة الفوقية مع blur فقط عند نجاح العملية
          if (_isOverlayVisible)
            Positioned.fill(
              child: Stack(
                children: [
                  // Blur + لون خلفي شفاف حسب الثيم
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      color: Theme.of(context).colorScheme.background.withOpacity(0.5),
                    ),
                  ),

                  // الصور في المنتصف
                  SafeArea(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Group1.png',
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/images/Text.png',
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.height * 0.15,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )

        ],
      ),
    );
  }
}
