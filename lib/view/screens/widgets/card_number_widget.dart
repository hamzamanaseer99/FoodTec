import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class CardNumberWidget extends StatefulWidget {
  CardNumberWidget({
    super.key,
    required this.cardNumberEditingController,
  });
  final TextEditingController cardNumberEditingController;

  @override
  State<CardNumberWidget> createState() => _CardNumberWidgetState();
}

class _CardNumberWidgetState extends State<CardNumberWidget> {
  bool showErrorNumber = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(12), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Soft shadow color
              blurRadius: 2, // How soft the shadow is
              spreadRadius: 0, // How much the shadow spreads
              offset: Offset(0, 1), // Moves shadow down (x: 0, y: 4)
            ),
          ],
        ),
        child: TextField(
          controller: widget.cardNumberEditingController,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.03,
          ),
          decoration: InputDecoration(
            labelText: 'Card Number',
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.025,
            ),
            hintText: "6578 8756 4238 92764",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.025,
            ),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04,
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffEDF1F3), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffEDF1F3), width: 2),
            ),
            suffixIcon: Padding(
              padding: EdgeInsets.all(6),
              child: Image.asset(
                'assets/images/credit_card.png',
                height: responsiveWidth(context, 26),
                width: responsiveWidth(context, 26),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
