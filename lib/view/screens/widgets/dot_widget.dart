import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotsNav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: SmoothPageIndicator(
        controller: PageController(initialPage: 2), // لا يوجد تحكم حقيقي
        count: 5, // عدد النقاط
        effect: ExpandingDotsEffect(
          activeDotColor: Colors.green,
          dotColor: Colors.grey.shade300,
          dotHeight: screenWidth * 0.015,
          dotWidth: screenWidth * 0.025,
          spacing: screenWidth * 0.01,
          radius: 12
        ),
      ),
    );
  }
}
