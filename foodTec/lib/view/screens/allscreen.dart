import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/dot_widget.dart';
import 'package:foodtek/view/screens/widgets/offer_widget.dart';
import 'package:foodtek/view/screens/widgets/recommended_products.dart';
import 'package:foodtek/view/screens/widgets/top_rated_products.dart';

class AllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // الحصول على الثيم الحالي
    final isDark = theme.brightness == Brightness.dark; // التحقق إذا كان الثيم داكنًا

    return SingleChildScrollView(

      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        color: isDark ? Colors.black : Colors.white, // تغيير لون الخلفية حسب الثيم
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OfferWidget(),
            SizedBox(height: responsiveHeight(context, 6)),
            DotsNav(),
            SizedBox(height: responsiveHeight(context, 6)),
            Text(
              'Top Rated'.tr(),
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: responsiveWidth(context, 16),
                color: isDark ? Colors.white : Colors.black, // تغيير لون النص حسب الثيم
              ),
            ),
            SizedBox(height: responsiveHeight(context, 12)),
            TopRatedProducts(),
            SizedBox(height: responsiveHeight(context, 15)),
            RecommendedProducts(),
            SizedBox(height: responsiveHeight(context, 32)),
          ],
        ),
      ),
    );
  }
}
