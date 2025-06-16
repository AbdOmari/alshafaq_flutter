import 'package:ashafaq/config/response/base_response.dart';
import 'package:ashafaq/config/response/i_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/auth/data/exceptions/otp_exception.dart';
import 'package:dio/dio.dart';

final class OtpResponse implements IResponse {
  final Response _dioResponse;
  late final BaseResponse _baseResponse;
  OtpResponse.init(this._dioResponse) {
    final data = _dioResponse.data;
    _baseResponse = BaseResponse(
      _dioResponse.statusCode!,
      isSucceed: data[JsonKeys.success],
      exception: OtpException(_dioResponse),
    );
  }

  @override
  OtpException? get exceptions => _baseResponse.exception as OtpException;

  @override
  bool get isSucceed => _baseResponse.isSucceed;

  @override
  int get statusCode => _baseResponse.statusCode;
}
