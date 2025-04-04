// import 'package:flutter/material.dart';
// import 'splash_screen.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Foodtek',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/botten_nav_cubit.dart';
import 'package:foodtek/cubit/home_cubit.dart';
import 'cubit/favorite_products_cubit.dart';
import 'cubit/location_cubit.dart';
import 'cubit/login_cubit.dart';
import 'cubit/reset_password_cubit.dart';
import 'cubit/signup_cubit.dart';
import 'model/location_repository.dart';
import 'view/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiBlocProvider(
      providers: [

          BlocProvider(create: (context) => LocationCubit(LocationRepository())),
          BlocProvider(create: (context) => LoginCubit()),
          BlocProvider(create: (context) => SignupCubit()),
          BlocProvider(create: (context) => BottomNavCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => ResetPasswordCubit()),
        BlocProvider(create: (_) => FavoriteProductsCubit()),        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: SplashScreen(), // اجعل شاشة البداية أول شاشة تظهر
      ),
    );
  }
}
