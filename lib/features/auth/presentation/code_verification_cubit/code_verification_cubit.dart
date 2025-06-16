import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/auth/data/exceptions/otp_exception.dart';
import 'package:ashafaq/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'code_verification_state.dart';

class CodeVerificationCubit extends Cubit<CodeVerificationState> {
  final AuthRepoImpl _authRepoImpl;
  CodeVerificationCubit(this._authRepoImpl)
    : super(const CodeVerificationInitial());

  Future requestOtp(String phon) async {
    emit(const OtpLoadingState());
    try {
      await _authRepoImpl.requestOtp(phon);
      emit(const OtpSuccessState());
    } on OtpException catch (e) {
      emit(
        OtpFailureState(
          phoneError: e.errors?[JsonKeys.phone]?[0],
          error: e.message,
        ),
      );
    } catch (e) {
      emit(OtpFailureState(error: e.toString()));
    }
  }

  Future resendOtp(String phon) async {
    emit(const OtpLoadingState());
    try {
      await _authRepoImpl.resendOtp(phon);
      emit(const OtpSuccessState());
    } on OtpException catch (e) {
      emit(
        OtpFailureState(
          phoneError: e.errors?[JsonKeys.phone]?[0],
          error: e.message,
        ),
      );
    } catch (e) {
      emit(OtpFailureState(error: e.toString()));
    }
  }

  // Future checkOtp(String phone, String otp) async {
  //   try {
  //     emit(const OtpLoadingState());
  //     final result = await _authRepoImpl.verifyOtp(phone, otp);
  //     log('otp verification: $result');
  //     emit(const OtpSuccessState());
  //   } on OtpException catch (e) {
  //     emit(OtpFailureState(e.message!));
  //   } catch (e) {
  //     emit(OtpFailureState(e.toString()));
  //   }
  // }
}
