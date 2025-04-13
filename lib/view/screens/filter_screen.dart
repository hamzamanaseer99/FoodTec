import 'package:flutter/material.dart';
import 'package:foodtek/responsive.dart';
import 'package:foodtek/view/screens/widgets/min_max_container_widget.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/select_table_card_widget.dart';
import 'package:foodtek/view/screens/widgets/slider_discount_widget.dart';
import 'package:foodtek/view/screens/widgets/slider_price_widget.dart';
import 'package:foodtek/view/screens/widgets/spicy_widget.dart';


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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 22, top: responsiveHeight(context, 22)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 22),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context, 8),
                ),
                Text(
                  'Price range',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.w600,
                    color: Color(0xff98A0B4),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Row(
                  children: [
                    minMaxContainer(context,'Min'),
                    SizedBox(
                      width: responsiveWidth(context, 16),
                    ),
                    minMaxContainer(context,'Max')
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: SliderPriceWidget(),
                ),
                SizedBox(
                  height: responsiveHeight(context, 32),
                ),
                Text(
                  'Discount',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.w600,
                    color: Color(0xff98A0B4),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Row(
                  children: [
                    minMaxContainer(context,'Min'),
                    SizedBox(
                      width: responsiveWidth(context, 16),
                    ),
                    minMaxContainer(context,'Max')
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 30),
                  child: DiscountSlider(),
                ),
                SizedBox(
                  height: responsiveHeight(context, 32),
                ),
                Text(
                  'Category',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.w600,
                    color: Color(0xff98A0B4),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Row(
                  children: [
                    SelectableCard(
                      title: 'Fast Food',
                      isSelected: selectedCategory == 'Fast Food',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Fast Food';
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: 'Sea Food',
                      isSelected: selectedCategory == 'Sea Food',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Sea Food';
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: 'Dessert',
                      isSelected: selectedCategory == 'Dessert',
                      onTap: () {
                        setState(() {
                          selectedCategory = 'Dessert';
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context, 32),
                ),
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.w600,
                    color: Color(0xff98A0B4),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Row(
                  children: [
                    SelectableCard(
                      title: '1 KM',
                      isSelected: selected1Category == '1 KM',
                      onTap: () {
                        setState(() {
                          selected1Category = '1 KM';
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: '5 KM',
                      isSelected: selected1Category == '5 KM',
                      onTap: () {
                        setState(() {
                          selected1Category = '5 KM';
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: '10 KM',
                      isSelected: selected1Category == '10 KM',
                      onTap: () {
                        setState(() {
                          selected1Category = '10 KM';
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context, 32),
                ),
                Text(
                  'Dish',
                  style: TextStyle(
                    fontSize: responsiveWidth(context, 16),
                    fontWeight: FontWeight.w600,
                    color: Color(0xff98A0B4),
                  ),
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Row(
                  children: [
                    SelectableCard(
                      title: 'Seafood Paella',
                      isSelected: selected2Categories.contains('Seafood Paella'),
                      onTap: () {
                        setState(() {
                          if (selected2Categories.contains('Seafood Paella')) {
                            selected2Categories.remove('Seafood Paella');
                          } else {
                            selected2Categories.add('Seafood Paella');
                          }
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: 'Tuna Tartare',
                      isSelected: selected2Categories.contains('Tuna Tartare'),
                      onTap: () {
                        setState(() {
                          if (selected2Categories.contains('Tuna Tartare')) {
                            selected2Categories.remove('Tuna Tartare');
                          } else {
                            selected2Categories.add('Tuna Tartare');
                          }
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: 'Spicy Crab Cakes',
                      isSelected: selected2Categories.contains('Spicy Crab Cakes'),
                      onTap: () {
                        setState(() {
                          if (selected2Categories.contains('Spicy Crab Cakes')) {
                            selected2Categories.remove('Spicy Crab Cakes');
                          } else {
                            selected2Categories.add('Spicy Crab Cakes');
                          }
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                  ],
                ),
                SizedBox(
                  height: responsiveHeight(context, 24),
                ),
                Row(
                  children: [
                    SelectableCard(
                      title: 'Clam Chowder',
                      isSelected: selected2Categories.contains('Clam Chowder'),
                      onTap: () {
                        setState(() {
                          if (selected2Categories.contains('Clam Chowder')) {
                            selected2Categories.remove('Clam Chowder');
                          } else {
                            selected2Categories.add('Clam Chowder');
                          }
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: 'Miso-Glazed Cod',
                      isSelected: selected2Categories.contains('Miso-Glazed Cod'),
                      onTap: () {
                        setState(() {
                          if (selected2Categories.contains('Miso-Glazed Cod')) {
                            selected2Categories.remove('Miso-Glazed Cod');
                          } else {
                            selected2Categories.add('Miso-Glazed Cod');
                          }
                        });
                      },
                    ),
                    SizedBox(width: responsiveWidth(context, 10)),
                    SelectableCard(
                      title: 'Lobster Thermidor',
                      isSelected: selected2Categories.contains('Lobster Thermidor'),
                      onTap: () {
                        setState(() {
                          if (selected2Categories.contains('Lobster Thermidor')) {
                            selected2Categories.remove('Lobster Thermidor');
                          } else {
                            selected2Categories.add('Lobster Thermidor');
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(context, 24)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLocationIcon() {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xff4FAF5A).withOpacity(0.1),
      ),
      child: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
    );
  }

  Widget _buildLocationTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Current location", style: TextStyle(fontSize: 12, color: Color(0xff606060))),
        SizedBox(height: 4),
        Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }
}
