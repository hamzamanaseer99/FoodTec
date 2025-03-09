import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/login_cubit.dart';
import 'package:foodtek/view/screens/signup_screen.dart';
import 'package:foodtek/view/screens/widgets/email_widget.dart';
import 'package:foodtek/view/screens/widgets/password_widget.dart';
import 'package:foodtek/view/screens/widgets/social_loginbutton_widget.dart';

import '../../homescreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  bool rememberMe = false; // Checkbox state

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 74, left: 61, right: 61),
                  child: Center(
                    child: Text(
                      'Foodtek',
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontFamily: "Protest Riot",
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 42),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    child: Container(
                      width: 363,
                      height: 661,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
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
                              Padding(
                                padding: const EdgeInsets.only(top: 24),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don’t have an account?",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignupScreen()),
                                      );
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: EmailWidget(
                                    emailEditingController: emailEditingController),
                              ),
                              SizedBox(height: 16),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: PasswordWidget(
                                    passwordEditingController:
                                    passwordEditingController),
                              ),
                              SizedBox(height: 12),

                              // Row containing Remember Me checkbox and Forgot Password button
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 24),
                                child: Row(
                                  children: [
                                    // Remember Me Checkbox
                                    Flexible(
                                      child: CheckboxListTile(
                                        title: Text(
                                          "Remember Me",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.grey),
                                        ),
                                        value: rememberMe,
                                        onChanged: (bool? value) {
                                          setState(() {
                                            rememberMe = value ?? false;
                                          });
                                        },
                                        controlAffinity: ListTileControlAffinity
                                            .leading, // Checkbox on the left
                                        activeColor: Colors.green,
                                      ),
                                    ),
                                    // Forgot Password Button
                                    TextButton(
                                      onPressed: () {
                                        // Handle Forgot password logic
                                      },
                                      child: Text(
                                        'Forgot password',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20),

                              // Login Button
                              state is LoginLoading
                                  ? CircularProgressIndicator()
                                  : ElevatedButton(
                                onPressed: state is LoginLoading
                                    ? null // Disable the button when loading
                                    : () {
                                  String email =
                                      emailEditingController.text;
                                  String password =
                                      passwordEditingController.text;

                                  // Validate fields
                                  if (email.isEmpty || password.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Fields cannot be empty"),
                                      ),
                                    );
                                    return;
                                  }

                                  // Email format validation
                                  if (!RegExp(
                                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                      .hasMatch(email)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Invalid email format"),
                                      ),
                                    );
                                    return;
                                  }

                                  // Proceed with login
                                  context.read<LoginCubit>().login(email, password);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 120, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: state is LoginLoading
                                    ? CircularProgressIndicator(color: Colors.white)
                                    : Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              Row(
                                children: [
                                  // First Divider
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 24),
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    ),
                                  ),
                                  // Text in the middle of the two dividers
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16, right: 16),
                                    child: Text(
                                      "OR",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ),
                                  // Second Divider
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              SocialLoginButtons(),


                            ],
                          );
                        },
                      ),
                    ),

                  ),

                ),
                SizedBox(
                  height: 70,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
