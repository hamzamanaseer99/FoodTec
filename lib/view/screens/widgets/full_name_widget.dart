import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class FullNameWidget extends StatefulWidget {
  final TextEditingController nameEditingController;

  const FullNameWidget({
    Key? key,
    required this.nameEditingController,
  }) : super(key: key);

  @override
  State<FullNameWidget> createState() => _FullNameWidgetState();
}

class _FullNameWidgetState extends State<FullNameWidget> {
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
          controller: widget.nameEditingController,
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
            labelText: 'Full Name'.tr(),
            labelStyle: TextStyle(
              fontSize: responsiveWidth(context, 14),
              color: hintColor,
            ),
            hintText: "Enter your name".tr(),
            hintStyle: TextStyle(
              fontSize: responsiveWidth(context, 14),
              color: hintColor,
            ),
            filled: true,
            fillColor: fillColor,
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
          ),
        ),
      ),
    );
  }
}
