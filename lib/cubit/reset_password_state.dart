part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String message;
  ResetPasswordError(this.message);

  @override
  List<Object> get props => [message];
}
