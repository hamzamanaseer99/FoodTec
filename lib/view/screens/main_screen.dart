import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/home_cubit.dart';
import 'package:foodtek/view/screens/burger_screen.dart';
import 'package:foodtek/view/screens/pizaa_screen.dart';
import 'package:foodtek/view/screens/sandwich_screen.dart';
import 'package:foodtek/view/screens/widgets/dot_widget.dart';
import 'package:foodtek/view/screens/widgets/offer_widget.dart';
import 'package:foodtek/view/screens/widgets/recomended_widget.dart';
import 'package:foodtek/view/screens/widgets/search_widget.dart';

class MainScreen extends StatelessWidget {
  final List<String> categories = ["All", "Burger", "Pizza", "Sandwich"];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(

          margin: EdgeInsets.only(left: 15, top: 8, bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(0xff4FAF5A).withOpacity(0.1),
          ),
          child: Icon(Icons.location_on, color: Color(0xff4FAF5A)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Current location",
                style: TextStyle(fontSize: 12, color: Color(0xff606060))),
            SizedBox(height: 4),
            Text("Jl. Soekarno Hatta 15A...",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              margin: EdgeInsets.only(right: 8, left: 8),
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffF5F5F5),
              ),
              child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 24, vertical: 22),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              SizedBox(height: 30),

              // 🔥 شريط الفئات
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Container(
                    height: screenHeight * 0.13,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        final selectedCategory = state is HomeCategorySelected
                            ? state.category
                            : "All";

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ChoiceChip(
                            label: Text(category),
                            selected: category == selectedCategory,
                            selectedColor: Colors.green,
                            labelStyle: TextStyle(
                              color: category == selectedCategory
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            onSelected: (_) {
                              if (category == "Burger") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BurgerScreen()),
                                );
                              } else if (category == "Pizza") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PizzaScreen()),
                                );
                              } else if (category == "Sandwich") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SandwichScreen()),
                                );
                              } else {
                                context
                                    .read<HomeCubit>()
                                    .selectCategory(category);
                              }
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              SizedBox(height: 22),

              OfferWidget(),

              SizedBox(height: 6,),

              DotsNav(),

              SizedBox(height: 6,),

              Text(
                'Top Rated',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth*0.055),
              ),
              SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 209,
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    List<Map<String, dynamic>> displayProducts =
                        context.read<HomeCubit>().allProducts;

                    if (state is HomeSearchResults) {
                      displayProducts = state.filteredProducts;
                    } else if (state is HomeCategorySelected) {
                      displayProducts = context
                          .read<HomeCubit>()
                          .filterProductsByCategory(state.category);
                    }

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: displayProducts.length,
                      itemBuilder: (context, index) {
                        final product = displayProducts[index];
                        return Container(
                          width: 155,
                          child: Card(
                            color: Color(0xffffffff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Color(0xffDBF4D1)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12,top: 8),
                                  child: Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.orange,
                                          size: 16),
                                      SizedBox(width: screenWidth*0.013),
                                      //Text(product["subtitle"].toString()),
                                      Text(
                                          product["rating"].toString(),
                                      style: TextStyle(fontSize: screenWidth*0.040),),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4,),
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                    child: Image.asset(
                                      product["image"],
                                      fit: BoxFit.contain,
                                    ),
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product["name"],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: screenWidth*0.035),
                                      ),
                                      Text(
                                        '100 gr chicken + tomato\n + cheese  Lettuce',
                                      style: TextStyle(fontSize: screenWidth*0.028,
                                      color: Color(0xff3B3B3B)
                                      ),
                                      ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Text("\$${product["price"]}",
                                              style: TextStyle(
                                                  color: Color(0xff25AE4B),
                                                fontSize: screenWidth * 0.030
                                              ),
                                          ),

                                          SizedBox(
                                            height: screenHeight*0.08,
                                            width: screenWidth*0.08,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                color: Color(0xff25AE4B),
                                              ),
                                              child: IconButton(onPressed: (){},
                                                  icon: Icon(Icons.add,
                                                    size: screenWidth*0.04,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          )

                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended',
                    style: TextStyle(
                        fontSize: screenWidth*0.045,
                        fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'View All',
                            style: TextStyle(
                                color: Color(0xff25AE4B),
                               fontSize: screenWidth*0.035
                            ),
                          )),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Color(0xff25AE4B),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RecommendedWidget(
                    image: 'assets/images/sushi1.png',
                    price: 103.0,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  RecommendedWidget(
                    price: 50.0,
                    image: 'assets/images/breakfast2.png',
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  RecommendedWidget(
                    image: 'assets/images/breakfast.png',
                    price: 12.99,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  RecommendedWidget(
                    price: 8.20,
                    image: 'assets/images/icecreem.png',
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
                                  ),*/
