import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NewPasswordWidget extends StatefulWidget {
  final TextEditingController passwordEditingController;

  const NewPasswordWidget({
    super.key,
    required this.passwordEditingController,
  });

  @override
  State<NewPasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<NewPasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // ✅ نفس لون EmailWidget
        borderRadius: BorderRadius.circular(12), // ✅ نفس الزوايا المستديرة
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2), // ✅ نفس الظل
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: widget.passwordEditingController,
        obscureText: obscureText,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500, // ✅ جعل الخط بنفس الوزن
          fontSize: screenWidth * 0.03, // ✅ جعل الخط متجاوبًا
        ),
        decoration: InputDecoration(
          labelText: 'New Password'.tr(),
          labelStyle: TextStyle(
          fontSize: screenWidth * 0.025,
        ),
          hintText: "Enter new password".tr(),
          hintStyle: TextStyle(
          fontSize: screenWidth * 0.025,
        ),
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04, // ✅ نفس التناسب مع الشاشة
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
            borderSide: const BorderSide(color: Color(0xff25AE4B), width: 2), // ✅ لون أخضر عند التركيز
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey, // ✅ توحيد لون الأيقونة
            ),
          ),
        ),
      ),
    );
  }
}
