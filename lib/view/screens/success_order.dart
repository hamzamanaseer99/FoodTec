// import 'package:flutter/material.dart';
// import 'package:foodtek/responsive.dart';
// import 'package:foodtek/view/screens/live_track_screen.dart';
// import 'package:foodtek/view/screens/order_details_screen.dart';
// import 'package:foodtek/view/screens/widgets/notification_icon.dart';
//
// class SuccessOrder extends StatelessWidget {
//   const SuccessOrder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [NotificationIcon()],
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: responsiveWidth(context, 22),
//             vertical: responsiveHeight(context, 30),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Checkout',
//                 style: TextStyle(
//                   fontSize: responsiveWidth(context, 20),
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(height: responsiveHeight(context, 100)),
//               Center(
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       'assets/images/Group1.png',
//                       fit: BoxFit.contain,
//                     ),
//                     SizedBox(height: responsiveHeight(context, 24)),
//                     Text(
//                       'Your Order Done Successfully',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: responsiveWidth(context, 24),
//                         fontWeight: FontWeight.w700,
//                       ),
//                     ),
//                     SizedBox(height: responsiveHeight(context, 12)),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: responsiveWidth(context, 10),
//                       ),
//                       child: Text(
//                         'You will get your order within 12min. Thanks for using our services.',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: responsiveWidth(context, 18),
//                           fontWeight: FontWeight.w400,
//                           color: Colors.grey[700],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: responsiveHeight(context, 32)),
//                     Center(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>LiveTrackScreen()));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.green,
//                           padding: EdgeInsets.symmetric(
//                             horizontal: responsiveWidth(context, 40),
//                             vertical: responsiveHeight(context, 16),
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text(
//                           'Track Your Order',
//                           style: TextStyle(
//                             fontSize: responsiveWidth(context, 18),
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/live_track_screen.dart';
import 'package:foodtek/view/screens/order_details_screen.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark; // التحقق من الوضع الداكن

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // تغيير خلفية الشاشة
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white, // تغيير خلفية الـ AppBar
        elevation: 0,
        actions: [NotificationIcon()],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 22),
            vertical: responsiveHeight(context, 30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Checkout',
                style: TextStyle(
                  fontSize: responsiveWidth(context, 20),
                  fontWeight: FontWeight.w600,
                  color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون بناءً على الوضع
                ),
              ),
              SizedBox(height: responsiveHeight(context, 100)),
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/Group1.png',
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: responsiveHeight(context, 24)),
                    Text(
                      'Your Order Done Successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 24),
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون بناءً على الوضع
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 12)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 10),
                      ),
                      child: Text(
                        'You will get your order within 12min. Thanks for using our services.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 18),
                          fontWeight: FontWeight.w400,
                          color: isDarkMode ? Colors.white70 : Colors.grey[700], // تغيير اللون بناءً على الوضع
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 32)),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LiveTrackScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                            horizontal: responsiveWidth(context, 40),
                            vertical: responsiveHeight(context, 16),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Track Your Order',
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 18),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
