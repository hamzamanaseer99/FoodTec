import 'package:flutter/material.dart';

class ConfirmPasswordWidget extends StatefulWidget {
  final TextEditingController confirmPasswordEditingController;

  const ConfirmPasswordWidget({
    super.key,
    required this.confirmPasswordEditingController,
  });

  @override
  State<ConfirmPasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<ConfirmPasswordWidget> {
  bool obscureText = true;

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
          controller: widget.confirmPasswordEditingController,
          obscureText: obscureText,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.03, // ✅ جعل الخط متجاوبًا
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: screenWidth * 0.04, // ✅ نفس التناسب مع الشاشة
              horizontal: screenWidth * 0.04,
            ),
            labelText: 'Confirm Password',
            hintText: "Enter your Password",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey
              ),
            ),
            fillColor: Colors.white, // ✅ Matches container color
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
