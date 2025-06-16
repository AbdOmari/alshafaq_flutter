import 'dart:developer';

import 'package:ashafaq/features/auth/data/services_impl/auth_service_impl.dart';
import 'package:ashafaq/features/auth/domain/entities/user_with_token.dart';
import 'package:ashafaq/features/auth/domain/i_repo/i_auth_repo.dart';

final class AuthRepoImpl implements IAuthRepo {
  final AuthServiceImpl _authServiceImpl;
  const AuthRepoImpl(this._authServiceImpl);
  @override
  Future<UserWithToken> login(String phoneNumber, String otp) async {
    log('login repo: start');
    final result = await _authServiceImpl.login(phoneNumber, otp);

    if (result.isSucceed) {
      log('login repo: success: ${result.user}');
      return UserWithToken(result.user!, result.accessToken!);
    }
    log('login repo: failure');
    throw result.exceptions!;
  }

  @override
  Future<UserWithToken> register({
    required String email,
    required String name,
    required String phoneNumber,
    double? referCode,
  }) async {
    log('register repo: start');
    final result = await _authServiceImpl.register(
      email: email,
      name: name,
      phoneNumber: phoneNumber,
    );
    if (result.isSucceed) {
      log('register repo: succeed: ${result.accessToken}');
      return UserWithToken(result.user!, result.accessToken!);
    }
    log('register repo: failed: ${result.exceptions}');
    throw result.exceptions!;
  }

  @override
  Future<bool> verifyOtp(String phone, String otp) async {
    final result = await _authServiceImpl.verifyOtp(phone, otp);
    //?if result is 200 then we got it successfully if not we will throw an exception.
    if (result.isSucceed) return true;

    throw result.exceptions!;
  }

  @override
  Future requestOtp(String phone) async {
    final result = await _authServiceImpl.requestOtp(phone);
    if (result.isSucceed) {
      return true;
    }
    throw result.exceptions!;
  }

  @override
  Future resendOtp(String phone) async {
    final result = await _authServiceImpl.resendOtp(phone);
    if (result.isSucceed) {
      return true;
    }
    throw result.exceptions!;
  }
}
