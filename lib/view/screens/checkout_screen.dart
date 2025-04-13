import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/radio_widget.dart';
import 'package:foodtek/view/screens/widgets/section_price_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

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

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state;
    final subTotal = cartItems.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
    final deliveryCharge = 3.0;
    final discount = 2.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [NotificationIcon()],
        automaticallyImplyLeading: false,
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
                  Text('Checkout', style: TextStyle(fontSize: responsiveWidth(context, 20), fontWeight: FontWeight.w600)),
                  SizedBox(height: responsiveHeight(context, 18)),
                  Text('Pay With:', style: TextStyle(fontSize: responsiveWidth(context, 18), fontWeight: FontWeight.w600)),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: addresses.length,
                    itemBuilder: (context, index) {
                      final address = addresses[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: responsiveHeight(context, 6)),
                        child: ListTile(
                          leading: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
                          title: Text(
                            address["title"]!,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            address["subtitle"]!,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: responsiveHeight(context, 24)),
                  Text('Promo Code?', style: TextStyle(fontSize: responsiveWidth(context, 18), fontWeight: FontWeight.w600)),
                  SizedBox(height: responsiveHeight(context, 16)),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: responsiveHeight(context, 48), // Match the height of TextField and Button
                          child: TextField(
                            controller: promoController,
                            style: TextStyle(fontSize: responsiveHeight(context, 14)),
                            decoration: InputDecoration(
                              hintText: 'Enter Your Promo',
                              hintStyle: TextStyle(
                                color: Color(0xff878787),
                                fontSize: responsiveWidth(context, 14),
                              ),
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: responsiveHeight(context, 12),
                                horizontal: responsiveWidth(context, 12),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                borderSide: BorderSide(color: Color(0xffD6D6D6), width: 1),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                                borderSide: BorderSide(color: Color(0xffD6D6D6), width: 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: responsiveHeight(context, 48), // Match the height of TextField
                        child: TextButton(
                          onPressed: () {
                            // Handle promo code addition
                          },
                          style: TextButton.styleFrom(
                            side: BorderSide(color: Color(0xff4FAF5A)),
                            backgroundColor: Color(0xff4FAF5A),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: Text(
                            'Add',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: responsiveWidth(context, 12),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 24)),
                  Text('Pay with:', style: TextStyle(fontSize: responsiveWidth(context, 18), fontWeight: FontWeight.w600)),
                  RadioWidget(),
                 // SizedBox(height: responsiveHeight(context, 24)),
                 // Text('Card Type:', style: TextStyle(fontSize: responsiveWidth(context, 18), fontWeight: FontWeight.w600)),

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
