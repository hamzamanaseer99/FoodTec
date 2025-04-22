import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/min_max_container_widget.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/select_table_card_widget.dart';
import 'package:foodtek/view/screens/widgets/slider_discount_widget.dart';
import 'package:foodtek/view/screens/widgets/slider_price_widget.dart';
import 'package:foodtek/view/screens/widgets/spicy_widget.dart';

//
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: _buildLocationIcon(),
        title: _buildLocationTitle(context),
        actions: [NotificationIcon()],
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: responsiveWidth(context, 16)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 22, top: responsiveHeight(context, 22)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter'.tr(),
                    style: TextStyle(
                      fontSize: responsiveWidth(context, 22),
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  SizedBox(height: responsiveHeight(context, 8)),
                  _buildSectionTitle(context, 'Price range'.tr()),
                  SizedBox(height: responsiveHeight(context, 24)),
                  Row(
                    children: [
                      minMaxContainer(context, 'Min'.tr()),
                      SizedBox(width: responsiveWidth(context, 16)),
                      minMaxContainer(context, 'Max'.tr())
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 24)),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: SliderPriceWidget(),
                  ),
                  SizedBox(height: responsiveHeight(context, 32)),
                  _buildSectionTitle(context, 'Discount'.tr()),
                  SizedBox(height: responsiveHeight(context, 24)),
                  Row(
                    children: [
                      minMaxContainer(context, 'Min'.tr()),
                      SizedBox(width: responsiveWidth(context, 16)),
                      minMaxContainer(context, 'Max'.tr())
                    ],
                  ),
                  SizedBox(height: responsiveHeight(context, 24)),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: DiscountSlider(),
                  ),
                  SizedBox(height: responsiveHeight(context, 32)),
                  _buildSectionTitle(context, 'Category'.tr()),
                  SizedBox(height: responsiveHeight(context, 24)),
                  _buildCategoryRow(context),
                  SizedBox(height: responsiveHeight(context, 32)),
                  _buildSectionTitle(context, 'Location'.tr()),
                  SizedBox(height: responsiveHeight(context, 24)),
                  _buildLocationRow(context),
                  SizedBox(height: responsiveHeight(context, 32)),
                  _buildSectionTitle(context, 'Dish'.tr()),
                  SizedBox(height: responsiveHeight(context, 24)),
                  _buildDishRow(context),
                  SizedBox(height: responsiveHeight(context, 24)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: responsiveWidth(context, 16),
        fontWeight: FontWeight.w600,
        color: Theme.of(context).textTheme.bodyMedium?.color?.withOpacity(0.6),
      ),
    );
  }

  Widget _buildLocationIcon() {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xff4FAF5A).withOpacity(0.1),
      ),
      child: const Icon(Icons.location_on, color: Color(0xff4FAF5A)),
    );
  }

  Widget _buildLocationTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Current location".tr(),
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).textTheme.bodySmall?.color?.withOpacity(0.6),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          "Jl. Soekarno Hatta 15A...",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryRow(BuildContext context) {
    return Row(
      children: [
        SelectableCard(
          title: 'Fast Food'.tr(),
          isSelected: selectedCategory == 'Fast Food'.tr(),
          onTap: () => setState(() => selectedCategory = 'Fast Food'.tr()),
        ),
        SizedBox(width: responsiveWidth(context, 10)),
        SelectableCard(
          title: 'Sea Food'.tr(),
          isSelected: selectedCategory == 'Sea Food'.tr(),
          onTap: () => setState(() => selectedCategory = 'Sea Food'.tr()),
        ),
        SizedBox(width: responsiveWidth(context, 10)),
        SelectableCard(
          title: 'Dessert'.tr(),
          isSelected: selectedCategory == 'Dessert'.tr(),
          onTap: () => setState(() => selectedCategory = 'Dessert'.tr()),
        ),
      ],
    );
  }

  Widget _buildLocationRow(BuildContext context) {
    return Row(
      children: [
        SelectableCard(
          title: '1 KM'.tr(),
          isSelected: selected1Category == '1 KM'.tr(),
          onTap: () => setState(() => selected1Category = '1 KM'.tr()),
        ),
        SizedBox(width: responsiveWidth(context, 10)),
        SelectableCard(
          title: '5 KM'.tr(),
          isSelected: selected1Category == '5 KM'.tr(),
          onTap: () => setState(() => selected1Category = '5 KM'.tr()),
        ),
        SizedBox(width: responsiveWidth(context, 10)),
        SelectableCard(
          title: '10 KM'.tr(),
          isSelected: selected1Category == '10 KM'.tr(),
          onTap: () => setState(() => selected1Category = '10 KM'.tr()),
        ),
      ],
    );
  }

  Widget _buildDishRow(BuildContext context) {
    List<String> dishes = [
      'Seafood Paella'.tr(),
      'Tuna Tartare'.tr(),
      'Spicy Crab Cakes'.tr(),
      'Clam Chowder'.tr(),
      'Miso-Glazed Cod'.tr(),
      'Lobster Thermidor'.tr()
    ];
    return Wrap(
      spacing: responsiveWidth(context, 10),
      runSpacing: responsiveHeight(context, 10),
      children: dishes.map((dish) {
        return SelectableCard(
          title: dish,
          isSelected: selected2Categories.contains(dish),
          onTap: () {
            setState(() {
              if (selected2Categories.contains(dish)) {
                selected2Categories.remove(dish);
              } else {
                selected2Categories.add(dish);
              }
            });
          },
        );
      }).toList(),
    );
  }
}