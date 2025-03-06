import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screens/location_screen.dart';

class IntroNavigationButtons extends StatelessWidget {
  final int currentPage;
  final PageController pageController;

  IntroNavigationButtons({required this.currentPage, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            if (currentPage < 2) {
              pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
            } else {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen()));
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 48),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            shadowColor: Colors.transparent,
          ),
          child: Ink(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 14),
    child: Text(currentPage == 2 ? 'Get Started' : 'Next', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),

            ),
          ),
        ),

        SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                pageController.jumpToPage(2);
              },
              child: Text(
                'Skip',
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
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

            if (currentPage < 3)
              IconButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease);
                },
                icon: Icon(Icons.arrow_forward, color: Colors.green),
                iconSize: 30,
              ),
          ],
        ),
      ],
    );
  }
}
