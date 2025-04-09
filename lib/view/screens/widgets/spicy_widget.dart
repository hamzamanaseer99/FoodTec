import 'package:flutter/material.dart';

class SpicySlider extends StatefulWidget {
  @override
  _SpicySliderState createState() => _SpicySliderState();
}

class _SpicySliderState extends State<SpicySlider> {
  double _spicyValue = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(

            activeTrackColor: Color(0xffEF2A39),
            inactiveTrackColor: Colors.grey[300],
            thumbColor: Color(0xffEF2A39),
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: Container(
            width: 165,
            child: Slider(

              min: 0,
              max: 1,
              value: _spicyValue,
              onChanged: (value) {
                setState(() {
                  _spicyValue = value;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Text("Mild",style: TextStyle(color: Color(0xff1CC019)),),
           SizedBox(width: 100,),
           Text("Hot",style: TextStyle(color: Color(0xffEF2A39)),),

         ],
        ),
      ],
    );
  }
}

