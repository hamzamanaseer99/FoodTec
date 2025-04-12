import 'package:flutter/material.dart';

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
            Text('\$0',
            style: TextStyle(
              color: Color(0xff25AE4B),
              fontWeight: FontWeight.w600
              ),
            ),
            Text('\$10B',
              style: TextStyle(
                  color: Color(0xff25AE4B),
                  fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
        RangeSlider(
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
      ],
    );
  }
}
