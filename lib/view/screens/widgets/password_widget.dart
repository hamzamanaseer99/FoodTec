import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController passwordEditingController;

  const PasswordWidget({
    super.key,
    required this.passwordEditingController,
  });

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final fillColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final borderColor = isDark ? Colors.grey[700]! : const Color(0xffEDF1F3);
    final focusColor = isDark ? Colors.grey[500]! : const Color(0xff25AE4B);
    final textColor = isDark ? Colors.white : Colors.black;
    final hintColor = isDark ? Colors.grey[400] : Colors.grey[600];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black.withOpacity(0.4) : Colors.black.withOpacity(0.2),
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
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: responsiveWidth(context, 14),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04,
              horizontal: screenWidth * 0.04,
            ),
            labelText: 'Password'.tr(),
            labelStyle: TextStyle(
              fontSize: responsiveWidth(context, 14),
              color: hintColor,
            ),
            hintText: "Enter your password".tr(),
            hintStyle: TextStyle(
              fontSize: responsiveWidth(context, 14),
              color: hintColor,
            ),
            fillColor: fillColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: focusColor, width: 2),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: hintColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
