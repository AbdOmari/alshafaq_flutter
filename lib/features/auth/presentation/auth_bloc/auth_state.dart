part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoadingState extends AuthState {
  const AuthLoadingState();
}

final class AskOtpState extends AuthState {
  const AskOtpState();
}

final class LogInSuccessState extends AuthState {
  const LogInSuccessState();
}

final class RegisterSuccessState extends AuthState {
  const RegisterSuccessState();
}

final class RegisterErrorState extends AuthState {
  final String? nameError;
  final String? emailError;
  final String? phoneNumberError;
  final String? generalError;
  const RegisterErrorState({
    this.emailError,
    this.generalError,
    this.nameError,
    this.phoneNumberError,
  });
  @override
  List<Object?> get props => [
    emailError,
    generalError,
    nameError,
    phoneNumberError,
  ];
}

final class LoginErrorState extends AuthState {
  final String? phoneNumberError;
  final String? otpError;
  final String? generalError;
  const LoginErrorState({
    this.generalError,
    this.phoneNumberError,
    this.otpError,
  });
  @override
  List<Object?> get props => [generalError, phoneNumberError, otpError];
}
