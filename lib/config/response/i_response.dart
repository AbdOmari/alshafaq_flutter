import 'package:ashafaq/config/exceptions/base_exception.dart';

abstract interface class IResponse {
  int get statusCode;
  bool get isSucceed;
  BaseException? get exceptions;
}
