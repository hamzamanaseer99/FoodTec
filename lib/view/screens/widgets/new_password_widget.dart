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

    return Container(
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
        controller: widget.passwordEditingController,
        obscureText: obscureText,
        keyboardType: TextInputType.visiblePassword,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w500,
          fontSize: screenWidth * 0.03,
        ),
        decoration: InputDecoration(
          labelText: 'New Password'.tr(),
          labelStyle: TextStyle(
            fontSize: screenWidth * 0.025,
            color: textColor.withOpacity(0.7),
          ),
          hintText: "Enter new password".tr(),
          hintStyle: TextStyle(
            fontSize: screenWidth * 0.025,
            color: textColor.withOpacity(0.5),
          ),
          fillColor: backgroundColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.04,
            horizontal: screenWidth * 0.04,
          ),
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
        ),
      ),
    );
  }
}
