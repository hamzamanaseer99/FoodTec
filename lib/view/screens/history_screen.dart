// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:foodtek/cubit/cart_cubit.dart';
// import 'package:foodtek/cubit/history_cubit.dart';
// import 'package:foodtek/model/orderhistory.dart';
// import 'package:foodtek/responsive.dart';
//
// class HistoryTab extends StatefulWidget {
//   const HistoryTab({super.key});
//
//   @override
//   State<HistoryTab> createState() => _HistoryTabState();
// }
//
// class _HistoryTabState extends State<HistoryTab> {
//   @override
//   Widget build(BuildContext context) {
//     final historyItems = context
//         .watch<HistoryCubit>()
//         .state;
//
//     if (historyItems.isEmpty) {
//       return Column(
//         children: [
//           const Spacer(),
//           _buildEmptyHistory(context),
//           const Spacer(),
//         ],
//       );
//     }
//
//     return ListView.builder(
//       padding: EdgeInsets.only(
//         top: MediaQuery
//             .of(context)
//             .size
//             .height * 0.3,
//         bottom: responsiveHeight(context, 16),
//         left: responsiveWidth(context, 16),
//         right: responsiveWidth(context, 16),
//       ),
//       itemCount: historyItems.length,
//       itemBuilder: (context, index) {
//         final order = historyItems[index];
//         return Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             constraints: const BoxConstraints(maxWidth: 600),
//             margin: EdgeInsets.only(bottom: responsiveHeight(context, 16)),
//             child: _buildHistoryItem(context, order),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildHistoryItem(BuildContext context, OrderHistory order) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(responsiveWidth(context, 16)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "طلب #${order.id.substring(0, 8)}",
//                   style: TextStyle(
//                     fontSize: responsiveWidth(context, 16),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "${order.date.day}/${order.date.month}/${order.date.year}",
//                   style: TextStyle(
//                     fontSize: responsiveWidth(context, 14),
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: responsiveHeight(context, 8)),
//             ...order.items.map((item) =>
//                 Padding(
//                   padding: EdgeInsets.only(
//                       bottom: responsiveHeight(context, 8)),
//                   child: Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8),
//                         child: Image.asset(
//                           item.product.image,
//                           width: responsiveWidth(context, 40),
//                           height: responsiveWidth(context, 40),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       SizedBox(width: responsiveWidth(context, 8)),
//                       Expanded(
//                         child: Text(
//                           "${item.quantity}x ${item.product.name}",
//                           style: TextStyle(
//                             fontSize: responsiveWidth(context, 14),
//                           ),
//                         ),
//                       ),
//                       Text(
//                         "\$${(item.product.price * item.quantity)
//                             .toStringAsFixed(2)}",
//                         style: TextStyle(
//                           fontSize: responsiveWidth(context, 14),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )).toList(),
//             const Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => _reorderItems(context, order.items),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: responsiveWidth(context, 16),
//                       vertical: responsiveHeight(context, 8),
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: Text(
//                     'إعادة الطلب',
//                     style: TextStyle(
//                       fontSize: responsiveWidth(context, 14),
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "الإجمالي: \$${order.total.toStringAsFixed(2)}",
//                   style: TextStyle(
//                     fontSize: responsiveWidth(context, 16),
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _reorderItems(BuildContext context, List<CartItem> items) {
//     final cartCubit = context.read<CartCubit>();
//
//     // إفراغ السلة الحالية أولاً
//     cartCubit.clearCart();
//
//     // إضافة جميع العناصر من الطلب السابق
//     for (var item in items) {
//       cartCubit.addToCart(
//         product: item.product,
//         quantity: item.quantity,
//         spicyLevel: item.spicyLevel,
//       );
//     }
//
//     // إظهار رسالة تأكيد
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text("تمت إضافة العناصر إلى السلة بنجاح"),
//         duration: Duration(seconds: 2),
//       ),
//     );
//   }
//
//   Widget _buildEmptyHistory(BuildContext context) {
//     final isDarkMode = Theme
//         .of(context)
//         .brightness == Brightness.dark;
//
//     return Center(
//       child: Column(
//
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Image.asset('assets/images/cart empty.jpg'),
//           SizedBox(height: responsiveHeight(context, 51)),
//           Text(
//             'History Empty',
//             style: TextStyle(
//               fontSize: responsiveWidth(context, 32),
//               color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
//             ),
//           ),
//           SizedBox(height: responsiveHeight(context, 16)),
//           Text(
//             'You don’t have order any foods before',
//             style: TextStyle(
//               fontSize: responsiveWidth(context, 16),
//               color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
        top: MediaQuery.of(context).size.height * 0.3,
        bottom: responsiveHeight(context, 16),
        left: responsiveWidth(context, 16),
        right: responsiveWidth(context, 16),
      ),
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        final order = historyItems[index];
        return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            margin: EdgeInsets.only(bottom: responsiveHeight(context, 16)),
            child: _buildHistoryItem(context, order, isDarkMode),
          ),
        );
      },
    );
  }

  Widget _buildHistoryItem(BuildContext context, OrderHistory order, bool isDarkMode) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: isDarkMode ? Color(0xFF1E1E1E) : Colors.white, // Change background color
      child: Padding(
        padding: EdgeInsets.all(responsiveWidth(context, 16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "طلب #${order.id.substring(0, 8)}",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black, // Change text color
                  ),
                ),
                Text(
                  "${order.date.day}/${order.date.month}/${order.date.year}",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 14),
                    color: isDarkMode ? Colors.white70 : Colors.grey, // Change text color
                  ),
                ),
              ],
            ),
            SizedBox(height: responsiveHeight(context, 8)),
            ...order.items.map((item) => Padding(
              padding: EdgeInsets.only(bottom: responsiveHeight(context, 8)),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      item.product.image,
                      width: responsiveWidth(context, 40),
                      height: responsiveWidth(context, 40),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: responsiveWidth(context, 8)),
                  Expanded(
                    child: Text(
                      "${item.quantity}x ${item.product.name}",
                      style: TextStyle(
                        fontSize: responsiveWidth(context, 14),
                        color: isDarkMode ? Colors.white : Colors.black, // Change text color
                      ),
                    ),
                  ),
                  Text(
                    "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 14),
                      color: isDarkMode ? Colors.white : Colors.black, // Change text color
                    ),
                  ),
                ],
              ),
            )).toList(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () => _reorderItems(context, order.items),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: responsiveWidth(context, 16),
                      vertical: responsiveHeight(context, 8),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'إعادة الطلب',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 14),
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  "الإجمالي: \$${order.total.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black, // Change text color
                  ),
                ),
              ],
            ),
          ],
        ),
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
            'History Empty',
            style: TextStyle(
              fontSize: responsiveWidth(context, 32),
              color: isDarkMode ? Colors.white : Colors.black, // Change text color
            ),
          ),
          SizedBox(height: responsiveHeight(context, 16)),
          Text(
            'You don’t have order any foods before',
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
