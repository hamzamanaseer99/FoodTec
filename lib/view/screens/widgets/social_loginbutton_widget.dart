import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // 🔹 ضبط حجم الخط مع حد أدنى 12 وحد أقصى 16 بناءً على الشاشة
    double fontSize = screenWidth * 0.025;
    fontSize = fontSize.clamp(12, 16);


    // 🔹 ضبط حجم الأيقونة بناءً على الشاشة
    double iconSize = screenWidth * 0.04;
    iconSize = iconSize.clamp(18, 24);

    return Column(
      children: [
        _buildSocialButton(
          icon: FontAwesomeIcons.google,
          text: "Continue with Google",
          iconColor: Colors.red,
          fontSize: fontSize,
          iconSize: iconSize,
        ),
        const SizedBox(height: 12),
        _buildSocialButton(
          icon: FontAwesomeIcons.facebook,
          text: "Continue with Facebook",
          iconColor: const Color(0xff1877F2),
          fontSize: fontSize,
          iconSize: iconSize,
        ),
        const SizedBox(height: 12),
        _buildSocialButton(
          icon: FontAwesomeIcons.apple,
          text: "Continue with Apple",
          iconColor: Colors.black,
          fontSize: fontSize,
          iconSize: iconSize,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required Color iconColor,
    required double fontSize,
    required double iconSize,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffEFF0F6),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(icon, color: iconColor, size: iconSize),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: const Color(0xff1A1C1E),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1, // 🔹 تحديد سطر واحد
                softWrap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
