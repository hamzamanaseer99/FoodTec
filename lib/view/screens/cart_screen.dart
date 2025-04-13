// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:foodtek/cubit/cart_cubit.dart';
// import 'package:foodtek/responsive.dart';
// import 'package:foodtek/view/screens/widgets/notification_icon.dart';
// import 'package:foodtek/view/screens/widgets/selector_widget.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   int quantity = 1;
//   @override
//   Widget build(BuildContext context) {
//     final cartItems = context.watch<CartCubit>().state;
//     final total = context.read<CartCubit>().total;
//
//
//
//
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           leading: _buildLocationIcon(),
//           title: _buildLocationTitle(),
//           actions:  [NotificationIcon()],
//           bottom: const TabBar(
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Color(0xff4FAF5A),
//             tabs: [
//               Tab(text: 'Cart'),
//               Tab(text: 'History'),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             cartItems.isEmpty
//                 ? Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset('assets/images/cart empty.jpg'),
//                   SizedBox(height: responsiveHeight(context, 51)),
//
//                   Text(
//                     'Cart Empty',
//                     style: TextStyle(
//                       fontSize: responsiveWidth(context, 32),
//                       color: const Color(0xff111827),
//                     ),
//                   ),
//                   SizedBox(height: responsiveHeight(context, 16)),
//
//                   Text(
//                     'You don’t have add any foods in cart at this time',
//                     style: TextStyle(
//                       fontSize: responsiveWidth(context, 16),
//                       color: const Color(0xff111827),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//                 : SafeArea(
//               child: Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       padding: EdgeInsets.symmetric(
//                         horizontal: responsiveWidth(context, 16),
//                         vertical: responsiveHeight(context, 16),
//                       ),
//                       itemCount: cartItems.length,
//                       itemBuilder: (context, index) {
//                         final item = cartItems[index];
//                         return Padding(
//                           padding: EdgeInsets.only(
//                             bottom: index == cartItems.length - 1 ? 0 : responsiveHeight(context, 20),
//                           ),
//                           child: Slidable(
//                             key: ValueKey(item.product.name),
//                             endActionPane: ActionPane(
//                               motion: const BehindMotion(),
//                               children: [
//                                 SlidableAction(
//                                   onPressed: (context) {
//                                     context.read<CartCubit>().removeFromCart(item);
//                                   },
//                                   backgroundColor: Color(0xffFDAC1D),
//                                   foregroundColor: Colors.white,
//                                   icon: Icons.delete ,
//
//                                 ),
//                               ],
//                             ),
//                             child: Container(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: responsiveWidth(context, 16),
//                               ),
//                               width: responsiveWidth(context, 378),
//                               height: responsiveHeight(context, 120),
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(7),
//
//                                 border: Border.all(
//                                   width: 1,
//                                   color: Color(0xffDBF4D1)
//                                 )
//                               ),
//                               child: Row(
//                                 children: [
//                                   // Image of the meal
//                                  ClipRRect(
//                                     borderRadius: BorderRadius.circular(12),
//                                     child: Image.asset(
//                                       item.product.image,
//                                       width: responsiveWidth(context, 62),
//                                       height: responsiveWidth(context, 62),
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                                   SizedBox(width: responsiveWidth(context, 12)),
//
//                                   // Details: name, price, selector
//                                   Expanded(
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text(
//                                             item.product.name,
//                                             style: TextStyle(
//                                               fontSize: responsiveWidth(context, 15),
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                           Row(
//                                             mainAxisAlignment: MainAxisAlignment.end,
//                                             children: [
//                                               QuantitySelector(
//                                                 quantity: item.quantity,
//                                                 onIncrease: (newQuantity) {
//                                                   context.read<CartCubit>().updateQuantity(item, newQuantity);
//                                                 },
//                                                 onDecrease: (newQuantity) {
//                                                   context.read<CartCubit>().updateQuantity(item, newQuantity);
//                                                 },
//                                               ),
//                                             ],
//                                           ),
//                                           SizedBox(height: responsiveHeight(context, 4)),
//                                           Text(
//                                             "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
//                                             style: TextStyle(
//                                               fontSize: responsiveWidth(context, 16),
//                                               color: Colors.green,
//                                             ),
//                                           ),
//                                           SizedBox(height: responsiveHeight(context, 8)),
//
//
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(16),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
//                     ),
//                     child: SafeArea(
//                       top: false,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Text(
//                             "الإجمالي: \$${total.toStringAsFixed(2)}",
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.end,
//                           ),
//                           const SizedBox(height: 10),
//                           Row(
//                             children: [
//                               Expanded(
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.red,
//                                   ),
//                                   onPressed: () => context.read<CartCubit>().clearCart(),
//                                   child: const Text('إفراغ السلة'),
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: ElevatedButton(
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.green,
//                                   ),
//                                   onPressed: () {
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       const SnackBar(content: Text("تم تقديم الطلب")),
//                                     );
//                                   },
//                                   child: const Text('اطلب الآن'),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Center(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Image.asset('assets/images/cart empty.jpg'),
//                   SizedBox(height: responsiveHeight(context, 51)),
//                   Text(
//                     'History Empty',
//                     style: TextStyle(
//                       fontSize: responsiveWidth(context, 32),
//                       color: const Color(0xff111827),
//                     ),
//                   ),
//                   SizedBox(height: responsiveHeight(context, 16)),
//                   Text(
//                     'You don’t have order any foods before',
//                     style: TextStyle(
//                       fontSize: responsiveWidth(context, 16),
//                       color: const Color(0xff111827),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// Widget _buildLocationIcon() {
//   return Container(
//     margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(4),
//       color: Color(0xff4FAF5A).withOpacity(0.1),
//     ),
//     child: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
//   );
// }
//
// Widget _buildLocationTitle() {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text("Current location", style: TextStyle(fontSize: 12, color: Color(0xff606060))),
//       SizedBox(height: 4),
//       Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
//     ],
//   );
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/cubit/history_cubit.dart';
// import 'package:foodtek/model/order_history.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/selector_widget.dart';

import '../../model/orderhistory.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: _buildLocationIcon(),
          title: _buildLocationTitle(),
          actions: [NotificationIcon()],
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xff4FAF5A),
            tabs: [
              Tab(text: 'السلة'),
              Tab(text: 'الطلبات السابقة'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCartTab(context),
            _buildHistoryTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCartTab(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state;
    final total = context.read<CartCubit>().total;

    if (cartItems.isEmpty) {
      return _buildEmptyCart();
    }

    return Column(
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
              return _buildCartItem(context, item, index, cartItems.length);
            },
          ),
        ),
        _buildCartBottomBar(context, total),
      ],
    );
  }

  Widget _buildHistoryTab(BuildContext context) {
    final historyItems = context.watch<HistoryCubit>().state;

    if (historyItems.isEmpty) {
      return _buildEmptyHistory();
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 16),
        vertical: responsiveHeight(context, 16),
      ),
      itemCount: historyItems.length,
      itemBuilder: (context, index) {
        final order = historyItems[index];
        return _buildHistoryItem(context, order);
      },
    );
  }

  Widget _buildCartItem(BuildContext context, CartItem item, int index, int length) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: index == length - 1 ? 0 : responsiveHeight(context, 20)),

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
    horizontal: responsiveWidth(context, 16)),
    width: responsiveWidth(context, 378),
    height: responsiveHeight(context, 120),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(7),
    border: Border.all(
    width: 1,
    color: Color(0xffDBF4D1)),
    ),
    child: Row(
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
    child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    item.product.name,
    style: TextStyle(
    fontSize: responsiveWidth(context, 15),
    fontWeight: FontWeight.bold,
    ),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
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
    SizedBox(height: responsiveHeight(context, 4)),
    Text(
    "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
    style: TextStyle(
    fontSize: responsiveWidth(context, 16),
    color: Colors.green,
    ),
    ),
    ],
    ),
    ),
    ),
    ],
    ),
    ),
    ),
    );
  }

  Widget _buildHistoryItem(BuildContext context, OrderHistory order) {
    return Card(
      margin: EdgeInsets.only(bottom: responsiveHeight(context, 16)),
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
                  ),
                ),
                Text(
                  "${order.date.day}/${order.date.month}/${order.date.year}",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 14),
                    color: Colors.grey,
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
                      ),
                    ),
                  ),
                  Text(
                    "\$${(item.product.price * item.quantity).toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 14),
                    ),
                  ),
                ],
              ),
            )).toList(),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "الحالة: ${order.status}",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 14),
                    color: _getStatusColor(order.status),
                  ),
                ),
                Text(
                  "الإجمالي: \$${order.total.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartBottomBar(BuildContext context, double total) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "الإجمالي: \$${total.toStringAsFixed(2)}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () => context.read<CartCubit>().clearCart(),
                    child: const Text('إفراغ السلة'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () => _placeOrder(context),
                    child: const Text('اطلب الآن'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/cart empty.jpg'),
          SizedBox(height: responsiveHeight(context, 51)),
          Text(
            'السلة فارغة',
            style: TextStyle(
              fontSize: responsiveWidth(context, 32),
              color: const Color(0xff111827),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 16)),
          Text(
            'لم تقم بإضافة أي عناصر إلى السلة',
            style: TextStyle(
              fontSize: responsiveWidth(context, 16),
              color: const Color(0xff111827),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyHistory() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/cart empty.jpg'),
          SizedBox(height: responsiveHeight(context, 51)),
          Text(
            'لا توجد طلبات سابقة',
            style: TextStyle(
              fontSize: responsiveWidth(context, 32),
              color: const Color(0xff111827),
            ),
          ),
          SizedBox(height: responsiveHeight(context, 16)),
          Text(
            'لم تقم بأي طلبات سابقة',
            style: TextStyle(
              fontSize: responsiveWidth(context, 16),
              color: const Color(0xff111827),
            ),
          ),
        ],
      ),
    );
  }

  void _placeOrder(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    final historyCubit = context.read<HistoryCubit>();

    if (cartCubit.state.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("السلة فارغة، أضف عناصر أولاً")),
      );
      return;
    }

    final newOrder = OrderHistory(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: List.from(cartCubit.state),
      total: cartCubit.total,
      date: DateTime.now(),
      status: 'قيد التنفيذ',
    );

    historyCubit.addOrder(newOrder);
    cartCubit.clearCart();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("تم تقديم الطلب بنجاح")),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'تم التوصيل':
        return Colors.green;
      case 'قيد التنفيذ':
        return Colors.orange;
      case 'ملغى':
        return Colors.red;
      default:
        return Colors.grey;
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

  Widget _buildLocationTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("الموقع الحالي", style: TextStyle(fontSize: 12, color: Color(0xff606060))),
        SizedBox(height: 4),
        Text("شارع سوكارنو هاتا 15أ...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }
}