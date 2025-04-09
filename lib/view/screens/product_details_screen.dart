import 'package:flutter/material.dart';
import 'package:foodtek/homescreen.dart';
import 'package:foodtek/model/product.dart';
import 'package:foodtek/view/screens/filter_screen.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/search_widget.dart';
import 'package:foodtek/view/screens/widgets/selector_widget.dart';
import 'package:foodtek/view/screens/widgets/spicy_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: _buildLocationIcon(),
        title: _buildLocationTitle(),
        actions: [ NotificationIcon()],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(

              padding: const EdgeInsets.only(left: 30, right: 30, top: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   SearchWidget(),
                  const SizedBox(height: 30),
                  Container(
                    height: 203,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/detailse_product_image.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    product.name,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const Icon(Icons.star_half, color: Colors.amber, size: 18),
                      const SizedBox(width: 8),
                      Text(
                        '4.5 (89 reviews)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '\$9.5',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16),
                  ),

                  const SizedBox(height: 24),


                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Spicy',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff838383),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text('Quantity',
                          style: TextStyle(fontSize: 16,
                            color: Color(0xff838383),
                            fontWeight: FontWeight.w500,
                          ),
                      ),


                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SpicySlider(),
                      QuantitySelector()
                    ],

                  ),




                   //SpicySelector(),

                  const SizedBox(height: 24), // Replaced Spacer with fixed height
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FilterScreen())
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("طلب ${product.name} جاري...")),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                  "Add To cart",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),),
            ),
          )
        ],
      ),
    );
  }
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