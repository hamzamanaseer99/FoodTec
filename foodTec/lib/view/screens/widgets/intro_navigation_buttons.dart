import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/location_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroNavigationButtons extends StatelessWidget {
  final int currentPage;
  final PageController pageController;

  IntroNavigationButtons({required this.currentPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            if (currentPage < 2) {
              pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else {
              // عندما يصل المستخدم إلى الصفحة الأخيرة، نقوم بتخزين قيمة hasSeenIntroPages
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('hasSeenIntroPages', true);  // تخزين القيمة

              Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen()));
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadowColor: Colors.transparent,
            elevation: 0,
          ),
          child: Ink(

            decoration: BoxDecoration(
              color: Color(0xff25AE4B),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(

              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 10)),
              child: Text('Continue'.tr(), style: TextStyle(fontSize: responsiveWidth(context, 16),
                  fontWeight: FontWeight.w600, color: Colors.white)),

            ),
          ),

        ),

        SizedBox(
            height: responsiveHeight(context, 30)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen()));              },
              child: Text(
                'Skip'.tr(),
                style: TextStyle(fontSize: responsiveWidth(context, 16), color: Colors.grey[700]),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: currentPage == index ? 12 : 8,
                  height: currentPage == index ? 12 : 8,
                  decoration: BoxDecoration(
                    color: currentPage == index
                        ? Colors.green
                        : Colors.grey.shade400,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),

            if (currentPage < 3 )
              IconButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                icon: Icon(Icons.arrow_forward, color: Color(0xff25AE4B)),
                iconSize: responsiveWidth(context, 24),
              ),
          ],
        ),
      ],
    );
  }
}