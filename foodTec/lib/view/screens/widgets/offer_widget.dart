import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class OfferWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: responsiveHeight(context, 120),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF2BAE4A),
              borderRadius: BorderRadius.circular(8),
             
            ),
          ),


          Positioned(
            top: -20,
            right: screenWidth * 0.48,
            child: Container(
              width: responsiveWidth(context, 40),
              height: responsiveHeight(context, 40),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFEDC5A), width: 10),
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent,
              ),
            ),
          ),

          // Yellow circle bottom left
          Positioned(
            bottom: -20,
            left: -10,
            child: Container(
              width: responsiveWidth(context, 40),
              height: responsiveHeight(context, 40),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFFEDC5A), width: 10),
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent,
              ),
            ),
          ),

          Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: responsiveWidth(context, 20),),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Experience our delicious new dish".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsiveWidth(context, 16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: responsiveHeight(context, 8)),
                      Text(
                        "30% OFF".tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: responsiveWidth(context, 32),
                          fontWeight: FontWeight.w700,
                          fontFamily: "League Spartan",
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Right image section
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    "assets/images/pizza1.png",
                    fit: BoxFit.cover,
                    height: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
