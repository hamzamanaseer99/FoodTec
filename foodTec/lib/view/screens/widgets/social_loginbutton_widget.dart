import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodtek/responsive.dart';

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme
        .of(context)
        .brightness == Brightness.dark;


    return Column(
      children: [
        _buildSocialButton(
          context: context,
          icon: FontAwesomeIcons.google,
          text: "Continue with Google".tr(),
          iconColor: Colors.red,
          fontSize: responsiveWidth(context, 14),
          iconSize: responsiveWidth(context, 18),
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 12),
        _buildSocialButton(
          context: context,
          icon: FontAwesomeIcons.facebook,
          text: "Continue with Facebook".tr(),
          iconColor: const Color(0xff1877F2),
          fontSize: responsiveWidth(context, 14),
          iconSize: responsiveWidth(context, 18),
          isDarkMode: isDarkMode,
        ),
        const SizedBox(height: 12),
        _buildSocialButton(
          context: context,
          icon: FontAwesomeIcons.apple,
          text: "Continue with Apple".tr(),
          iconColor: isDarkMode ? Colors.white : Colors.black,
          fontSize: responsiveWidth(context, 14),
          iconSize: responsiveWidth(context, 18),
          isDarkMode: isDarkMode,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Color iconColor,
    required double fontSize,
    required double iconSize,
    required bool isDarkMode,
  }) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDarkMode ? Colors.grey[700]! : const Color(0xffEFF0F6),
          width: 1.5,
        ),
        boxShadow: isDarkMode
            ? []
            : [
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
          mainAxisAlignment: MainAxisAlignment.center, // <-- center the Row
          mainAxisSize: MainAxisSize.min, // <-- center children tightly
          children: [
            FaIcon(icon, color: iconColor, size: iconSize),
            const SizedBox(width: 12),
            Text(
              text.tr(),
              style: TextStyle(
                color: isDarkMode ? Colors.white : const Color(0xff1A1C1E),
                fontSize: fontSize,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}