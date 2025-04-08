import 'package:flutter/cupertino.dart';
import 'package:foodtek/view/screens/widgets/dot_widget.dart';
import 'package:foodtek/view/screens/widgets/offer_widget.dart';
import 'package:foodtek/view/screens/widgets/recommended_products.dart';
import 'package:foodtek/view/screens/widgets/top_rated_products.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OfferWidget(),
          SizedBox(height: 6),
          DotsNav(),
          SizedBox(height: 6),
          Text(
            'Top Rated',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(height: 12),
          TopRatedProducts(),
          SizedBox(height: 15),
          RecommendedProducts(),
        ],
      ),
    );
  }
}
