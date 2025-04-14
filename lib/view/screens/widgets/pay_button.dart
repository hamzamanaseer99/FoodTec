import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class PayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 30),
        vertical: responsiveHeight(context, 16),
      ),
      child: SizedBox(
        width: double.infinity,
        height: responsiveHeight(context, 50),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF25AE4B),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 2,
          ),
          onPressed: onPressed,
          icon: Icon(Icons.lock, color: Colors.white, size: responsiveWidth(context, 18)),
          label: Text(
            'Pay for the order',
            style: TextStyle(
              color: Colors.white,
              fontSize: responsiveWidth(context, 15),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
