
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screens/widgets/location_title_in_appbar_widget.dart';
import 'package:foodtek/view/screens/widgets/menu_widget.dart';
import 'package:foodtek/view/screens/widgets/notification_icon.dart';
import 'package:foodtek/view/screens/widgets/search_widget.dart';
import '../../cubit/favorite_products_cubit.dart';
import '../../model/product.dart';
import '../../model/productcard.dart';
import 'product_details_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key, required List<Product> favoriteProducts});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? Colors.black : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black;
    final appBarColor = isDark ? Colors.black : Colors.white;
    final appBarIconColor = isDark ? Colors.white : Colors.green;
    final favoritesTitleColor = isDark ? Colors.white : Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        leading: _buildLocationIcon(appBarIconColor),
        title: LocationTitleWidget(theme: theme),
        actions: [NotificationIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchWidget(),
            SizedBox(height: 30),
            Text(
              'favorites'.tr(),
              style: TextStyle(
                fontSize: 20,
                color: favoritesTitleColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),

            Expanded(
              child: BlocBuilder<FavoriteProductsCubit, List<Product>>(
                builder: (context, favoriteProducts) {
                  print("Rebuilding FavoriteScreen with: $favoriteProducts");

                  if (favoriteProducts.isEmpty) {
                    return Center(
                      child: Text(
                        "No Favorite Products".tr(),
                        style: TextStyle(color: textColor),
                      ),
                    );
                  }

                  // ✅ استخدام MenuGridWidget
                  return MenuGridWidget(
                    products: favoriteProducts,
                    onFavoriteToggle: (item) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Remove from Favorites".tr(), style: TextStyle(color: textColor)),
                          content: Text("Are you sure?".tr(), style: TextStyle(color: textColor)),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<FavoriteProductsCubit>().removeFromFavorites(item);
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                height: 48,
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.black12, width: 1),
                                ),
                                child: Center(
                                  child: Text(
                                    "Yes".tr(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    onOrderNow: (item) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetailsScreen(product: item),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationIcon(Color iconColor) {
    return Container(
      margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Color(0xff4FAF5A).withOpacity(0.1),
      ),
      child: Icon(Icons.location_on, color: iconColor),
    );
  }

  Widget _buildLocationTitle(Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Current location".tr(), style: TextStyle(fontSize: 12, color: Color(0xff606060))),
        SizedBox(height: 4),
        Text("Jl. Soekarno Hatta 15A...", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: textColor)),
      ],
    );
  }
}
