// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/responsive.dart';
// import 'package:foodtek/view/screens/success_order.dart';
// import 'package:foodtek/view/screens/widgets/card_number_widget.dart';
// import 'package:foodtek/view/screens/widgets/credit_card_widget.dart';
// import 'package:foodtek/view/screens/widgets/cvc_widget.dart';
// import 'package:foodtek/view/screens/widgets/expiry_widget.dart';
// import 'package:foodtek/view/screens/widgets/full_name_widget.dart';
// import 'package:foodtek/view/screens/widgets/notification_icon.dart';
// import 'package:foodtek/view/screens/widgets/pay_button.dart';
//
// class PaymentScreen extends StatelessWidget {
//   PaymentScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController fullNameController = TextEditingController();
//     final TextEditingController cardNumberController = TextEditingController();
//     final TextEditingController expiryEditingController = TextEditingController();
//     final TextEditingController cvcEditingController = TextEditingController();
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         actions: [NotificationIcon()],
//         automaticallyImplyLeading: false,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: responsiveWidth(context, 22),
//                 vertical: responsiveHeight(context, 30),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Add to card'.tr(),
//                     style: TextStyle(
//                       fontSize: responsiveWidth(context, 20),
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   SizedBox(height: responsiveHeight(context, 19)),
//                   CreditCardWidget(),
//                   SizedBox(
//                     height: responsiveHeight(context, 16),
//                   ),
//                   FullNameWidget(nameEditingController: fullNameController),
//                   SizedBox(
//                     height: responsiveHeight(context, 21),
//                   ),
//                   CardNumberWidget(cardNumberEditingController: cardNumberController),
//                   SizedBox(
//                     height: responsiveHeight(context, 20),
//                   ),
//                   Row(
//                     children: [
//                       ExpiryWidget(ExpiryEditingController: expiryEditingController),
//                       SizedBox(
//                         width: responsiveWidth(context, 16),
//                       ),
//                       CvcWidget(cvcEditingController: cvcEditingController),
//                     ],
//                   ),
//                   SizedBox(
//                     height: responsiveHeight(context, 20),
//                   ),
//
//                 ],
//               ),
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('We will send you an order details to your \n email after the successfull payment',
//                 style: TextStyle(
//                   fontSize: responsiveWidth(context, 12),
//                   color: Color(0xff929DA9),
//                 ),
//                 ),
//                 SizedBox(
//                   height: responsiveHeight(context, 16),
//                 ),
//                 PayButton(onPressed: (){
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context)=>SuccessOrder()));
//                 })
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart'; // تأكد من وجود هذه الاستيرادات
import 'package:foodtek/view/screens/widgets/credit_card_widget.dart'; // تأكد من وجود هذه الاستيرادات
import 'package:foodtek/view/screens/widgets/full_name_widget.dart'; // تأكد من وجود هذه الاستيرادات
import 'package:foodtek/view/screens/widgets/card_number_widget.dart'; // تأكد من وجود هذه الاستيرادات
import 'package:foodtek/view/screens/widgets/expiry_widget.dart'; // تأكد من وجود هذه الاستيرادات
import 'package:foodtek/view/screens/widgets/cvc_widget.dart'; // تأكد من وجود هذه الاستيرادات
import 'package:foodtek/view/screens/widgets/pay_button.dart'; // تأكد من وجود هذه الاستيرادات
import 'package:foodtek/view/screens/success_order.dart';

import '../../responsive.dart'; // تأكد من وجود هذه الاستيرادات

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController expiryEditingController = TextEditingController();
    final TextEditingController cvcEditingController = TextEditingController();

    final isDarkMode = Theme.of(context).brightness == Brightness.dark; // التحقق من الوضع الداكن

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // تغيير الخلفية بناءً على الوضع
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black : Colors.white, // تغيير خلفية الـ AppBar
        elevation: 0,
        actions: [NotificationIcon()],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 22),
                vertical: responsiveHeight(context, 30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add to card'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 20),
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون بناءً على الوضع
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 19)),
                  CreditCardWidget(),
                  SizedBox(
                    height: responsiveHeight(context, 16),
                  ),
                  FullNameWidget(nameEditingController: fullNameController),
                  SizedBox(
                    height: responsiveHeight(context, 21),
                  ),
                  CardNumberWidget(cardNumberEditingController: cardNumberController),
                  SizedBox(
                    height: responsiveHeight(context, 20),
                  ),
                  Row(
                    children: [
                      ExpiryWidget(ExpiryEditingController: expiryEditingController),
                      SizedBox(
                        width: responsiveWidth(context, 16),
                      ),
                      CvcWidget(cvcEditingController: cvcEditingController),
                    ],
                  ),
                  SizedBox(
                    height: responsiveHeight(context, 20),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'We will send you an order details to your \n email after the successfull payment',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 12),
                    color: isDarkMode ? Colors.white70 : Color(0xff929DA9), // تغيير اللون بناءً على الوضع
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context, 16),
                ),
                PayButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessOrder()),
                  );
                })
              ],
            )
          ],
        ),
      ),
    );
  }
}
