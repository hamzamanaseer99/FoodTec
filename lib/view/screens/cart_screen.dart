import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/location_title_in_appbar_widget.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/section_price_widget.dart';
import 'package:foodtek/view/screens/widgets/selector_widget.dart';

import '../../cubit/history_cubit.dart';
import '../../model/orderhistory.dart';
import 'history_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state;
    final subTotal = cartItems.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
    final deliveryCharge = 3.0;
    final discount = 2.0;
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          elevation: 0,
          leading: _buildLocationIcon(),
          title: LocationTitleWidget(theme: theme),
          actions: [NotificationIcon()],
          bottom: TabBar(
            labelColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            unselectedLabelColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.grey[400]
                : Colors.grey,
            indicatorColor: const Color(0xff4FAF5A),
            tabs: [
              Tab(text: 'Cart'.tr()),
              Tab(text: 'History'.tr()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            cartItems.isEmpty
                ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/cart empty.jpg'),
                  SizedBox(height: responsiveHeight(context, 51)),
                  Text(
                    'Cart Empty'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 32),
                      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 16)),
                  Text(
                    'You don’t have add any foods in cart at this time'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 16),
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
                : SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.symmetric(
                        horizontal: responsiveWidth(context, 16),
                        vertical: responsiveHeight(context, 16),
                      ),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: index == cartItems.length - 1 ? 0 : responsiveHeight(context, 20),
                          ),
                          child: Slidable(
                            key: ValueKey(item.product.name),
                            endActionPane: ActionPane(
                              motion: const BehindMotion(),
                              children: [
                                SlidableAction(
                                  onPressed: (context) {
                                    context.read<CartCubit>().removeFromCart(item);
                                  },
                                  backgroundColor: Color(0xffFDAC1D),
                                  foregroundColor: Colors.white,
                                  icon: Icons.delete,
                                ),
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: responsiveWidth(context, 12),
                                vertical: responsiveHeight(context, 12),
                              ),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1,
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      item.product.image,
                                      width: responsiveWidth(context, 62),
                                      height: responsiveWidth(context, 62),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: responsiveWidth(context, 12)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.product.name.tr(),
                                          style: TextStyle(
                                            fontSize: responsiveWidth(context, 15),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: responsiveHeight(context, 6)),
                                        Text(
                                          "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
                                          style: TextStyle(
                                            fontSize: responsiveWidth(context, 16),
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  QuantitySelector(
                                    quantity: item.quantity,
                                    onIncrease: (newQuantity) {
                                      context.read<CartCubit>().updateQuantity(item, newQuantity);
                                    },
                                    onDecrease: (newQuantity) {
                                      context.read<CartCubit>().updateQuantity(item, newQuantity);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: buildCheckoutSection(
                      context,
                      subTotal,
                      deliveryCharge,
                      discount,
                      onPlaceOrderTap: () {
                        final cartCubit = context.read<CartCubit>();
                        final historyCubit = context.read<HistoryCubit>();

                        if (cartCubit.state.isNotEmpty) {
                          final order = OrderHistory(
                            date: DateTime.now(),
                            items: List.from(cartCubit.state),
                            total: cartCubit.totalWithCharges(),
                            id: '',
                            status: '',
                          );
                          historyCubit.addOrder(order);
                        }

                        Navigator.pushNamed(context, '/SetLocationScreen');
                      },
                    ),
                  ),
                ],
              ),
            ),
            HistoryTab(),
          ],
        ),
      ),
    );
  }
}

Widget _buildLocationIcon() {
  return Container(
    margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4),
      color: Color(0xff4FAF5A).withOpacity(0.1),
    ),
    child: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
  );
}
