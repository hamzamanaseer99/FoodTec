import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class CvcWidget extends StatefulWidget {
  CvcWidget({
    super.key,
    required this.cvcEditingController,
  });
  final TextEditingController cvcEditingController;

  @override
  State<CvcWidget> createState() => _CvcWidgetState();
}

class _CvcWidgetState extends State<CvcWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? Colors.white : Colors.black;
    final labelColor = isDark ? Colors.grey[300] : Colors.grey[700];
    final fillColor = Theme.of(context).colorScheme.surface;

    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        width: responsiveWidth(context, 184),
        decoration: BoxDecoration(
          color: fillColor, // Background color from theme
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : Colors.black12, // Soft shadow color
              blurRadius: 4, // How soft the shadow is
              spreadRadius: 1, // How much the shadow spreads
              offset: Offset(0, 2), // Moves shadow down (x: 0, y: 4)
            ),
          ],
        ),
        child: TextField(
          controller: widget.cvcEditingController,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.03,
          ),
          decoration: InputDecoration(
            labelText: 'CVC'.tr(),
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.025,
              color: labelColor,
            ),
            hintText: "875",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.025,
              color: isDark ? Colors.grey[500] : Colors.grey[600],
            ),
            filled: true,
            fillColor: fillColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : const Color(0xffEDF1F3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[500]! : const Color(0xffCED3DC),
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
