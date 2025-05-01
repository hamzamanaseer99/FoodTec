// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/location_cubit.dart';
//
// import 'location_screen.dart';
//
// class IntroScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           PageView(
//             children: [
//               _buildPage('assets/images/Orderfood1.png', 'Welcome To Sahlah',
//                   'Enjoy A Fast And Smooth Food Delivery At Your Doorstep'),
//               _buildPage(
//                   'assets/images/TakeAway.png',
//                   'Get Delivery On Time',
//                   'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'),
//               _buildPage(
//                   'assets/images/TakeAway2.png',
//                   'Choose Your Food',
//                   'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'),
//               LocationScreen(), // شاشة تحديد الموقع
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPage(String imagePath, String title, String subtitle) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Image.asset(
//           imagePath,
//           width: 328,
//           height: 328,
//         ),
//         SizedBox(height: 20),
//         Text(
//           title,
//           style: TextStyle(
//               fontSize: 32, fontWeight: FontWeight.w500, color: Color(0xFF455A64)),
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: 20),
//         SizedBox(
//           width: 335,
//           child: Text(
//             subtitle,
//             style: TextStyle(fontSize: 16, color: Color(0xFF455A64)),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/intro_cubit.dart';
import 'package:foodtek/homescreen.dart';
import 'package:foodtek/view/screens/location_screen.dart';
import 'package:foodtek/view/screens/widgets/intro_navigation_buttons.dart';

class IntroScreen extends StatelessWidget {
  final PageController _pageController = PageController();

  // البيانات الخاصة بكل صفحة: صورة، عنوان، نص فرعي، عرض وارتفاع الصورة
  final List<Map<String, dynamic>> pages = [
    {
      'imagePath': 'assets/images/Orderfood1.png',
      'title': 'Welcome To Sahlah'.tr(),
      'subtitle': 'Enjoy A Fast And Smooth Food Delivery At Your Doorstep'.tr(),
      'imageWidth': 328.0,
      'imageHeight': 328.0,
    },
    {
      'imagePath': 'assets/images/TakeAway.png',
      'title': 'Get Delivery On Time'.tr(),
      'subtitle':
      'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'.tr(),
      'imageWidth': 328.0,
      'imageHeight': 219.0,
    },
    {
      'imagePath': 'assets/images/TakeAway2.png',
      'title': 'Choose Your Food'.tr(),
      'subtitle':
      'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'.tr(),
      'imageWidth': 328.0,
      'imageHeight': 219.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => IntroCubit(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/Pattern.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            BlocBuilder<IntroCubit, int>(
              builder: (context, currentPage) {
                return PageView(
                  controller: _pageController,
                  onPageChanged: (index) =>
                      context.read<IntroCubit>().goToPage(index),
                  children: pages.map((page) {
                    return _buildPage(
                      context,
                      page['imagePath'],
                      page['title'.tr()],
                      page['subtitle'.tr()],
                      page['imageWidth'],
                      page['imageHeight'],
                    );
                  }).toList(),
                );
              },
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: BlocBuilder<IntroCubit, int>(
                builder: (context, currentPage) {
                  return IntroNavigationButtons(
                    currentPage: currentPage,
                    pageController: _pageController,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context, String imagePath, String title,
      String subtitle, double imageWidth, double imageHeight) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage('assets/images/Rectangle.png'),
          fit: BoxFit.contain,
          alignment: Alignment(0, 2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: screenWidth * 0.7,
            height: screenHeight * 0.3,
          ),
          SizedBox(height: screenHeight * 0.001),
          Text(
            title,
            style: TextStyle(
                fontSize: screenWidth * 0.09, // حجم النص 8% من عرض الشاشة
                fontWeight: FontWeight.w500,
                color: Color(0xFF455A64)),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: screenHeight * 0.001,),
          SizedBox(
            width: screenWidth * 0.8, // عرض النص بنسبة 80% من العرض
            child: Text(
              subtitle,
              style: TextStyle(
                  fontSize: 16, // حجم النص 4.5% من عرض الشاشة
                  color: Color(0xFF455A64)),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
