import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/view/screens/widgets/birth_widget.dart';
import 'package:foodtek/view/screens/widgets/confirm_password_widget.dart';
import 'package:foodtek/view/screens/widgets/email_widget.dart';
import 'package:foodtek/view/screens/widgets/full_name_widget.dart';
import 'package:foodtek/view/screens/widgets/password_widget.dart';
import 'package:foodtek/view/screens/widgets/phone_widget.dart';

import '../../cubit/signup_cubit.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void _handleSignup(BuildContext context) {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final birthDate = birthDateController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    context.read<SignupCubit>().signup(
      fullName,
      email,
      birthDate,
      phoneNumber,
      password,
      confirmPassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

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
                double containerWidth = constraints.maxWidth * 0.9;
                if (constraints.maxWidth > 600) {
                  containerWidth = 500;
                }

                return Column(
                  children: [
                    const SizedBox(height: 80),
                    Center(
                      child: Text(
                        'Foodtek',
                        style: TextStyle(
                          fontSize: screenWidth * 0.12, // تصغير الحجم بناءً على عرض الشاشة
                          color: Colors.white,
                          fontFamily: "Protest Riot",
                        ),
                      ),
                    ),
                    const SizedBox(height: 42),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Container(
                        width: containerWidth,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: BlocConsumer<SignupCubit, SignupState>(
                          listener: (context, state) {
                            if (state is SignupSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Signup Successful!")),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginScreen()),
                              );
                            } else if (state is SignupFailure) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(state.error)),
                              );
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.arrow_back, size: 24),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'Sign up',
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.08,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                /// ✅ تحسين عرض جملة "Already have an account? Login"
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          "Already have an account?",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: screenWidth < 350 ? 12 : 14, // تصغير الخط للشاشات الصغيرة
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                                        );
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                          color: Color(0xff25AE4B),
                                          fontWeight: FontWeight.w600,
                                          fontSize: screenWidth < 350 ? 12 : 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                /// ✅ الحقول الخاصة بالتسجيل
                                FullNameWidget(nameEditingController: fullNameController),
                                const SizedBox(height: 16),
                                EmailWidget(emailEditingController: emailController),
                                const SizedBox(height: 16),
                                BirthWidget(BithEditingController: birthDateController),
                                const SizedBox(height: 16),
                                PhoneWidget(
                                  phoneEditingController: phoneNumberController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a phone number';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),
                                PasswordWidget(passwordEditingController: passwordController),
                                const SizedBox(height: 16),
                                ConfirmPasswordWidget(confirmPasswordEditingController: confirmPasswordController),
                                const SizedBox(height: 24),

                                /// ✅ زر التسجيل
                                state is SignupLoading
                                    ? const Center(child: CircularProgressIndicator())
                                    : SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () => _handleSignup(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    child: const Text(
                                      "Register",
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
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
