import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class PayButton extends StatelessWidget {
  final VoidCallback onPressed;

  const PayButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 24), // تقلل شوي المسافة الجانبية
        vertical: responsiveHeight(context, 16),
      ),
      child: Center(
        child: SizedBox(
          width: responsiveWidth(context, 327), // خليت العرض responsive
          height: responsiveHeight(context, 57), // والارتفاع برضو
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF25AE4B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 2,
            ),
            onPressed: onPressed,
            icon: Icon(Icons.lock, color: Colors.white, size: responsiveWidth(context, 18)),
            label: Text(
              'Pay for the order'.tr(),
              style: TextStyle(
                color: Colors.white,
                fontSize: responsiveWidth(context, 15),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
