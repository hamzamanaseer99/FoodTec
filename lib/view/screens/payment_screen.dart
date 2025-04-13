import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/view/screens/widgets/section_price_widget.dart';

class PaymentScreen extends StatelessWidget {

  PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("welcome payment screen"),
          ],
        ),
      ),


    );
  }
}