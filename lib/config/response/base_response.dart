import 'package:ashafaq/config/exceptions/base_exception.dart';

class BaseResponse {
  final int statusCode;
  final bool isSucceed;
  final BaseException? exception;
  const BaseResponse(
    this.statusCode, {
    required this.isSucceed,
    this.exception,
  });
}
