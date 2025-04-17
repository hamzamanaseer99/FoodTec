import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class SliderPriceWidget extends StatefulWidget {
  @override
  _SliderPriceWidgetState createState() => _SliderPriceWidgetState();
}

class _SliderPriceWidgetState extends State<SliderPriceWidget> {
  RangeValues _currentRangeValues = const RangeValues(0, 100);

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
              '\$10B',
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
              enabledThumbRadius: responsiveWidth(context, 5), // responsive thumb
            ),
            overlayShape: RoundSliderOverlayShape(
              overlayRadius: responsiveWidth(context, 14), // تأثير الضغط
            ),
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 10000,
            divisions: 1000,
            activeColor: Color(0xff25AE4B),
            labels: RangeLabels(
              '\$${_currentRangeValues.start.round()}',
              '\$${_currentRangeValues.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
              });
            },
          ),
        ),
      ],
    );
  }
}
