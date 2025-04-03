import 'package:flutter/material.dart';

class SandwichScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sandwich"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text(
          "Welcome to the Sandwich Section!",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
