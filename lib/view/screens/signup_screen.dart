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

    context.read<SignupCubit>().signup(fullName, email, birthDate, phoneNumber, password, confirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        children: [
          Image.asset(
            'assets/image/Pattern.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Center(
                  child: Text(
                    'Foodtek',
                    style: TextStyle(
                      fontSize: 80,
                      color: Colors.white,
                      fontFamily: "Protest Riot",
                    ),
                  ),
                ),
                const SizedBox(height: 42),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(
                    height: 750, // Adjusted for new fields
                    width: 343,
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
                            const Text(
                              'Sign up',
                              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                                    );
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Color(0xff25AE4B),
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            // Full Name
                            FullNameWidget(nameEditingController: fullNameController),
                            const SizedBox(height: 16),

                            // Email
                            EmailWidget(emailEditingController: emailController),
                            SizedBox(height: 16),

                            // Birth Date
                            BirthWidget(BithEditingController: birthDateController),
                            const SizedBox(height: 16),

                            // Phone Number
                            PhoneWidget(
                              phoneEditingController: phoneNumberController,
                            ),
                            const SizedBox(height: 16),

                            // Password
                            PasswordWidget(passwordEditingController: passwordController),
                            const SizedBox(height: 16),

                            // Confirm Password
                            ConfirmPasswordWidget(confirmPasswordEditingController: confirmPasswordController),
                            const SizedBox(height: 24),

                            // Signup Button
                            state is SignupLoading
                                ? const Center(child: CircularProgressIndicator())
                                : ElevatedButton(
                              onPressed: () => _handleSignup(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                              ),
                              child: Center(
                                child: const Text(
                                  "Sign Up",
                                  style: TextStyle(fontSize: 18, color: Colors.white),
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
            ),
          ),
        ],
      ),
    );
  }
}
