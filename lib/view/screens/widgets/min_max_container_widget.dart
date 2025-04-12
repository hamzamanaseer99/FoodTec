import 'package:flutter/material.dart';

Widget minMaxContainer(String text) {
  return Container(
    height: 40,
    width: 170,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(
        color: Color(0xffEAFAEB),
        width: 1,
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, top: 9, bottom: 9),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Color(0xff4B4B4B),
        ),
      ),
    ),
  );
}
