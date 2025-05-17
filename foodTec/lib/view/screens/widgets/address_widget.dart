import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:foodtek/responsive.dart';

class AddressWidget extends StatefulWidget {
  const AddressWidget({
    super.key,
    required this.addressEditingController,
  });

  final TextEditingController addressEditingController;

  @override
  State<AddressWidget> createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final fillColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final hintColor = isDark ? Colors.grey[400] : Colors.grey[600];
    final labelColor = isDark ? Colors.grey[300] : Colors.grey[700];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Container(
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black54 : Colors.black12,
              blurRadius: 4,
              spreadRadius: 1,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          controller: widget.addressEditingController,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: responsiveWidth(context, 14),
          ),
          decoration: InputDecoration(
            labelText: 'Address'.tr(),
            labelStyle: TextStyle(
              fontSize: responsiveWidth(context, 14),
              color: labelColor,
            ),
            hintText: "123 Al-Madina Street, Abdali...".tr(),
            hintStyle: TextStyle(
              fontSize: responsiveWidth(context, 14),
              color: hintColor,
            ),
            filled: true,
            fillColor: fillColor,
            contentPadding: EdgeInsets.symmetric(
              vertical: responsiveHeight(context, 14),
              horizontal: responsiveWidth(context, 14),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[700]! : const Color(0xffEDF1F3),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: isDark ? Colors.grey[500]! : const Color(0xffCED3DC),
                width: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
