import 'package:flutter/material.dart';

class RecommendedWidget extends StatelessWidget {
  final String image;
  final double price;

  const RecommendedWidget({super.key, required this.image, required this.price});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // عرض الشاشة
    double screenHeight = MediaQuery.of(context).size.height; // ارتفاع الشاشة

    double containerWidth = screenWidth * 0.18;  // يجعل العرض نسبيًا
    double containerHeight = screenHeight * 0.15;  // يجعل الارتفاع نسبيًا
    double borderRadius = containerWidth * 0.3; // يجعل الحواف متناسبة
    double fontSize = screenWidth * 0.02; // يجعل حجم الخط متناسبًا مع الشاشة

    return Container(
      width: containerWidth,
      height: containerHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Stack(
        children: [
          // 🔥 Food Image with Rounded Corners
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Image.asset(
              image,
              width: containerWidth,
              height: containerHeight,
              fit: BoxFit.cover,
            ),
          ),

          // 🔥 Price Tag Positioned at the Bottom Right
          Positioned(
            bottom: containerHeight * 0.2,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: containerWidth * 0.050,
                  vertical: containerHeight * 0.05
              ),
              decoration: BoxDecoration(
                color: const Color(0xff25AE4B),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                  topLeft: Radius.circular(30)
                ),
              ),
              child: Text(
                '\$${price.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
