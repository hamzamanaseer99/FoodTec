import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  int? selectedPaymentOption = 0;
  int? selectedCardType = 0;

  // Card type data model
  final List<Map<String, dynamic>> cardTypes = [
    {
      'value': 0,
      'image': 'assets/images/mastercard.png',
      'label': 'Visa',
    },
    {
      'value': 1,
      'image': 'assets/images/visa.png',
      'label': 'MasterCard',
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: responsiveHeight(context, 8)),
        Row(
          children: [
            _buildPaymentOption(value: 0, label: 'Card'.tr()),
            SizedBox(width: responsiveWidth(context, 24)),
            _buildPaymentOption(value: 1, label: 'Cash'.tr()),
          ],
        ),

        // Card Details Section
        if (selectedPaymentOption == 0) ...[
          SizedBox(height: responsiveHeight(context, 24)),
          _buildSectionTitle('Card Type:'.tr()),
          SizedBox(height: responsiveHeight(context, 12)),
          Wrap(
            spacing: responsiveWidth(context, 24),
            children: [
              for (var cardType in cardTypes)
                _buildCardTypeOption(
                  value: cardType['value'],
                  image: cardType['image'],
                  label: cardType['label'],
                ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: responsiveWidth(context, 16),
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildPaymentOption({required int value, required String label}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio<int>(
          activeColor: const Color(0xff4FAF5A),
          value: value,
          groupValue: selectedPaymentOption,
          onChanged: (int? value) => setState(() => selectedPaymentOption = value),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: responsiveWidth(context, 14),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCardTypeOption({
    required int value,
    required String image,
    required String label,
  }) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio<int>(
              activeColor: const Color(0xff4FAF5A),
              value: value,
              groupValue: selectedCardType,
              onChanged: (int? value) => setState(() => selectedCardType = value),
            ),
            SizedBox(
              width: responsiveWidth(context, 40),
              height: responsiveHeight(context, 24),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ],
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: responsiveWidth(context, 12),
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}