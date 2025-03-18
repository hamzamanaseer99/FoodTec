import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/home_cubit.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
              border: Border.all(
                color: Colors.grey,

              )
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search menu, restaurant or etc",
              hintStyle: TextStyle(
                color: Color(0xff878787),
                fontSize: screenWidth * 0.022,
              ),

              prefixIcon: Icon(
                Icons.search,
                color: Color(0xff878787),
                size: screenWidth * 0.07,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.tune_rounded,
                  color: Color(0xff878787),
                  size: screenWidth * 0.06,
                ),
                onPressed: () {
                  // يمكن فتح نافذة تصفية لاحقًا
                },
              ),
                border: InputBorder.none
            ),
            onChanged: (query) {
              context.read<HomeCubit>().searchProducts(query);
            },
          ),
        );
      },
    );
  }
}
