part of 'otp_cubit.dart';

abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpVerified extends OtpState {}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
}
