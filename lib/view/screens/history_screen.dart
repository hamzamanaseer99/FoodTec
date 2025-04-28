
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/cubit/history_cubit.dart';
import 'package:foodtek/model/orderhistory.dart';
import 'package:foodtek/responsive.dart';



class HistoryTab extends StatefulWidget {
  const HistoryTab({super.key});

  @override
  State<HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends State<HistoryTab> {
  @override
  Widget build(BuildContext context) {
    final historyItems = context.watch<HistoryCubit>().state;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    if (historyItems.isEmpty) {
      return Column(
        children: [
          const Spacer(),
          _buildEmptyHistory(context, isDarkMode),
          const Spacer(),
        ],
      );
    }

    return ListView.builder(

      padding: EdgeInsets.only(
        top:responsiveHeight(context, 32),
        bottom: responsiveHeight(context, 16),
        left: responsiveWidth(context, 20),
        right: responsiveWidth(context, 20),
      ),
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        final order = historyItems[index];
        final truncatedOrderId = order.id.length >= 8 ? order.id.substring(0, 8) : order.id;

        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            margin: EdgeInsets.only(bottom: responsiveHeight(context, 16)),
            child: _buildHistoryItem(context, order, isDarkMode, truncatedOrderId),
          ),
        );
      },
    );
  }

  Widget _buildHistoryItem(BuildContext context, OrderHistory order, bool isDarkMode, String truncatedOrderId) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.black : Colors.white,
        border: Border.all(
          color: const Color(0xffDBF4D1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(responsiveWidth(context, 18)),
      child: Row(
        children: [
          // Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              order.items.first.product.image,
              width: responsiveWidth(context, 60),
              height: responsiveWidth(context, 60),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: responsiveWidth(context, 12)),

          // Product Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.items.first.product.name,
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),

                SizedBox(height: responsiveHeight(context, 8)),
                Text(
                  "\$${order.items.first.product.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 18),
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Date and Reorder Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    color: Colors.green,
                    size: responsiveWidth(context, 16),
                  ),
                  SizedBox(width: responsiveWidth(context, 4)),
                  Text(
                    DateFormat('d.M.y').format(order.date),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 14),
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsiveHeight(context, 12)),
              GestureDetector(
                onTap: () => _reorderItems(context, order.items),
                child: Row(
                  children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.green,
                      size: responsiveWidth(context, 18),
                    ),
                    SizedBox(width: responsiveWidth(context, 4)),
                    Text(
                      "Reorder",
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 14),
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _reorderItems(BuildContext context, List<CartItem> items) {
    final cartCubit = context.read<CartCubit>();

    // إفراغ السلة الحالية أولاً
    cartCubit.clearCart();

    // إضافة جميع العناصر من الطلب السابق
    for (var item in items) {
      cartCubit.addToCart(
        product: item.product,
        quantity: item.quantity,
        spicyLevel: item.spicyLevel,
      );
    }

    // إظهار رسالة تأكيد
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("تمت إضافة العناصر إلى السلة بنجاح"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Widget _buildEmptyHistory(BuildContext context, bool isDarkMode) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/cart empty.jpg'),
          SizedBox(height: responsiveHeight(context, 51)),
          Text(
            'History Empty'.tr(),
            style: TextStyle(
              fontSize: responsiveWidth(context, 32),
              color: isDarkMode ? Colors.white : Colors.black, // Change text color
            ),
          ),
          SizedBox(height: responsiveHeight(context, 16)),
          Text(
            'You don’t have order any foods before'.tr(),
            style: TextStyle(
              fontSize: responsiveWidth(context, 16),
              color: isDarkMode ? Colors.white70 : Colors.black54, // Change text color
            ),
          ),
        ],
      ),
    );
  }
}
