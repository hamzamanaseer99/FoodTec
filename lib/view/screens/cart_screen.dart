import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/selector_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().state;
    final total = context.read<CartCubit>().total;




    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: _buildLocationIcon(),
          title: _buildLocationTitle(),
          actions:  [NotificationIcon()],
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Color(0xff4FAF5A),
            tabs: [
              Tab(text: 'Cart'),
              Tab(text: 'History'),
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
                  Text(
                    'Cart Empty',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 32),
                      color: const Color(0xff111827),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 16)),
                  Text(
                    'You don’t have add any foods in cart at this time',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 16),
                      color: const Color(0xff111827),
                    ),
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
                                  icon: Icons.delete ,
                          
                                ),
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: responsiveWidth(context, 16),
                              ),
                              width: responsiveWidth(context, 378),
                              height: responsiveHeight(context, 120),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7),
                          
                                border: Border.all(
                                  width: 1,
                                  color: Color(0xffDBF4D1)
                                )
                              ),
                              child: Row(
                                children: [
                                  // Image of the meal
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
                          
                                  // Details: name, price, selector
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
                                          SizedBox(height: responsiveHeight(context, 8)),
                          
                          
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
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
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text("تم تقديم الطلب")),
                                    );
                                  },
                                  child: const Text('اطلب الآن'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'History Empty',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 32),
                      color: const Color(0xff111827),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 16)),
                  Text(
                    'You don’t have order any foods before',
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 16),
                      color: const Color(0xff111827),
                    ),
                  ),
                ],
              ),
            )
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

Widget _buildLocationTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Current location", style: TextStyle(fontSize: 12, color: Color(0xff606060))),
      SizedBox(height: 4),
      Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
    ],
  );
}