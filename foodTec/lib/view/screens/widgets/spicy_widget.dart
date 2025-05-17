import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart'; // Uncomment if using screenutil

class SpicySlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const SpicySlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xffEF2A39),
            inactiveTrackColor: Colors.grey[300],
            thumbColor: const Color(0xffEF2A39),
            trackHeight: responsiveHeight(context, 6),
            thumbShape:  RoundSliderThumbShape(enabledThumbRadius: responsiveWidth(context, 8)),
            overlayShape:  RoundSliderOverlayShape(overlayRadius: responsiveWidth(context, 16)),
            showValueIndicator: ShowValueIndicator.never,
          ),
          child: SizedBox(
            width: responsiveWidth(context, 180), //
            child: Slider(
              min: 0,
              max: 1,

              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
         SizedBox(height: responsiveHeight(context, 4)),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Mild".tr(),
              style: TextStyle(
                color: const Color(0xff1CC019),
                fontSize: responsiveWidth(context, 12),
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: responsiveWidth(context, 120)),
            Text(
              "Hot".tr(),
              style: TextStyle(
                color: const Color(0xffEF2A39),
                fontSize: responsiveWidth(context, 12),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

      ],
    );
  }
}
