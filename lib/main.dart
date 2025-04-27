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
import 'cubit/theme_cubit.dart';
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
        BlocProvider(create: (_) => ThemeCubit()),
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
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return ScreenUtilInit(

            designSize: const Size(375, 812),
            builder: (_, __) => MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              themeMode: themeMode,

              // 🌞 Light Theme
              theme: ThemeData(

                brightness: Brightness.light,
                primaryColor: Color(0xff25AE4B),
                scaffoldBackgroundColor: Colors.white,

                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                ),
                textTheme: TextTheme(
                  bodyLarge: TextStyle(color: Colors.black),
                  bodyMedium: TextStyle(color: Colors.black87),
                ),
                iconTheme: IconThemeData(color: Colors.black87),
                switchTheme: SwitchThemeData(
                  thumbColor: MaterialStateProperty.all(Colors.deepOrange),
                  trackColor: MaterialStateProperty.all(Color(0xff25AE4B)),
                ),
                tabBarTheme: const TabBarTheme(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.deepOrange,
                ),

              ),

              // 🌙 Dark Theme
              darkTheme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: const Color(0xFF000000),
                primaryColor: Color(0xff25AE4B),
                colorScheme: const ColorScheme.dark(
                  primary: Color(0xff25AE4B),
                  secondary: Colors.deepOrangeAccent,
                  background: Color(0xFF000000),
                  surface: Color(0xFF121212),
                  onPrimary: Colors.white,
                  onSecondary: Colors.white70,
                  onBackground: Colors.white,
                  onSurface: Colors.white70,
                ),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Color(0xFF000000),
                  foregroundColor: Colors.white,
                  elevation: 0,
                ),
                iconTheme: const IconThemeData(
                  color: Colors.white70,
                ),
                textTheme: const TextTheme(
                  bodyLarge: TextStyle(color: Colors.white),
                  bodyMedium: TextStyle(color: Colors.white70),
                  titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                cardColor: const Color(0xFF1C1C1C),
                dividerColor: Colors.grey.shade800,
                switchTheme: SwitchThemeData(
                  thumbColor: MaterialStateProperty.all(Colors.deepOrange),
                  trackColor: MaterialStateProperty.all(Colors.deepOrangeAccent.withOpacity(0.5)),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Color(0xFF000000),
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.white70,
                ),
                tabBarTheme: const TabBarTheme(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.deepOrangeAccent,
                ),

              ),


              // routes & screens
              initialRoute: '/',
              routes: {
                '/': (context) => SplashScreen(),
                '/checkout': (context) => CheckoutScreen(userLocation: null),
                '/payment': (context) => PaymentScreen(),
                '/SetLocationScreen': (context) => SetLocationScreen(),
              },
            ),
          );
        },
      ),

    );
  }
}
