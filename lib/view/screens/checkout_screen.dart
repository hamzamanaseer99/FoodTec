// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/cart_cubit.dart';
// import 'package:foodtek/responsive.dart';
// import 'package:foodtek/view/screens/widgets/notification_icon.dart';
// import 'package:foodtek/view/screens/widgets/radio_widget.dart';
// import 'package:foodtek/view/screens/widgets/section_price_widget.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';
//
// class CheckoutScreen extends StatefulWidget {
//   final LatLng? userLocation;
//
//   const CheckoutScreen({super.key, required this.userLocation});
//
//   @override
//   State<CheckoutScreen> createState() => _CheckoutScreenState();
// }
//
// class _CheckoutScreenState extends State<CheckoutScreen> {
//   final TextEditingController promoController = TextEditingController();
//   final List<Map<String, String>> addresses = [
//     {
//       "title": "88 Zurab Gorgiladze St",
//       "subtitle": "Georgia, Batumi",
//     },
//     {
//       "title": "5 Noe Zhordania St",
//       "subtitle": "Georgia, Batumi",
//     },
//   ];
//
//   int? selectedPaymentOption = 0; // For radio buttons
//   String selectedAddressTitle = "No location selected";
//
//   @override
//   void initState() {
//     super.initState();
//     // تحويل إحداثيات الموقع إلى عنوان نصي
//     _convertCoordinatesToAddress(widget.userLocation);
//   }
//
//   // دالة لتحويل الإحداثيات إلى عنوان نصي
//   Future<void> _convertCoordinatesToAddress(LatLng? location) async {
//     if (location != null) {
//       try {
//         // استخدم مكتبة geocoding لتحويل الإحداثيات إلى عنوان
//         List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude, location.longitude);
//         if (placemarks.isNotEmpty) {
//           // اختر أول عنوان
//           final placemark = placemarks.first;
//           setState(() {
//             selectedAddressTitle = "${placemark.street}, ${placemark.locality}, ${placemark.country}";
//           });
//         }
//       } catch (e) {
//         print("Error getting address: $e");
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final cartItems = context.watch<CartCubit>().state;
//     final subTotal = cartItems.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
//     final deliveryCharge = 3.0;
//     final discount = 2.0;
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
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: responsiveWidth(context, 22),
//                 vertical: responsiveHeight(context, 30),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Checkout'.tr(), style: TextStyle(fontSize: responsiveWidth(context, 20), fontWeight: FontWeight.w600)),
//                   SizedBox(height: responsiveHeight(context, 18)),
//                   Text('Pay With:'.tr(), style: TextStyle(fontSize: responsiveWidth(context, 18), fontWeight: FontWeight.w600)),
//
//                   // عرض الموقع المحدد باستخدام العنوان النصي
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 6)),
//                     child: ListTile(
//                       leading: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
//                       title: Text(
//                         selectedAddressTitle,
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: responsiveHeight(context, 24)),
//
//                   // باقي العناصر في الـ UI (مثل إدخال كود الخصم، خيارات الدفع)
//                   Text('Promo Code?'.tr(), style: TextStyle(fontSize: responsiveWidth(context, 18), fontWeight: FontWeight.w600)),
//                   SizedBox(height: responsiveHeight(context, 16)),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: responsiveHeight(context, 48),
//                           child: TextField(
//                             controller: promoController,
//                             style: TextStyle(fontSize: responsiveHeight(context, 14)),
//                             decoration: InputDecoration(
//                               hintText: 'Enter Your Promo'.tr(),
//                               hintStyle: TextStyle(color: Color(0xff878787), fontSize: responsiveWidth(context, 14)),
//                               fillColor: Colors.white,
//                               contentPadding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 12), horizontal: responsiveWidth(context, 12)),
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   bottomLeft: Radius.circular(10),
//                                 ),
//                                 borderSide: BorderSide.none,
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   bottomLeft: Radius.circular(10),
//                                 ),
//                                 borderSide: BorderSide(color: Color(0xffD6D6D6), width: 1),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(10),
//                                   bottomLeft: Radius.circular(10),
//                                 ),
//                                 borderSide: BorderSide(color: Color(0xffD6D6D6), width: 1),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         height: responsiveHeight(context, 48),
//                         child: TextButton(
//                           onPressed: () {
//                             // Handle promo code addition
//                           },
//                           style: TextButton.styleFrom(
//                             side: BorderSide(color: Color(0xff4FAF5A)),
//                             backgroundColor: Color(0xff4FAF5A),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(10),
//                                 bottomRight: Radius.circular(10),
//                               ),
//                             ),
//                           ),
//                           child: Text(
//                             'Add'.tr(),
//                             style: TextStyle(color: Colors.white, fontSize: responsiveWidth(context, 12), fontWeight: FontWeight.w400),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: responsiveHeight(context, 24)),
//                   Text('Pay with:'.tr(), style: TextStyle(fontSize: responsiveWidth(context, 18), fontWeight: FontWeight.w600)),
//                   RadioWidget(),
//                 ],
//               ),
//             ),
//             SizedBox(height: responsiveHeight(context, 16)),
//             Column(
//               children: [
//                 buildCheckoutSection(
//                   context,
//                   subTotal,
//                   deliveryCharge,
//                   discount,
//                   onPlaceOrderTap: () {
//                     Navigator.pushNamed(context, '/payment');
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/radio_widget.dart';
import 'package:foodtek/view/screens/widgets/section_price_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class CheckoutScreen extends StatefulWidget {
  final LatLng? userLocation;

  const CheckoutScreen({super.key, required this.userLocation});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController promoController = TextEditingController();
  final List<Map<String, String>> addresses = [
    {
      "title": "88 Zurab Gorgiladze St",
      "subtitle": "Georgia, Batumi",
    },
    {
      "title": "5 Noe Zhordania St",
      "subtitle": "Georgia, Batumi",
    },
  ];

  int? selectedPaymentOption = 0; // For radio buttons
  String selectedAddressTitle = "No location selected";

  @override
  void initState() {
    super.initState();
    // تحويل إحداثيات الموقع إلى عنوان نصي
    _convertCoordinatesToAddress(widget.userLocation);
  }

  // دالة لتحويل الإحداثيات إلى عنوان نصي
  Future<void> _convertCoordinatesToAddress(LatLng? location) async {
    if (location != null) {
      try {
        // استخدم مكتبة geocoding لتحويل الإحداثيات إلى عنوان
        List<Placemark> placemarks = await placemarkFromCoordinates(location.latitude, location.longitude);
        if (placemarks.isNotEmpty) {
          // اختر أول عنوان
          final placemark = placemarks.first;
          setState(() {
            selectedAddressTitle = "${placemark.street}, ${placemark.locality}, ${placemark.country}";
          });
        }
      } catch (e) {
        print("Error getting address: $e");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state;
    final subTotal = cartItems.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
    final deliveryCharge = 3.0;
    final discount = 2.0;

    final isDarkMode = Theme.of(context).brightness == Brightness.dark; // التحقق من الوضع الداكن

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white, // تغيير الخلفية بناءً على الوضع
      appBar: AppBar(
        backgroundColor: isDarkMode ? Colors.black26 : Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // نوقف الزر التلقائي
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop(); // العودة للشاشة السابقة
          },
        ),
        actions: [
          NotificationIcon(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Checkout'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 20),
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون حسب الوضع
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 18)),
                  Text(
                    'Pay With:'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 18),
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون
                    ),
                  ),

                  // عرض الموقع المحدد باستخدام العنوان النصي
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 6)),
                    child: ListTile(
                      leading: Icon(Icons.location_on, color: isDarkMode ? Colors.greenAccent : Color(0xff4FAF5A)),
                      title: Text(
                        selectedAddressTitle,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 24)),

                  // باقي العناصر في الـ UI (مثل إدخال كود الخصم، خيارات الدفع)
                  Text(
                    'Promo Code?'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 18),
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 16)),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          height: responsiveHeight(context, 48),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.grey[850] : Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            border: Border.all(
                              color: isDarkMode ? Colors.white54 : Color(0xffD6D6D6),
                            ),
                          ),
                          child: TextField(
                            controller: promoController,
                            style: TextStyle(
                              fontSize: responsiveHeight(context, 14),
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Enter Your Promo'.tr(),
                              hintStyle: TextStyle(
                                color: isDarkMode ? Colors.white54 : Color(0xff878787),
                                fontSize: responsiveWidth(context, 14),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: responsiveHeight(context, 12),
                                horizontal: responsiveWidth(context, 12),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8), // مسافة بسيطة بين الحقل والزر
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          height: responsiveHeight(context, 48),
                          child: TextButton(
                            onPressed: () {
                              // Handle promo code addition
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: isDarkMode
                                  ? Colors.green.withOpacity(0.2)
                                  : const Color(0xff4FAF5A).withOpacity(0.1),
                              foregroundColor:
                              isDarkMode ? Colors.greenAccent : const Color(0xff4FAF5A),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),


                                ),
                                side: BorderSide(
                                  color: isDarkMode ? Colors.greenAccent : const Color(0xff4FAF5A),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Text(
                              'Add'.tr(),
                              style: TextStyle(
                                color: isDarkMode ? Colors.greenAccent : const Color(0xff4FAF5A),
                                fontSize: responsiveWidth(context, 14),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: responsiveHeight(context, 24)),
                  Text(
                    'Pay with:'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 18),
                      fontWeight: FontWeight.w600,
                      color: isDarkMode ? Colors.white : Colors.black, // تغيير اللون
                    ),
                  ),
                  RadioWidget(),
                ],
              ),
            ),
            SizedBox(height: responsiveHeight(context, 16)),
            Column(
              children: [
                buildCheckoutSection(
                  context,
                  subTotal,
                  deliveryCharge,
                  discount,
                  onPlaceOrderTap: () {
                    Navigator.pushNamed(context, '/payment');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
