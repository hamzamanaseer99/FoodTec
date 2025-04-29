import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/homescreen.dart';
import 'package:foodtek/model/product.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/cart_screen.dart';
import 'package:foodtek/view/screens/widgets/location_title_in_appbar_widget.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/search_widget.dart';
import 'package:foodtek/view/screens/widgets/selector_widget.dart';
import 'package:foodtek/view/screens/widgets/spicy_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product product;

  const ProductDetailsScreen({required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  double spicyLevel = 0.0;
  int quantity = 1;

  @override

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: isDark ? const Color(0xff1B1B1B) : Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: true,

        backgroundColor: isDark ? const Color(0xff1B1B1B) : Colors.white,
        elevation: 0,
        leading: _buildLocationIcon(isDark),
        title: LocationTitleWidget(theme: theme),
        actions: [NotificationIcon()],

      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: responsiveWidth(context, 30),
        vertical: responsiveHeight(context, 20)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                Row(
                children: [
                BackButton(color: isDark ? Colors.white : Colors.black),
                SizedBox(width: 8),
                Expanded(child: SearchWidget()),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 30)),

              Container(
                height: 203,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                ),
                clipBehavior: Clip.antiAlias,

                    ),

                    SizedBox(height: responsiveHeight(context, 24)),

                    Text(
                      product.name.tr(),
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: responsiveHeight(context, 8)),

                    Row(
                      children: [
                        ...List.generate(4, (_) => Icon(Icons.star, color: Colors.amber, size: responsiveWidth(context, 16))),
                        Icon(Icons.star_half, color: Colors.amber, size: responsiveWidth(context, 16)),
                        SizedBox(width: responsiveWidth(context, 8)),
                        Text(
                          '4.5 (89 reviews).'.tr(),
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 14),
                            color: isDark ? Colors.grey[400] : Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: responsiveHeight(context, 8)),

                    Row(
                      children: [
                        Text(
                          "\$${product.price.toStringAsFixed(2)}".tr(),
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 20),
                            fontWeight: FontWeight.bold,
                            color: Colors.green[800],
                          ),
                        ),
                        SizedBox(width: responsiveWidth(context, 8)),
                        Text(
                          '\$9.5',
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 16),
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: responsiveHeight(context, 12)),

                    Text(
                      product.description.tr(),
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 16),
                        color: isDark ? Colors.white70 : Colors.black87,
                      ),
                    ),

                    SizedBox(height: responsiveHeight(context, 24)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Spicy'.tr(),
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 16),
                            color: isDark ? Colors.grey[300] : const Color(0xff838383),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Quantity'.tr(),
                          style: TextStyle(
                            fontSize: responsiveWidth(context, 16),
                            color: isDark ? Colors.grey[300] : const Color(0xff838383),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: responsiveHeight(context, 12)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SpicySlider(
                            value: spicyLevel,
                            onChanged: (value) {
                              setState(() {
                                spicyLevel = value;
                              });
                            },
                          ),
                        ),
                        SizedBox(width: responsiveWidth(context, 16)),
                        QuantitySelector(
                          quantity: quantity,
                          onIncrease: (newQuantity) {
                            setState(() {
                              quantity = newQuantity;
                            });
                          },
                          onDecrease: (newQuantity) {
                            setState(() {
                              quantity = newQuantity;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveHeight(context, 24)),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(context, 30),
                vertical: responsiveHeight(context, 16),
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().addToCart(
                    product: product,
                    spicyLevel: spicyLevel,
                    quantity: quantity,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("تمت إضافة ${product.name.tr()} إلى السلة"),
                      duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'عرض السلة',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        },
                      ),
                    ),
                  );

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  Text(
                  "Add To Cart".tr(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildLocationIcon(bool isDark) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xff4FAF5A).withOpacity(0.1),
      ),
      child: Icon(Icons.location_on, color: isDark ? Colors.green[300] : const Color(0xff4FAF5A)),
    );
  }




}
