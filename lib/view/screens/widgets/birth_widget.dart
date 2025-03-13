import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BirthWidget extends StatelessWidget {
  BirthWidget({
    super.key,
    required this.BithEditingController,
  });
  bool showErrorName = false;
  final TextEditingController BithEditingController;

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
          controller: BithEditingController,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.03
          ),
          decoration: InputDecoration(
            labelText: 'Birth of date',
            labelStyle: TextStyle(
              fontSize: screenWidth * 0.025,

            ),
            hintText: "YYYY-MM-DD",
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.025,

            ),
            suffixIcon: Icon(Icons.calendar_month_rounded),
            fillColor: Colors.white, // ✅ Matches container color
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04, // ✅ نفس التناسب مع الشاشة
              horizontal: screenWidth * 0.04,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none, // ✅ No border (shadow does the job)
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffEDF1F3), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffEDF1F3), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
