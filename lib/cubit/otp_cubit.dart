import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());

  void verifyOtp(List<String> otp) {
    if (otp.join().length == 4) {
      // Simulate OTP verification success
      emit(OtpVerified());
    } else {
      emit(OtpError("Invalid OTP. Please try again."));
    }
  }
}
