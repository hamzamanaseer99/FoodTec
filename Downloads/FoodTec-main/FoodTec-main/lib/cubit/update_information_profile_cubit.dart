import 'package:bloc/bloc.dart';
import 'package:foodtek/cubit/update_information_profile_state.dart';

class UpdateInformationProfileCubit extends Cubit<UpdateInformationProfileState> {
  UpdateInformationProfileCubit() : super(const UpdateInformationProfileInitial());

  Future<void> updateProfile({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String address,
  }) async {
    emit(const UpdateInformationProfileLoading());

    final String? validationMessage = _validateInputs(name, email, phone, password, address);

    if (validationMessage != null) {
      emit(UpdateInformationProfileFailure(validationMessage));
      return;
    }

    try {
      await Future.delayed(const Duration(seconds: 2));

      emit(const UpdateInformationProfileSuccess());

      print('====== Profile Updated Successfully ======');
      print('Name    : $name');
      print('Email   : $email');
      print('Phone   : $phone');
      print('Address : $address');
      print('==========================================');

    } catch (error, stackTrace) {
      print('====== Update Profile Error ======');
      print('Error: $error');
      print('StackTrace: $stackTrace');
      print('==================================');

      emit(UpdateInformationProfileFailure('Failed to update profile, please try again later.'));
    }
  }

  String? _validateInputs(String name, String email, String phone, String password, String address) {
    if (name.isEmpty || email.isEmpty || phone.isEmpty || password.isEmpty || address.isEmpty) {
      return "All fields are required";
    }

    if (name.length < 3) {
      return "Full Name must be at least 3 characters";
    }

    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(email)) {
      return "Invalid email format";
    }

    final RegExp phoneRegex = RegExp(r'^(77|78|79)\d{7}$');
    if (!phoneRegex.hasMatch(phone)) {
      return 'Invalid phone number. Must start with 077, 078, or 079 and be 10 digits long.';
    }

    if (!RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{6,}$").hasMatch(password)) {
      return "Password must contain at least:\n- One uppercase letter\n- One lowercase letter\n- One number\n- One special character";
    }

    return null;
  }
}
