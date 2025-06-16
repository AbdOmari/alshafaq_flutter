import 'package:ashafaq/config/response/base_response.dart';
import 'package:ashafaq/config/response/i_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/auth/data/exceptions/auth_exceptions.dart';
import 'package:ashafaq/features/auth/data/models/m_user.dart';
import 'package:dio/dio.dart';

class AuthResponse implements IResponse {
  late final Response _dioResponse;
  late final BaseResponse _baseResponse;

  late UserModel? _user;
  late String _accessToken;
  AuthResponse.init(this._dioResponse) {
    final data = _dioResponse.data;
    _baseResponse = BaseResponse(
      _dioResponse.statusCode!,
      isSucceed: data[JsonKeys.success],
      exception: AuthException(_dioResponse),
    );
    if (isSucceed) {
      final userData = data[JsonKeys.data];
      _accessToken = data[JsonKeys.accessToken];
      _user = UserModel.fromJson(userData);
    }
  }

  UserModel? get user => _user;

  String? get accessToken => _accessToken;
  @override
  int get statusCode => _baseResponse.statusCode;
  @override
  AuthException? get exceptions => _baseResponse.exception as AuthException;
  @override
  bool get isSucceed => _baseResponse.isSucceed;
}


/*
[log] register service: body: {success: true, data: {id: 86, name: Mamado, email: Mm@gmail.com, online: false, socket_id: user-86, type: user, phone: 580963250, image: https://ashafaq.dev.tqnia.me/admin/avatar.jpg, status: false, is_phone_verified: false, is_email_verified: false, notification_enabled: true, unread_notifications: 0}, errors: {}, message: , token: Zv51XwsMuG082HD2TNQBm7z6RUr9bVHFZUYsR8I766e3d49c} */