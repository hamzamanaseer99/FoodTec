import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/home_cubit.dart';
import 'package:foodtek/view/screens/filter_screen.dart';
import 'package:foodtek/responsive.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(context, 16),
            vertical: responsiveHeight(context, 4),
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(responsiveWidth(context, 40)),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: TextField(
            style: TextStyle(
              fontSize: responsiveWidth(context, 14),
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: responsiveHeight(context, 12),
              ),
              hintText: "Search menu, restaurant or etc".tr(),
              hintStyle: TextStyle(
                color: const Color(0xff878787),
                fontSize: responsiveWidth(context, 14),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: const Color(0xff878787),
                size: responsiveWidth(context, 24),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.tune_rounded,
                  color: const Color(0xff878787),
                  size: responsiveWidth(context, 22),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FilterScreen(),
                    ),
                  );
                },
              ),
              border: InputBorder.none,
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
