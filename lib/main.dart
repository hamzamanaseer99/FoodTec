import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:foodtek/cubit/botten_nav_cubit.dart';
import 'package:foodtek/cubit/cart_cubit.dart';
import 'package:foodtek/cubit/home_cubit.dart';
import 'package:foodtek/cubit/update_information_profile_cubit.dart';
import 'package:foodtek/view/screens/checkout_screen.dart';
import 'package:foodtek/view/screens/payment_screen.dart';
import 'package:foodtek/view/screens/setlocationscreen.dart';
import 'cubit/favorite_products_cubit.dart';
import 'cubit/history_cubit.dart';
import 'cubit/location_cubit.dart';
import 'cubit/login_cubit.dart';
import 'cubit/reset_password_cubit.dart';
import 'cubit/signup_cubit.dart';
import 'model/location_repository.dart';
import 'view/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
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
        BlocProvider(create: (_) => FavoriteProductsCubit()),
        BlocProvider(create: (_) => UpdateInformationProfileCubit()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => HistoryCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (_, __) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: '/',
          routes: {
            '/': (context) => SplashScreen(),
            '/checkout': (context) => CheckoutScreen(userLocation: null),
            '/payment': (context) => PaymentScreen(),
            '/SetLocationScreen': (context) => SetLocationScreen(),
          },
        ),
      ),
    );
  }
}
