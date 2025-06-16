import 'dart:developer';

import 'package:ashafaq/config/helpers/dio_helper.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/core/request/endpoints.dart';
import 'package:ashafaq/features/auth/data/response/login_response.dart';
import 'package:ashafaq/features/auth/data/response/otp_response.dart';
import 'package:ashafaq/features/auth/data/response/register_response.dart';
import 'package:ashafaq/features/auth/domain/i_services/i_auth_service.dart';

final class AuthServiceImpl implements IAuthService {
  final DioHelper _dioHelper;

  const AuthServiceImpl(this._dioHelper);
  @override
  Future<LoginResponse> login(String phoneNumber, String otp) async {
    log('login service: start: $phoneNumber and otp $otp');
    final response = await _dioHelper.post(
      loginEndPoint,
      headers: _dioHelper.requestHeaders.headers,
      body: {JsonKeys.phone: phoneNumber, JsonKeys.otp: otp},
    );
    log('login service: date: ${response.data}');
    return LoginResponse.init(response);
  }

  @override
  Future<RegisterResponse> register({
    required String email,
    required String name,
    required String phoneNumber,
    double? referCode,
  }) async {
    log('register service: start');
    final response = await _dioHelper.post(
      registerEndPoint,
      headers: _dioHelper.requestHeaders.headers,
      body: {
        JsonKeys.name: name,
        JsonKeys.phone: phoneNumber,
        JsonKeys.email: email,
        JsonKeys.referCode: referCode,
      },
    );
    log('register service: body: ${response.data}');
    return RegisterResponse.init(response);
  }

  @override
  Future<OtpResponse> verifyOtp(String phone, String otp) async {
    final response = await _dioHelper.post(
      verifyPhoneEndPoint,
      headers: _dioHelper.requestHeaders.headers,
      body: {JsonKeys.phone: phone, JsonKeys.otp: otp},
    );
    return OtpResponse.init(response);
  }

  @override
  Future<OtpResponse> requestOtp(String phone) async {
    final response = await _dioHelper.post(
      sendOtpEndPoint,
      headers: _dioHelper.requestHeaders.headers,
      body: {JsonKeys.phone: phone},
    );
    log('otp response: $response');
    return OtpResponse.init(response);
  }
  
  @override
  Future resendOtp(String phone) async{
    final response = await _dioHelper.post(
      resendOtpEndPoint,
      headers: _dioHelper.requestHeaders.headers,
      body: {JsonKeys.phone: phone},
    );
    log('resend otp response: $response');
    return OtpResponse.init(response);
  }
}
