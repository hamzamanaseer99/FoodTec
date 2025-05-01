// import 'package:flutter/material.dart';
//
// class IntroScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true, // لجعل الخلفية تمتد خلف الـ AppBar
//       appBar: AppBar(
//         backgroundColor: Colors.transparent, // جعل الخلفية شفافة
//         elevation: 0, // إزالة الظل
//         toolbarHeight: 0, // إخفاء الـ AppBar مع الاحتفاظ بشريط الحالة
//       ),
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/images/Pattern.png', // تأكد من إضافة الصورة في مجلد assets
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(
//                 child: Image.asset(
//                   'assets/images/Orderfood1.png',
//                   // تأكد من إضافة الصورة في مجلد assets
//                   fit: BoxFit.cover,
//                   width: 328,
//                   height: 328,
//                 ),
//               ),
//               Text(
//                 'Welcome To Sahlah',
//                 style: TextStyle(
//                     fontFamily: 'Inter',
//                     fontSize: 32,
//                     fontWeight: FontWeight.w500,
//                     color: Color(0xFF455A64)),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               SizedBox(
//                 width: 335,
//                 child: Align(
//                   alignment: Alignment.center,
//                   child: Text(
//                     'Enjoy A Fast And Smooth Food Delivery At Your Doorstep',
//                     style: TextStyle(
//                         fontSize: 16,
//                         height: 38.73 / 32,
//                         letterSpacing: 0.18,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFF455A64)),
//                     textAlign: TextAlign.center,
//                     maxLines: 2, // تحديد عدد الأسطر
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 40),
//               TextButton(
//                 onPressed: () {
//                   // إضافة أي إجراء تريده هنا
//                 },
//                 style: TextButton.styleFrom(
//                   minimumSize: Size(307, 48), // الحجم
//                   padding: EdgeInsets.zero, // إزالة الحشوة الداخلية
//                 ),
//                 child: DecoratedBox(
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Color(0xFF25AE4B), Color(0xFF0F481F)],
//                       // التدرج اللوني
//                       begin: Alignment.topLeft,
//                       // بداية التدرج
//                       end: Alignment.bottomRight, // نهاية التدرج
//                     ),
//                     borderRadius: BorderRadius.circular(25), // زوايا مدورة
//                   ),
//                   child: Container(
//                     width: 307, // العرض
//                     height: 48, // الارتفاع
//                     child: Center(
//                       child: Text(
//                         'Continue',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                           height: 19.36 / 16,
//                           letterSpacing: 0,
//                           color: Colors.white, // لون النص
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 50,
//         actions: [
//           TextButton(
//             onPressed: () {
//               _pageController.jumpToPage(2); // الانتقال إلى آخر صفحة
//             },
//             child: Text(
//               'Skip',
//               style: TextStyle(fontSize: 16, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // الخلفية
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//
//           // PageView للانتقال بين الصفحات
//           PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             children: [
//               _buildPage(
//                   'assets/images/Orderfood1.png', // صورة الصفحة الأولى
//                   'Welcome To Sahlah',
//                   'Enjoy A Fast And Smooth Food Delivery At Your Doorstep'),
//               _buildPage(
//                   'assets/images/TakeAway.png', // صورة الصفحة الثانية
//                   'Get Delivery On Time ',
//                   ' Order Your Favorite Food Within The Plam Of Your Hand And The Zone Of Your Comfort '),
//               _buildPage(
//                   'assets/images/TakeAway2.png', // صورة الصفحة الثالثة
//                   'Choose Your Food',
//                   'Order Your Favorite Food Within The Plam Of Your Hand And The Zone Of Your Comfort'),
//             ],
//           ),
//
//           // مؤشر النقاط أسفل الشاشة
//           Positioned(
//             bottom: 100,
//             left: 0,
//             right: 0,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(3, (index) {
//                 return AnimatedContainer(
//                   duration: Duration(milliseconds: 300),
//                   margin: EdgeInsets.symmetric(horizontal: 5),
//                   width: _currentPage == index ? 12 : 8,
//                   height: _currentPage == index ? 12 : 8,
//                   decoration: BoxDecoration(
//                     color: _currentPage == index
//                         ? Colors.green
//                         : Colors.grey.shade400,
//                     shape: BoxShape.circle,
//                   ),
//                 );
//               }),
//             ),
//           ),
//
//           // زر Next
//           Positioned(
//             bottom: 40,
//             left: 50,
//             right: 50,
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_currentPage < 2) {
//                   _pageController.nextPage(
//                       duration: Duration(milliseconds: 500),
//                       curve: Curves.ease);
//                 } else {
//                   // هنا يمكنك توجيه المستخدم إلى الشاشة الرئيسية
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 foregroundColor: Colors.white,
//                 minimumSize: Size(307, 48),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//               child: Text(
//                 _currentPage == 2 ? 'Get Started' : 'Next',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // دالة لإنشاء كل صفحة داخل الـ PageView
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
//               fontSize: 32, fontWeight: FontWeight.w500, color:Color(0xFF455A64)),
//           textAlign: TextAlign.center,
//         ),
//         SizedBox(height: 20),
//         SizedBox(
//           width: 335,
//           child: Text(
//             subtitle,
//             style: TextStyle(fontSize: 16, color:Color(0xFF455A64)),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ],
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class IntroScreen extends StatefulWidget {
//   @override
//   _IntroScreenState createState() => _IntroScreenState();
// }
//
// class _IntroScreenState extends State<IntroScreen> {
//   PageController _pageController = PageController();
//   int _currentPage = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         toolbarHeight: 50,
//       ),
//       body: Stack(
//         children: [
//           // الخلفية
//           Image.asset(
//             'assets/images/Pattern.png',
//             fit: BoxFit.cover,
//             width: double.infinity,
//             height: double.infinity,
//           ),
//
//           // PageView للانتقال بين الصفحات
//           PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _currentPage = index;
//               });
//             },
//             children: [
//               _buildPage(
//                   'assets/images/Orderfood1.png',
//                   'Welcome To Sahlah',
//                   'Enjoy A Fast And Smooth Food Delivery At Your Doorstep'),
//               _buildPage(
//                   'assets/images/TakeAway.png',
//                   'Get Delivery On Time',
//                   'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'),
//               _buildPage(
//                   'assets/images/TakeAway2.png',
//                   'Choose Your Food',
//                   'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'),
//             ],
//           ),
//
//           // الزر السفلي ومؤشر النقاط
//           Positioned(
//             bottom: 40,
//             left: 20,
//             right: 20,
//             child: Column(
//               children: [
//                 // زر "Next" / "Get Started"
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_currentPage < 2) {
//                       _pageController.nextPage(
//                           duration: Duration(milliseconds: 500),
//                           curve: Curves.ease);
//                     } else {
//                       // هنا يمكنك توجيه المستخدم إلى الشاشة الرئيسية
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     foregroundColor: Colors.white,
//                     minimumSize: Size(double.infinity, 48),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   child: Text(
//                     _currentPage == 2 ? 'Get Started' : 'Next',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//
//                 SizedBox(height: 20),
//
//                 // أزرار "Skip" و "Next" مع مؤشر النقاط
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         _pageController.jumpToPage(2); // الانتقال إلى آخر صفحة
//                       },
//                       child: Text(
//                         'Skip',
//                         style: TextStyle(fontSize: 16, color: Colors.grey[700]),
//                       ),
//                     ),
//
//                     // مؤشر النقاط (Dots Indicator)
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(3, (index) {
//                         return AnimatedContainer(
//                           duration: Duration(milliseconds: 300),
//                           margin: EdgeInsets.symmetric(horizontal: 5),
//                           width: _currentPage == index ? 12 : 8,
//                           height: _currentPage == index ? 12 : 8,
//                           decoration: BoxDecoration(
//                             color: _currentPage == index
//                                 ? Colors.green
//                                 : Colors.grey.shade400,
//                             shape: BoxShape.circle,
//                           ),
//                         );
//                       }),
//                     ),
//
//                     // زر الانتقال (Next) مع السهم
//                     IconButton(
//                       onPressed: () {
//                         if (_currentPage < 2) {
//                           _pageController.nextPage(
//                               duration: Duration(milliseconds: 500),
//                               curve: Curves.ease);
//                         } else {
//                           // هنا يمكنك توجيه المستخدم إلى الشاشة الرئيسية
//                         }
//                       },
//                       icon: Icon(Icons.arrow_forward, color: Colors.green),
//                       iconSize: 30,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // دالة لإنشاء كل صفحة داخل الـ PageView
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
import 'package:foodtek/homescreen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cubit/location_cubit.dart';


class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  bool _hasSeenIntroPages = false;

  @override
  void initState() {
    super.initState();
    _checkIfAppOpenedBefore();
  }

  // التحقق إذا كان التطبيق تم فتحه من قبل
  Future<void> _checkIfAppOpenedBefore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _hasSeenIntroPages = prefs.getBool('hasSeenIntroPages') ?? false;
    });
  }

  // تحديث حالة تم عرض الصفحات
  Future<void> _setIntroPagesShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('hasSeenIntroPages', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 50,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildPage('assets/images/Orderfood1.png',
                  'Welcome To Sahlah'.tr(),
                  'Enjoy A Fast And Smooth Food Delivery At Your Doorstep'.tr()),
              _buildPage(
                  'assets/images/TakeAway.png',
                  'Get Delivery On Time'.tr(),
                  'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'.tr()),
              _buildPage(
                  'assets/images/TakeAway2.png',
                  'Choose Your Food'.tr(),
                  'Order Your Favorite Food Within The Palm Of Your Hand And The Zone Of Your Comfort'.tr()),
                _buildLocationPermissionPage(),
            ],
          ),
         // _hasSeenIntroPages ? Homescreen() : IntroScreen(),
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              children: [

                ElevatedButton(
                  onPressed: () async {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    } else if (_currentPage == 2) {
                      // عند الضغط على الزر في الصفحة 2، ننتقل إلى صفحة تفعيل الموقع
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => _buildLocationPermissionPage()),
                      );
                    } else {
                      await _enableLocation();
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
                      color: Color(0xff25AE4B),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      child: Text(
                        _currentPage == 2
                            ? 'Continue'.tr()
                            : _currentPage == 3
                            ? 'Continue'.tr()
                            : 'Next'.tr(),
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        _pageController.jumpToPage(3);
                      },
                      child: Text(
                        'Skip'.tr(),
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          width: _currentPage == index ? 12 : 8,
                          height: _currentPage == index ? 12 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Color(0xff25AE4B)
                                : Colors.grey.shade400,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),

                    if (_currentPage < 3)
                      IconButton(
                        onPressed: () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                        icon: Icon(Icons.arrow_forward, color: Color(0xff25AE4B)),
                        iconSize: 30,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 328,
          height: 328,
        ),
        SizedBox(height: 20),
        Text(
          title.tr(),
          style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w500, color: Color(0xFF455A64)),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        SizedBox(
          width: 335,
          child: Text(
            subtitle,
            style: TextStyle(fontSize: 16, color: Color(0xFF455A64)),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  //
  // Widget _buildLocationPermissionPage() {
  //   return Scaffold(
  //
  //     body: Stack(
  //
  //       children: [
  //
  //
  //         Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //
  //               Image.asset(
  //                 'assets/images/TakeAway2.png',
  //                 width: 328,
  //                 height: 328,
  //               ),
  //               SizedBox(height: 20),
  //               Text(
  //                 'Enable Location'.tr(),
  //                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Color(0xFF455A64)),
  //                 textAlign: TextAlign.center,
  //               ),
  //               SizedBox(height: 20),
  //               SizedBox(
  //                 width: 335,
  //                 child: Text(
  //                   'To provide better service, we need access to your location. Please enable location services.'.tr(),
  //                   style: TextStyle(fontSize: 16, color: Color(0xFF455A64)),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               ),
  //               SizedBox(height: 40),
  //
  //               ElevatedButton(
  //                 onPressed: () async {
  //                   await _enableLocation();
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Color(0xff25AE4B),
  //                   foregroundColor: Colors.white,
  //                   minimumSize: Size(307, 48),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(25),
  //                   ),
  //                 ),
  //                 child: Text(
  //                   'Enable Location'.tr(),
  //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  //                 ),
  //               ),
  //
  //               SizedBox(height: 20),
  //
  //               // زر إلغاء (Cancel)
  //               TextButton(
  //                 onPressed: () {
  //                   Navigator.pushReplacementNamed(context, '/home');
  //                 },
  //                 child: Text(
  //                   'Cancel'.tr(),
  //                   style: TextStyle(
  //                     fontSize: 16,
  //                     color: Colors.white,
  //                     fontWeight: FontWeight.w600,
  //                   ),
  //                 ),
  //                 style: ElevatedButton.styleFrom(
  //                   backgroundColor: Colors.grey,
  //                   foregroundColor: Colors.white,
  //                   minimumSize: Size(307, 48),
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(25),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  Widget _buildLocationPermissionPage() {
    return Scaffold(
      body: Stack(
        children: [
          BlocListener<LocationCubit, LocationState>(
            listener: (context, state) {
              if (state is LocationLoaded) {
                // إعادة التوجيه إلى الصفحة الرئيسية إذا نجح تحديد الموقع
                Navigator.pushReplacementNamed(context, '/home');
              } else if (state is LocationError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Failed to get location'.tr())),
                );
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/TakeAway2.png',
                    width: 328,
                    height: 328,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Enable Location'.tr(),
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF455A64),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 335,
                    child: Text(
                      'To provide better service, we need access to your location. Please enable location services.'.tr(),
                      style: TextStyle(fontSize: 16, color: Color(0xFF455A64)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 40),
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      final isLoading = state is LocationLoading;

                      return ElevatedButton(
                        onPressed: isLoading
                            ? null
                            : () async {
                          context.read<LocationCubit>().getCurrentLocation();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff25AE4B),
                          foregroundColor: Colors.white,
                          minimumSize: Size(307, 48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: isLoading
                            ? SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                            : Text(
                          'Enable Location'.tr(),
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                      minimumSize: Size(307, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'Cancel'.tr(),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _enableLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print("تم تحديد الموقع: ${position.latitude}, ${position.longitude}");
    } else {
      print("تم رفض الإذن!");
    }
  }
}
