// Imports remain the same

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/min_max_container_widget.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/select_table_card_widget.dart';
import 'package:foodtek/view/screens/widgets/slider_discount_widget.dart';
import 'package:foodtek/view/screens/widgets/slider_price_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCategory = '';
  String selected1Category = '';
  List<String> selected2Categories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _buildLocationIcon(),
        title: _buildLocationTitle(),
        actions: [NotificationIcon()],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Filter'),
                _sectionLabel('Price range'),
                _priceMinMax(),
                 SliderPriceWidget(),
                _sectionLabel('Discount'),
                _discountMinMax(),
                 DiscountSlider(),
                _sectionLabel('Category'),
                _wrapOptions(['Fast Food', 'Sea Food', 'Dessert'], selectedCategory, (val) {
                  setState(() => selectedCategory = val);
                }),
                _sectionLabel('Location'),
                _wrapOptions(['1 KM', '5 KM', '10 KM'], selected1Category, (val) {
                  setState(() => selected1Category = val);
                }),
                _sectionLabel('Dish'),
                _wrapMultiSelectOptions([
                  'Seafood Paella',
                  'Tuna Tartare',
                  'Spicy Crab Cakes',
                  'Clam Chowder',
                  'Miso-Glazed Cod',
                  'Lobster Thermidor'
                ]),
                SizedBox(height: responsiveHeight(context, 24)),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedCategory = '';
                            selected1Category = '';
                            selected2Categories.clear();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Reset'.tr()),
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply filter logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4FAF5A),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text('Apply'.tr()),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) => Padding(
    padding: EdgeInsets.only(top: responsiveHeight(context, 22)),
    child: Text(
      text.tr(),
      style: TextStyle(
        fontSize: responsiveWidth(context, 22),
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  Widget _sectionLabel(String label) => Padding(
    padding: EdgeInsets.only(top: responsiveHeight(context, 24), bottom: 8),
    child: Text(
      label.tr(),
      style: TextStyle(
        fontSize: responsiveWidth(context, 16),
        fontWeight: FontWeight.w600,
        color: Color(0xff98A0B4),
      ),
    ),
  );

  Widget _priceMinMax() => Row(
    children: [
      minMaxContainer(context, 'Min'.tr()),
      SizedBox(width: responsiveWidth(context, 16)),
      minMaxContainer(context, 'Max'.tr()),
    ],
  );

  Widget _discountMinMax() => Row(
    children: [
      minMaxContainer(context, 'Min'.tr()),
      SizedBox(width: responsiveWidth(context, 16)),
      minMaxContainer(context, 'Max'.tr()),
    ],
  );

  Widget _wrapOptions(List<String> items, String selectedItem, Function(String) onSelect) {
    return Wrap(
      spacing: responsiveWidth(context, 10),
      children: items.map((item) {
        return SelectableCard(
          title: item.tr(),
          isSelected: selectedItem == item,
          onTap: () => onSelect(item),
        );
      }).toList(),
    );
  }

  Widget _wrapMultiSelectOptions(List<String> items) {
    return Wrap(
      spacing: responsiveWidth(context, 10),
      runSpacing: responsiveHeight(context, 10),
      children: items.map((item) {
        bool isSelected = selected2Categories.contains(item);
        return SelectableCard(
          title: item.tr(),
          isSelected: isSelected,
          onTap: () {
            setState(() {
              isSelected
                  ? selected2Categories.remove(item)
                  : selected2Categories.add(item);
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildLocationIcon() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xff4FAF5A).withOpacity(0.1),
      ),
      child: const Icon(Icons.location_on, color: Color(0xff4FAF5A)),
    );
  }

  Widget _buildLocationTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Current location".tr(), style: const TextStyle(fontSize: 12, color: Color(0xff606060))),
        const SizedBox(height: 4),
        const Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
