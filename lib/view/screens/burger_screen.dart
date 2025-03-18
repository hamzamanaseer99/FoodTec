import 'package:flutter/material.dart';

class BurgerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Burger"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "Welcome to the Burger Section!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
