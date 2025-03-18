import 'package:flutter/material.dart';

class PizzaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "Welcome to the Pizza Section!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
