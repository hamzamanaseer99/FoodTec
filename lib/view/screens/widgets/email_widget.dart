import 'package:flutter/material.dart';

class EmailWidget extends StatelessWidget {
  const EmailWidget({
    super.key,
    required this.emailEditingController,
  });

  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // لون الخلفية
        borderRadius: BorderRadius.circular(12), // زوايا دائرية
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // لون الظل الناعم
            blurRadius: 2, // مدى نعومة الظل
            spreadRadius: 0, // مدى انتشاره
            offset: const Offset(0, 1), // تحريك الظل للأسفل قليلًا
          ),
        ],
      ),
      child: TextField(
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: screenWidth * 0.03, // ✅ حجم خط متجاوب
        ),
        decoration: InputDecoration(
          labelText: 'Email',
          labelStyle: TextStyle(
            fontSize: screenWidth * 0.025,

          ),
          hintText: "Enter your email",
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.025,

          ),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04, // ✅ التناسب مع الشاشة
            horizontal: screenWidth * 0.04,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none, // ✅ إزالة الإطار الافتراضي
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xffEDF1F3), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xff25AE4B), width: 2), // ✅ لون مميز عند التركيز
          ),
        ),
      ),
    );
  }
}
