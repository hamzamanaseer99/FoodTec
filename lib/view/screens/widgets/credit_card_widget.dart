import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class CreditCardWidget extends StatelessWidget {
  const CreditCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: responsiveHeight(context, 230),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Color(0xFF25AE4B), Color(0xFF097228)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(responsiveWidth(context, 20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Card title + logo
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Finaci',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: responsiveWidth(context, 20),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Image.asset(
                'assets/images/visa-logo.png',
                height: responsiveHeight(context, 40),
                width: responsiveWidth(context, 70),
                color: Colors.white,
              ),
            ],
          ),

          SizedBox(height: responsiveHeight(context, 18)),

          /// Card number
          Text(
            '**** **** **** 2345',
            style: TextStyle(
              color: Colors.white,
              fontSize: responsiveWidth(context, 20),
              letterSpacing: 2,
            ),
          ),

          SizedBox(height: responsiveHeight(context, 8)),

          /// SIM icon
          Image.asset(
            'assets/images/sim.png',
            height: responsiveHeight(context, 25),
            width: responsiveWidth(context, 35),
          ),

          SizedBox(
            height: responsiveHeight(context, 12),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Holder name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: responsiveWidth(context, 10),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 8)),
                  Text(
                    'Noman Manzoor',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveWidth(context, 13),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Expiry Date',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: responsiveWidth(context, 10),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 8)),
                  Text(
                    '02/30',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: responsiveWidth(context, 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
