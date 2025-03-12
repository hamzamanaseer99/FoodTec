// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import '../../utils/password_validator.dart';
//
// part 'reset_password_state.dart';
//
// class ResetPasswordCubit extends Cubit<ResetPasswordState> {
//   ResetPasswordCubit() : super(ResetPasswordInitial());
//
//   void resetPassword(String newPassword, String confirmPassword) {
//     if (newPassword != confirmPassword) {
//       emit(ResetPasswordError("Passwords do not match!"));
//       return;
//     }
//
//     if (!PasswordValidator.isValid(newPassword)) {
//       emit(ResetPasswordError(
//           "Password must contain uppercase, lowercase, number, special character, and be at least 8 characters long."));
//       return;
//     }
//
//     // محاكاة حفظ كلمة المرور في قاعدة البيانات
//     emit(ResetPasswordSuccess());
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodtek/view/screens/otp_screen.dart';
import '../../utils/password_validator.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  String? verifiedEmail; // ✅ تخزين البريد الإلكتروني بعد التحقق

  void verifyCode(String email, String code) {
    // محاكاة التحقق من الرمز (يمكنك ربطها بـ Firebase)
    if (code == "123456") { // ✅ استبدل هذا بالتحقق الحقيقي
      verifiedEmail = email; // حفظ البريد الإلكتروني
      emit(OtpVerificationScreen() as ResetPasswordState); // ✅ الانتقال إلى حالة التحقق الناجح
    } else {
      emit(ResetPasswordError("Invalid verification code!"));
    }
  }

  void resetPassword(String newPassword, String confirmPassword) {
    if (newPassword != confirmPassword) {
      emit(ResetPasswordError("Passwords do not match!"));
      return;
    }

    if (!PasswordValidator.isValid(newPassword)) {
      emit(ResetPasswordError(
          "Password must contain uppercase, lowercase, number, special character, and be at least 8 characters long."));
      return;
    }

    // ✅ محاكاة حفظ كلمة المرور في قاعدة البيانات
    emit(ResetPasswordSuccess());
  }
}
