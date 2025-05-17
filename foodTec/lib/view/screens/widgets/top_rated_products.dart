

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/top_rated_cubit.dart';

import '../../../cubit/cart_cubit.dart';
import '../../../model/product.dart';

class TopRatedProducts extends StatelessWidget {
  const TopRatedProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (context) => TopRatedCubit(),
      child: SizedBox(
        height: 230,
        child: BlocBuilder<TopRatedCubit, TopRatedState>(
          builder: (context, state) {
            if (state is TopRatedLoaded) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return _buildProductCard(screenWidth, product, isDark, context);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(double screenWidth, Map<String, dynamic> product, bool isDark, BuildContext context) {
    return SizedBox(
      width: 170,
      child: Card(
        color: isDark ? const Color(0xff1F1F1F) : const Color(0xffFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isDark ? Colors.grey.shade700 : const Color(0xffDBF4D1),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14, top: 10),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.orange, size: 18),
                  SizedBox(width: screenWidth * 0.015),
                  Text(
                    product["rating"].toString(),
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            _buildProductImage(product),
            _buildProductDetails(screenWidth, product, isDark, context),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Map<String, dynamic> product) {
    return Container(
      height: 60,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
        child: Image.asset(product["image"], fit: BoxFit.contain),
      ),
    );
  }

  Widget _buildProductDetails(double screenWidth, Map<String, dynamic> product, bool isDark, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product["name"],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.040,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
          Text(
            product["description"],
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: screenWidth * 0.030,
              color: isDark ? Colors.grey[400] : const Color(0xff3B3B3B),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${product["price"]}",
                style: TextStyle(
                  color: const Color(0xff25AE4B),
                  fontSize: screenWidth * 0.035,
                ),
              ),
              _buildAddButton(screenWidth, context, product), // Pass the product
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton(double screenWidth, BuildContext context, Map<String, dynamic> product) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xff25AE4B),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            // Use the data from the product to add to the cart
            final productModel = Product(
              name: product["name"],
              price: product["price"],
              image: product["image"],
              images: product['images'] ?? '',

              description: product["description"],
            );

            // Ensure CartCubit is available in the context
            context.read<CartCubit>().addToCart(
              product: productModel,
              spicyLevel: 1.0,  // Default spicy level
              quantity: 1,      // Default quantity
            );
          },
          icon: Icon(Icons.add, size: screenWidth * 0.035, color: Colors.white),
        ),
      ),
    );
  }
}

