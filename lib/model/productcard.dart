// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:foodtek/model/product.dart';
//
// class ProductCard extends StatelessWidget {
//   final Product item;
//   final VoidCallback onFavoriteToggle;
//   final VoidCallback onOrderNow;
//
//   const ProductCard({
//     required this.item,
//     required this.onFavoriteToggle,
//     required this.onOrderNow,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.transparent,
//       elevation: 0,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(25),
//         side: BorderSide(
//           color: Colors.grey.shade300,
//           width: 1,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(11.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween, // توزيع رأسي
//           children: [
//             Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 Center(
//                   child: CircleAvatar(
//                     radius: 40,
//                     backgroundImage: item.image != null
//                         ? AssetImage(item.image!)
//                         : AssetImage('assets/images/default.png'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(
//                     item.isFavorite ? Icons.favorite : Icons.favorite_border,
//                     color: Colors.green,
//                   ),
//                   onPressed: onFavoriteToggle,
//                 ),
//               ],
//             ),
//             SizedBox(height: 5),
//             Text(
//               item.name ?? "No Name",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 6),
//             Text(
//               item.description ?? "No Description",
//               style: TextStyle(fontSize: 12, color: Colors.grey[700]),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 10),
//             Text(
//               "\$${(item.price ?? 0).toStringAsFixed(0)}",
//               style: TextStyle(fontSize: 16, color: Colors.green[800]),
//             ),
//             Spacer(), // يرفع الزر للأسفل
//             SizedBox(height: 10),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: onOrderNow,
//                 child: Text("Order Now"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.green,
//                   shape: StadiumBorder(),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }

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

    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
        side: BorderSide(
          color: Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(isSmallScreen ? 8.0 : 15.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(

                  children: [
                    // الصورة في المنتصف
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: isSmallScreen ? 30 : 50,
                        backgroundImage: item.image != null
                            ? AssetImage(item.image!)
                            : const AssetImage('assets/images/default.png'),
                      ),
                    ),
                    // أيقونة المفضلة في الزاوية العلوية اليمنى من Card
                    Positioned(
                      top: 0,
                      right: 0,
                      child: IconButton(
                        icon: Icon(
                          item.isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: Colors.green,
                          size: isSmallScreen ? 20 : 24,
                        ),
                        onPressed: onFavoriteToggle,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: isSmallScreen ? 4 : 6),
                Flexible(
                  child: Text(
                    item.name ?? "No Name",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 14 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 2 : 4),
                Flexible(
                  child: Text(
                    item.description ?? "No Description",
                    style: TextStyle(
                      fontSize: isSmallScreen ? 10 : 12,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 4 : 6),
                Text(
                  "\$${(item.price ?? 0).toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: isSmallScreen ? 16 : 18,
                    color: Colors.green[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: isSmallScreen ? 8 : 16),
                SizedBox(
                  width: double.infinity,
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
                      "Order Now",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 12 : 14,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}