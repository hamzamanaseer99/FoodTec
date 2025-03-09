import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// States
abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {}
class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}

// Cubit Class
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      emit(LoginFailure("Fields cannot be empty"));
      return;
    }

    emit(LoginLoading());

    // Simulate a delay for login attempt
    Future.delayed(const Duration(seconds: 2), () {
      if (email == "test@example.com" && password == "password123") {
        emit(LoginSuccess()); // ✅ Emit success state
      } else {
        emit(LoginFailure("Invalid email or password")); // ✅ Emit failure state
      }
    });
  }

}
