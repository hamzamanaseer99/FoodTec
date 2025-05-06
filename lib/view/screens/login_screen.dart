import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cubit/login_cubit.dart';
import '../../homescreen.dart';
import '../../model/user_location.dart';
import 'reset_password_screen.dart';
import 'signup_screen.dart';
import 'widgets/email_widget.dart';
import 'widgets/password_widget.dart';
import 'widgets/social_loginbutton_widget.dart';

class LoginScreen extends StatefulWidget {
  final UserLocation? userLocation; // نضيف متغير لاستقبال اللوكيشن

  const LoginScreen({super.key, this.userLocation});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
      if (rememberMe) {
        emailController.text = prefs.getString('savedEmail') ?? "";
        passwordController.text = prefs.getString('savedPassword') ?? "";
      }
    });
  }

  Future<void> _saveCredentials(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    if (rememberMe) {
      await prefs.setString('savedEmail', email);
      await prefs.setString('savedPassword', password);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('savedEmail');
      await prefs.remove('savedPassword');
      await prefs.setBool('rememberMe', false);
    }
  }


  void _handleLogin(BuildContext context) async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Fields cannot be empty".tr())),
      );
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid email format".tr())),
      );
      return;
    }

    await _saveCredentials(email, password);
    context.read<LoginCubit>().login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.green,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Pattern.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                double screenWidth = constraints.maxWidth;
                double containerWidth = screenWidth * 0.9;
                if (screenWidth > 600) containerWidth = 500; // تثبيت العرض للشاشات الكبيرة

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    Center(
                      child: Text(
                        'Foodtek',
                        style: TextStyle(
                          fontSize: screenWidth * 0.12 < 72 ? screenWidth * 0.12 : 72,
                          color: isDarkMode ? Colors.white : Colors.white,
                          fontFamily: "Protest Riot",
                        ),
                      ),

                    ),
                    const SizedBox(height: 42),
                    Container(
                      width: containerWidth,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.grey[900] : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),

                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomeScreen()),
                            );
                          } else if (state is LoginFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return Column(
                            children: [
                              Text(
                                'Login'.tr(),
                                style: TextStyle(
                                  color: isDarkMode ? Colors.white : Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(height: responsiveHeight(context, 12)),
                              _SignUpText(screenWidth: screenWidth),
                              SizedBox(height: responsiveHeight(context, 24)),
                              EmailWidget(emailEditingController: emailController),
                              SizedBox(height: responsiveHeight(context, 16)),
                              PasswordWidget(passwordEditingController: passwordController),
                              SizedBox(height: responsiveHeight(context, 16)),
                              Row(
                                mainAxisAlignment:MainAxisAlignment.spaceAround ,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: rememberMe,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            rememberMe = value ?? false;
                                          });
                                        },
                                        activeColor:  Color(0xff25AE4B),
                                      ),
                                      Text(
                                        "Remember Me".tr(),
                                        style: TextStyle(
                                          fontSize: responsiveWidth(context, 12), // ضبط الحجم حسب الشاشة
                                          fontWeight: FontWeight.w600,
                                          color: isDarkMode ? Colors.grey[300] : Colors.grey,
                                        ),
                                      ),

                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResetPasswordScreen(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'Forgot password?'.tr(),
                                      style: TextStyle(
                                        fontSize: responsiveWidth(context, 12), // ضبط الحجم حسب الشاشة
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff25AE4B),
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              const SizedBox(height: 24),
                              state is LoginLoading
                                  ?  Center(
                                child: SizedBox(
                                  width: responsiveWidth(context, 30),
                                  height: responsiveHeight(context, 30),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Color(0xff25AE4B),
                                  ),
                                ),
                              )
                                  : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: state is LoginLoading ? null : () => _handleLogin(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff25AE4B),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    elevation: 3,
                                  ),
                                  child: Text(
                                    "Login".tr(),
                                    style: TextStyle(
                                      fontSize: responsiveWidth(context, 16),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 24), // تباعد قبل الخط الفاصل

                              Row(
                                children: [
                                  Expanded(
                                    child:Divider(
                                      thickness: 1,
                                      color: isDarkMode ? Colors.grey[700] : Colors.grey.shade400,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12), // تصغير المسافة قليلاً
                                    child: Text(
                                      "OR".tr(),
                                      style: TextStyle(
                                        fontSize: responsiveWidth(context, 12),
                                        fontWeight: FontWeight.bold,
                                        color: isDarkMode ? Colors.grey[300] : Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      color: isDarkMode ? Colors.grey[700] : Colors.grey.shade400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              SocialLoginButtons(),
                            ],
                          );
                        },
                      ),

                    ),

                    const SizedBox(height: 70),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SignUpText extends StatelessWidget {
  final double screenWidth;

  const _SignUpText({required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              "Don’t have an account?".tr(),
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: responsiveWidth(context, 14),
                  fontWeight: FontWeight.w700

              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
          child: Text(
            "Sign Up".tr(),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xff25AE4B),
              fontSize: responsiveWidth(context, 12),

            ),
          ),
        ),
      ],
    );
  }
}
