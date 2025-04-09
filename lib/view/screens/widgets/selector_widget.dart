import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  int _quantity = 1;

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Color(0xff009944),
            ),
          ),
          child: IconButton(
            icon: Icon(Icons.remove,
              color: Color(0xff009944),),
            onPressed: _decreaseQuantity,
            iconSize: 18, // Adjust the icon size to fit inside the container
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          '$_quantity',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(
          width: 20,
        ),
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff009944),
          ),
          child: IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: _increaseQuantity,
            iconSize: 18, // Adjust the icon size to fit inside the container
          ),
        ),
      ],
    );
  }

}

