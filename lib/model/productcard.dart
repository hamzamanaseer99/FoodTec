import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:foodtek/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product item;
  final VoidCallback onFavoriteToggle;
  final VoidCallback onOrderNow;

  const ProductCard({
    super.key,
    required this.item,
    required this.onFavoriteToggle,
    required this.onOrderNow,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 400;

    return SizedBox(
      height: isSmallScreen ? 240 : 270,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // الكارد الأساسي (يبدأ بعد الصورة)
          Positioned(
            top: isSmallScreen ? 30 : 40,
            left: 0,
            right: 0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
                side: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 50, 15, 55),
                child: Column(
                  children: [
                    Text(
                      item.name.tr() ?? "No Name",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 14 : 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.description.tr() ?? "No Description",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 10 : 12,
                        color: Colors.grey[700],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "\$${(item.price ?? 0).toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 16 : 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

           Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: isSmallScreen ? 30 : 40,
                backgroundColor: Colors.white,
                backgroundImage: item.image != null
                    ? AssetImage(item.image!)
                    : const AssetImage('assets/images/default.png'),
              ),
            ),
          ),

           Positioned(
  top: 20,
  right: 0, // على الحافة اليمنى
  child: IconButton(
    icon: Icon(
      item.isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.green,
      size: isSmallScreen ? 20 : 24,
    ),
    onPressed: onFavoriteToggle,
  ),
),

          // زر الطلب
          Positioned(
  bottom: 0,
  left: 0,
  right: 0,
  child: Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: 105,
        child: ElevatedButton(
          onPressed: onOrderNow,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            shape: const StadiumBorder(),
            padding: EdgeInsets.symmetric(
              vertical: isSmallScreen ? 8 : 12,
            ),
          ),
          child: Text(
            "Order Now".tr(),
            style: TextStyle(
              fontSize: isSmallScreen ? 12 : 14,
            ),
          ),
        ),
      ),
    ),
  ),
),

        ],
      ),
    );
  }
}
