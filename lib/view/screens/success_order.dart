import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/live_track_screen.dart';
import 'package:foodtek/view/screens/order_details_screen.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
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
//                 'Checkout'.tr(),
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
//                       'Your Order Done Successfully'.tr(),
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
//                         'You will get your order within 12min. Thanks for using our services.'.tr(),
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
//                           'Track Your Order'.tr(),
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

class SuccessOrder extends StatelessWidget {
  const SuccessOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        actions: [NotificationIcon()],
        automaticallyImplyLeading: false,
        iconTheme: theme.iconTheme,
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
                'Checkout'.tr(),
                style: TextStyle(
                  fontSize: responsiveWidth(context, 20),
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color,
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
                      'Your Order Done Successfully'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 24),
                        fontWeight: FontWeight.w700,
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 12)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 10),
                      ),
                      child: Text(
                        'You will get your order within 12min. Thanks for using our services.'.tr(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: responsiveWidth(context, 18),
                          fontWeight: FontWeight.w400,
                          color: theme.textTheme.bodyMedium?.color?.withOpacity(0.7),
                        ),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 32)),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LiveTrackScreen()),
                          );
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
                          'Track Your Order'.tr(),
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
