// import 'package:flutter/material.dart';
// import '../../intro_screen.dart';
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
//     Future.delayed(Duration(seconds: 5), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => IntroScreen()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true, // لجعل الخلفية تمتد خلف الـ AppBar
//       appBar: AppBar(
//         backgroundColor: Colors.transparent, // جعل الخلفية شفافة
//         elevation: 0, // إزالة الظل
//         toolbarHeight: 0, // إخفاء الـ AppBar مع الاحتفاظ بشريط الحالة
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/s1.png'), // مسار الصورة
//             fit: BoxFit.cover, // تغطية كامل الشاشة
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'intro_screen.dart';
import 'package:foodtek/homescreen.dart'; // تأكد من أن مسار الشاشة الرئيسية صحيح

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3)); // مدة عرض شاشة الـ Splash

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenIntro = prefs.getBool('hasSeenIntroPages') ?? false;

    // الانتقال إلى الشاشة المناسبة بناءً على حالة المستخدم
    Widget nextScreen = hasSeenIntro ? LoginScreen() : IntroScreen();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => nextScreen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // لجعل الخلفية تمتد خلف شريط الحالة
      appBar: AppBar(
        backgroundColor: Colors.transparent, // شريط علوي شفاف
        elevation: 0, // إزالة الظل
        toolbarHeight: 0, // إخفاء الـ AppBar مع الاحتفاظ بشريط الحالة
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/s1.png'), // صورة شاشة البداية
            fit: BoxFit.cover, // ملء الشاشة بالكامل
          ),
        ),
      ),
    );
  }
}
