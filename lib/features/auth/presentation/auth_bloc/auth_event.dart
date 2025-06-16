part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

final class LoginEvent extends AuthEvent {
  final String phoneNumber;
  final String otp;
  const LoginEvent(this.phoneNumber, this.otp);
  @override
  List<Object> get props => [phoneNumber,otp];
}

final class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final double? referCode;
  const RegisterEvent({
    required this.email,
    required this.name,
    required this.phoneNumber,
    this.referCode,
  });
  @override
  List<Object?> get props => [phoneNumber, email, name, referCode];
}
