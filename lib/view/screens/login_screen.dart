import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../cubit/login_cubit.dart';
import '../../homescreen.dart';
import 'reset_password_screen.dart';
import 'signup_screen.dart';
import 'widgets/email_widget.dart';
import 'widgets/password_widget.dart';
import 'widgets/social_loginbutton_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

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
        const SnackBar(content: Text("Fields cannot be empty")),
      );
      return;
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid email format")),
      );
      return;
    }

    await _saveCredentials(email, password);
    context.read<LoginCubit>().login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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
                          color: Colors.white,
                          fontFamily: "Protest Riot",
                        ),
                      ),
                    ),
                    const SizedBox(height: 42),
                    Container(
                      width: containerWidth,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Homescreen()),
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
                              const Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _SignUpText(screenWidth: screenWidth),
                              EmailWidget(emailEditingController: emailController),
                              const SizedBox(height: 16),
                              PasswordWidget(passwordEditingController: passwordController),
                              const SizedBox(height: 12),
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
                                        activeColor: Colors.green,
                                      ),
                                      Text(
                                        "Remember Me",
                                        style: TextStyle(
                                          fontSize: screenWidth < 350 ? 12 : 8, // تصغير الخط للشاشات الصغيرة
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey,
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
                                      'Forgot password?',
                                      style: TextStyle(
                                        fontSize: screenWidth < 350 ? 12 : 10, // ضبط الحجم حسب الشاشة
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              const SizedBox(height: 20),
                              state is LoginLoading
                                  ? const Center(
                                child: SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.green,
                                  ),
                                ),
                              )
                                  : SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: state is LoginLoading ? null : () => _handleLogin(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 3,
                                  ),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width < 350 ? 16 : 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20), // تباعد قبل الخط الفاصل

// 🔹 خط فاصل مع "OR"
                              Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade400, // لون أفتح لمظهر أنيق
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 12), // تصغير المسافة قليلاً
                                    child: Text(
                                      "OR",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                      thickness: 1,
                                      color: Colors.grey.shade400,
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
              "Don’t have an account?",
              style: TextStyle(
                color: Colors.grey,
                fontSize: screenWidth < 350 ? 12 : 14,
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
            "Sign Up",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.green,
              fontSize: screenWidth < 350 ? 12 : 14,
            ),
          ),
        ),
      ],
    );
  }
}
