// // import 'package:flutter/material.dart';
// // import '../../intro_screen.dart';
// //
// // class SplashScreen extends StatefulWidget {
// //   @override
// //   _SplashScreenState createState() => _SplashScreenState();
// // }
// //
// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     Future.delayed(Duration(seconds: 5), () {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(builder: (context) => IntroScreen()),
// //       );
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       extendBodyBehindAppBar: true, // لجعل الخلفية تمتد خلف الـ AppBar
// //       appBar: AppBar(
// //         backgroundColor: Colors.transparent, // جعل الخلفية شفافة
// //         elevation: 0, // إزالة الظل
// //         toolbarHeight: 0, // إخفاء الـ AppBar مع الاحتفاظ بشريط الحالة
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             image: AssetImage('assets/images/s1.png'), // مسار الصورة
// //             fit: BoxFit.cover, // تغطية كامل الشاشة
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:foodtek/view/screens/location_screen.dart';
// import 'package:foodtek/view/screens/login_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'intro_screen.dart';
// import 'package:foodtek/homescreen.dart'; // تأكد من أن مسار الشاشة الرئيسية صحيح
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToNextScreen();
//   }
//
//   Future<void> _navigateToNextScreen() async {
//     await Future.delayed(Duration(seconds: 3)); // مدة عرض شاشة الـ Splash
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool hasSeenIntro = prefs.getBool('hasSeenIntroPages') ?? false;
//
//     // الانتقال إلى الشاشة المناسبة بناءً على حالة المستخدم
//     Widget nextScreen = hasSeenIntro ? LocationScreen() : IntroScreen();
//
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => nextScreen),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//      // backgroundColor: Color(0xFF25AE4B), // وضع اللون الخلفي
//       extendBodyBehindAppBar: true, // لجعل الخلفية تمتد خلف شريط الحالة
//       appBar: AppBar(
//         backgroundColor: Colors.transparent, // شريط علوي شفاف
//         elevation: 0, // إزالة الظل
//         toolbarHeight: 0, // إخفاء الـ AppBar مع الاحتفاظ بشريط الحالة
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           color: Color(0xFF25AE4B), // إضافة لون خلفية
//           image: DecorationImage(
//             image: AssetImage('assets/images/Pattern.png'), // صورة شاشة البداية
//             fit: BoxFit.cover, // ملء الشاشة بالكامل
//           ),
//         ),
//         child: Stack(
//           children: [
//             Center(
//               child: Image.asset(
//                 'assets/images/logo.png', // صورة فوق الخلفية
//                 width: 150, // التحكم في حجم الصورة
//                 height: 150, // التحكم في حجم الصورة
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:foodtek/view/screens/location_screen.dart';
import 'package:foodtek/view/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_screen.dart';
import 'package:foodtek/homescreen.dart'; // تأكد من أن مسار الشاشة الرئيسية صحيح

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 4), // مدة الحركة
      vsync: this,
    );


    _scale = Tween<double>(
      begin: 0.5, // الحجم الابتدائي
      end: 1.5,   // الحجم النهائي
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );

    _controller.forward(); // تشغيل الحركة
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // مدة عرض شاشة الـ Splash

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenIntro = prefs.getBool('hasSeenIntroPages') ?? false;

    // الانتقال إلى الشاشة المناسبة بناءً على حالة المستخدم
    Widget nextScreen = hasSeenIntro ? LocationScreen() : IntroScreen();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => IntroScreen()),
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // إيقاف الـ controller عند الخروج
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // لجعل الخلفية تمتد خلف الـ AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // شريط علوي شفاف
        elevation: 0, // إزالة الظل
        toolbarHeight: 0, // إخفاء الـ AppBar مع الاحتفاظ بشريط الحالة
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF25AE4B), // إضافة لون خلفية
          image: DecorationImage(
            image: AssetImage('assets/images/Pattern.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Transform.scale(
                scale: _scale.value,
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
