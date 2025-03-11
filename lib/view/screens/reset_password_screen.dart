import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 74),
                const Center(
                  child: Text(
                    'Foodtek',
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontFamily: "Protest Riot",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.9, // جعل الحجم متجاوب
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// 🔹 **Row لزر الرجوع**
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.arrow_back, size: 24),
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                "Back to",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                        const LoginScreen()),
                                  );
                                },
                                child: const Text(
                                  " Login ",
                                  style: TextStyle(
                                    color: Color(0xff25AE4B),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              const Text(
                                "page",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),

                          /// 🔹 **عنوان الصفحة**
                          const Center(
                            child: Text(
                              'Reset Password', // ✅ تم تصحيح الخطأ الإملائي
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          /// 🔹 **النص التوضيحي**
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: Center(
                              child: Text(
                                "Enter your E-mail or phone and we'll send you a link to get back into your account",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          /// 🔹 **حقل إدخال البريد الإلكتروني**
                          EmailWidget(emailEditingController: emailController),
                          const SizedBox(height: 24),
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const OtpScreen()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size(double.infinity, 50), // يجعل الزر يأخذ العرض بالكامل
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text(
                                  "Send", // ✅ تغيير النص إلى "Send"
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
