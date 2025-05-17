import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ConfirmPasswordWidget extends StatefulWidget {
  final TextEditingController confirmPasswordEditingController;

  const ConfirmPasswordWidget({
    super.key,
    required this.confirmPasswordEditingController,
  });

  @override
  State<ConfirmPasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<ConfirmPasswordWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final Color backgroundColor = isDarkMode
        ? Theme.of(context).colorScheme.surface
        : Colors.white;
    final Color textColor = isDarkMode
        ? Theme.of(context).colorScheme.onSurface
        : Colors.black;
    final Color iconColor = isDarkMode ? Colors.grey[400]! : Colors.grey;
    final Color enabledBorderColor =
    isDarkMode ? Colors.grey[700]! : const Color(0xffEDF1F3);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isDarkMode
              ? []
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextField(
          controller: widget.confirmPasswordEditingController,
          obscureText: obscureText,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.03,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04,
              horizontal: screenWidth * 0.04,
            ),
            labelText: 'Confirm Password'.tr(),
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.025,
              color: textColor.withOpacity(0.7),
            ),
            hintText: "Enter your Password".tr(),
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.025,
              color: textColor.withOpacity(0.5),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: iconColor,
              ),
            ),
            fillColor: backgroundColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: enabledBorderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff25AE4B), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
