import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/responsive.dart';

class SelectableCard extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableCard({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(

        padding: EdgeInsets.symmetric(
          horizontal: responsiveWidth(context, 16), // تعديل العرض باستخدام responsiveWidth
          vertical: responsiveHeight(context, 16),  // تعديل الارتفاع باستخدام responsiveHeight
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xff25AE4B) : Colors.grey[200],
          borderRadius: BorderRadius.circular(responsiveWidth(context, 12)), // تعديل نصف القطر باستخدام responsiveWidth
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: responsiveWidth(context, 11), // تعديل حجم الخط باستخدام responsiveWidth
          ),
        ),
      ),
    );
  }
}