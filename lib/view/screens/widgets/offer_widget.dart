import 'package:flutter/material.dart';

class OfferWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // عرض الشاشة
    return Container(
      width: screenWidth * 0.9, // عرض متجاوب (90% من الشاشة)
      height: screenWidth * 0.35,
      decoration: BoxDecoration(
        color: Color(0xFF2BAE4A), // اللون الأخضر الرئيسي
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(

            color: Color(0xffD7D7D7),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ✅ القسم الخاص بالنص
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Experience our\ndelicious new dish",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.035,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "30% OFF",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.055,
                      fontWeight: FontWeight.w700,
                    fontFamily: "League Spartan",
                    //  fontFamily: "League Spartan",
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ✅ القسم الخاص بالصورة
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(15)
              ),

              child: Image.asset(
                width: 370,
                height: 141,
                "assets/images/pizza1.png", // تأكد من وضع الصورة في مجلد assets
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
