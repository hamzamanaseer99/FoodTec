import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek/cubit/update_information_profile_cubit.dart';
import 'package:foodtek/cubit/update_information_profile_state.dart';
import 'package:foodtek/view/screens/profile%20screen.dart';
import 'package:foodtek/view/screens/widgets/address_widget.dart';
import 'package:foodtek/view/screens/widgets/avatar_widget.dart';
import 'package:foodtek/view/screens/widgets/email_widget.dart';
import 'package:foodtek/view/screens/widgets/password_widget.dart';
import 'package:foodtek/view/screens/widgets/phone_widget.dart';
import 'package:foodtek/view/screens/widgets/username_widget.dart';

class UpdateInformationScreen extends StatefulWidget {
  const UpdateInformationScreen({super.key});

  @override
  State<UpdateInformationScreen> createState() => _UpdateInformationScreenState();
}

class _UpdateInformationScreenState extends State<UpdateInformationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: SafeArea(
        child: BlocConsumer<UpdateInformationProfileCubit, UpdateInformationProfileState>(
          listener: (context, state) {
            if (state is UpdateInformationProfileSuccess) {
              // Navigate to profile screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) =>  ProfileScreen()),
              );

              // Clear fields after success
              _nameController.clear();
              _emailController.clear();
              _phoneController.clear();
              _passwordController.clear();
              _addressController.clear();
            }

            if (state is UpdateInformationProfileFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMessage)),
              );
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const AvatarWidget(),
                        SizedBox(height: 24),
                        _buildProfileForm(),
                        SizedBox(height: 32),
                        _buildUpdateButton(context),
                      ],
                    ),
                  ),
                ),
                if (state is UpdateInformationProfileLoading)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildProfileForm() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Color(0xffF5F5F5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 15,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            UsernameWidget(nameEditingController: _nameController),
            SizedBox(height: 16),
            EmailWidget(emailEditingController: _emailController),
            SizedBox(height: 16),
            PhoneWidget(phoneEditingController: _phoneController),
            SizedBox(height: 16),
            PasswordWidget(passwordEditingController: _passwordController),
            SizedBox(height: 16),
            AddressWidget(addressEditingController: _addressController),
          ],
        ),
      ),
    );
  }

  Widget _buildUpdateButton(BuildContext context) {
    return SizedBox(
      width: 295,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF25AE4B),
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            context.read<UpdateInformationProfileCubit>().updateProfile(
              name: _nameController.text.trim(),
              email: _emailController.text.trim(),
              phone: _phoneController.text.trim(),
              password: _passwordController.text.trim(),
              address: _addressController.text.trim(),
            );
          }
        },
        child: Text(
          'Update',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
