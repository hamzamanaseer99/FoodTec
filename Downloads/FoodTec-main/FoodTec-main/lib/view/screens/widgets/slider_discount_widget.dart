import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class DiscountSlider extends StatefulWidget {
  @override
  _DiscountSliderState createState() => _DiscountSliderState();
}

class _DiscountSliderState extends State<DiscountSlider> {
  double _discount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '\$0',
              style: TextStyle(
                color: const Color(0xff25AE4B),
                fontWeight: FontWeight.w600,
                fontSize: responsiveWidth(context, 13),
              ),
            ),
            Text(
              '50%',
              style: TextStyle(
                color: const Color(0xff25AE4B),
                fontWeight: FontWeight.w600,
                fontSize: responsiveWidth(context, 13),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveHeight(context, 10)),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xff25AE4B),
            inactiveTrackColor: Colors.grey[300],
            thumbColor: const Color(0xff25AE4B),
            trackHeight: responsiveHeight(context, 5), // responsive
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: responsiveWidth(context, 8), // responsive thumb
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: responsiveWidth(context, 14), // تأثير الضغط
            ),
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: Slider(
            min: 0,
            max: 1,
            value: _discount,
            onChanged: (value) {
              setState(() {
                _discount = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
