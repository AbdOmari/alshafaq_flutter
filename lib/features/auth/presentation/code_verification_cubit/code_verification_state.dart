part of 'code_verification_cubit.dart';

sealed class CodeVerificationState extends Equatable {
  const CodeVerificationState();

  @override
  List<Object?> get props => [];
}

final class CodeVerificationInitial extends CodeVerificationState {
  const CodeVerificationInitial();
}

final class OtpLoadingState extends CodeVerificationState {
  const OtpLoadingState();
}

final class OtpRequestSentState extends CodeVerificationState {
  final String phoneNumber;
  const OtpRequestSentState(this.phoneNumber);
  @override
  List<Object?> get props => [phoneNumber];
}

final class OtpSuccessState extends CodeVerificationState {
  const OtpSuccessState();
}

final class OtpFailureState extends CodeVerificationState {
  final String? phoneError;
  final String? error;
  const OtpFailureState({this.error,this.phoneError});
  @override
  List<Object?> get props => [error,phoneError];
}
