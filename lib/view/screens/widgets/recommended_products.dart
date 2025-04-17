import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/widgets/recomended_widget.dart';

class RecommendedProducts extends StatelessWidget {
  final String? filter;

  const RecommendedProducts({this.filter, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Recommended'.tr(), style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w600)),
            Row(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('View All'.tr(), style: TextStyle(color: Color(0xff25AE4B), fontSize: screenWidth * 0.035)),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xff25AE4B)),
              ],
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            RecommendedWidget(image: 'assets/images/sushi1.png', price: 103.0),
            SizedBox(width: 16),
            RecommendedWidget(image: 'assets/images/breakfast2.png', price: 50.0),
            SizedBox(width: 16),
            RecommendedWidget(image: 'assets/images/breakfast.png', price: 12.99),
            SizedBox(width: 16),
            RecommendedWidget(image: 'assets/images/icecreem.png', price: 8.20),
          ],
        ),
      ],
    );
  }
}
