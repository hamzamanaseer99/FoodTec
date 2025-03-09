import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          _buildSocialButton(
            icon: FontAwesomeIcons.google,
            text: "Continue with Google",
            color: Colors.white,
            textColor: const Color(0xff1A1C1E),
            iconColor: Colors.red, // Google Red Color
          ),
          const SizedBox(height: 15),
          _buildSocialButton(
            icon: FontAwesomeIcons.facebook,
            text: "Continue with Facebook",
            color: Colors.white,
            textColor: const Color(0xff1A1C1E),
            iconColor: const Color(0xff1877F2), // Facebook Blue Color
          ),
          const SizedBox(height: 15),
          _buildSocialButton(
            icon: FontAwesomeIcons.apple,
            text: "Continue with Apple",
            color: Colors.white,
            textColor: const Color(0xff1A1C1E),
            iconColor: Colors.black, // Apple uses Black Icon
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    required Color color,
    required Color textColor,
    Color iconColor = Colors.black, // Default to black
  }) {
    return Container(
      width: 295,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          const BoxShadow(
            blurRadius: 6,
            spreadRadius: 0,
            offset: Offset(0, -3),
            color: Color(0xffF4F5FA),
          ),
        ],
        border: Border.all(
          color: const Color(0xffEFF0F6),
          width: 2,
        ),
      ),
      child: TextButton.icon(
        onPressed: () {},
        icon: FaIcon(icon, color: iconColor, size: 18), // 👈 Set icon size to 18px
        label: Text(text, style: TextStyle(color: textColor, fontSize: 16)),
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
