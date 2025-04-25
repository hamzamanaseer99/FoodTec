import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/email_widget.dart';
import 'login_screen.dart';
import 'otp_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.green,
      body: Stack(
        children: [
          /// 🔹 **الخلفية**
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // 🟢 يمنع التمدد غير الضروري
                  children: [
                    SizedBox(height: screenHeight * 0.08),


                    Center(
                      child:  Text(
                      'Foodtek',
                      style: TextStyle(
                        fontSize: screenWidth * 0.12, // تصغير الحجم بناءً على عرض الشاشة
                        color: isDarkMode ? Colors.white : Colors.white,
                        fontFamily: "Protest Riot",
                      ),
                    ),
                    ),

                    SizedBox(height: screenHeight * 0.06),

                    Container(
                      width: screenWidth * 0.9,
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.03,
                        horizontal: screenWidth * 0.06,
                      ),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[900] : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min, // 🟢 مهم جدًا لحل مشكلة `overflow`
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back, size: 20),
                              ),
                              const SizedBox(width: 4),

                              /// 🔹 **حجم الخط الديناميكي**
                              Builder(
                                builder: (context) {
                                  double fontSize = (screenWidth * 0.030).clamp(10, 10);

                                  return Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        "Back to".tr(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: responsiveWidth(context, 6),
                                      ),
                                      TextButton(
                                        style: TextButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          minimumSize: const Size(0, 0),
                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                                          );
                                        },
                                        child: Text(
                                          "Login".tr(),
                                          style: TextStyle(
                                            color: const Color(0xff25AE4B),
                                            fontWeight: FontWeight.w600,
                                            fontSize: fontSize,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: responsiveWidth(context, 6),
                                      ),
                                      Text(
                                        "page".tr(),
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: fontSize,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),

                          /// 🔹 **عنوان الصفحة**
                          Center(
                            child: Text(
                              'Reset Password'.tr(),
                              style: TextStyle(
                                fontSize: screenWidth * 0.06,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),

                          /// 🔹 **النص التوضيحي**
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                            child:  Center(
                              child: Text(
                                "Enter your E-mail or phone and we'll send you a link to get back into your account".tr(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.03 ,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          /// 🔹 **حقل إدخال البريد الإلكتروني**
                          EmailWidget(
                              emailEditingController: emailController
                          ),
                          const SizedBox(height: 20),

                          /// 🔹 **زر "Send"**
                          Center(
                            child: Container(
                              width: screenWidth * 0.8, // ✅ نفس عرض حقل الإدخال
                              decoration: BoxDecoration(
                                color: Colors.white, // ✅ خلفية بيضاء مثل الـ TextField
                                borderRadius: BorderRadius.circular(12), // ✅ نفس حواف الإدخال
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1), // ✅ ظل ناعم
                                    blurRadius: 4,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OtpVerificationScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff25AE4B), // ✅ جعل الزر أبيض
                                  minimumSize: Size(screenWidth * 0.8, 50), // ✅ تناسب العرض والارتفاع
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12), // ✅ نفس الزوايا الدائرية
                                  ),
                                  elevation: 0, // ✅ إلغاء تأثير الرفع الأساسي للاعتماد على الظل المخصص
                                ),
                                child: Text(
                                  "Send".tr(),
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.03, // ✅ خط متجاوب
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, // ✅ لون النص أسود ليكون متناسقًا مع التصميم
                                  ),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),
                    ),

                    /// 🔹 **إضافة تباعد لمنع الالتصاق بأسفل الشاشة**
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
