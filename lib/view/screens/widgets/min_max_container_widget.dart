import 'package:flutter/cupertino.dart';
import 'package:foodtek/responsive.dart';

Widget minMaxContainer(BuildContext context, String text) {
  return Container(
    height: responsiveHeight(context, 40), // تعديل الارتفاع باستخدام responsiveHeight
    width: responsiveWidth(context, 160),  // تعديل العرض باستخدام responsiveWidth
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(responsiveWidth(context, 5)), // تعديل نصف القطر باستخدام responsiveWidth
      border: Border.all(
        color: const Color(0xffEAFAEB),
        width: 1,
      ),
    ),
    child: Padding(
      padding: EdgeInsets.only(
        left: responsiveWidth(context, 10),  // تعديل الهوامش باستخدام responsiveWidth
        top: responsiveHeight(context, 9),   // تعديل الهوامش باستخدام responsiveHeight
        bottom: responsiveHeight(context, 9),// تعديل الهوامش باستخدام responsiveHeight
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: responsiveWidth(context, 16), // تعديل حجم الخط باستخدام responsiveWidth
          color: const Color(0xff4B4B4B),
        ),
      ),
    ),
  );
}