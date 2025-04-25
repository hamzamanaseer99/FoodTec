import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class PhoneWidget extends StatelessWidget {
  final TextEditingController phoneEditingController;
  final String? Function(String?)? validator;

  const PhoneWidget({
    Key? key,
    required this.phoneEditingController,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    final fillColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final borderColor = isDark ? Colors.grey[700]! : const Color(0xffEDF1F3);
    final focusColor = isDark ? Colors.grey[500]! : const Color(0xff25AE4B);
    final textColor = isDark ? Colors.white : Colors.black;
    final hintColor = isDark ? Colors.grey[400] : Colors.grey[600];
    final labelColor = isDark ? Colors.grey[300] : Colors.grey[700];

    return Container(
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
      child: IntlPhoneField(
        controller: phoneEditingController,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: responsiveWidth(context, 14),
        ),
        decoration: InputDecoration(
          labelText: 'Phone Number'.tr(),
          labelStyle: TextStyle(
            fontSize: responsiveWidth(context, 14),
            color: labelColor,
          ),
          hintText: "79/77/78",
          hintStyle: TextStyle(
            fontSize: responsiveWidth(context, 14),
            color: hintColor,
          ),
          filled: true,
          fillColor: fillColor,
          contentPadding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.045,
            horizontal: screenWidth * 0.04,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: borderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: focusColor,
              width: 2,
            ),
          ),
        ),
        initialCountryCode: 'JO',
        onChanged: (phone) {
          print(phone.completeNumber);
        },
        disableLengthCheck: true,
      ),
    );
  }
}
