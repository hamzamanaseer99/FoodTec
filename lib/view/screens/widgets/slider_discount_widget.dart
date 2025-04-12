import 'package:flutter/material.dart';

class DiscountSlider extends StatefulWidget {
  @override
  _DiscountSliderState createState() => _DiscountSliderState();
}

class _DiscountSliderState extends State<DiscountSlider> {
  double _Discount = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('\$0',
              style: TextStyle(
                  color: Color(0xff25AE4B),
                  fontWeight: FontWeight.w600
              ),
            ),
            Text('50%',
              style: TextStyle(
                  color: Color(0xff25AE4B),
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(

            activeTrackColor: Color(0xff25AE4B),
            inactiveTrackColor: Colors.grey[300],
            thumbColor: Color(0xff25AE4B),
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: Slider(
            min: 0,
            max: 1,
            value: _Discount,
            onChanged: (value) {
              setState(() {
                _Discount = value;
              });
            },
          ),
        ),

      ],
    );
  }
}