import 'dart:developer';

import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/config/response/base_response.dart';
import 'package:ashafaq/config/response/i_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';

import 'package:dio/dio.dart';

class PackagesResponse implements IResponse {
  late final BaseResponse _baseResponse;
  late final Response _dioResponse;
  PackagesResponse.init(this._dioResponse) {
    final resData = _dioResponse.data;
    _baseResponse = BaseResponse(
      _dioResponse.statusCode!,
      isSucceed: resData[JsonKeys.success],
      exception: BaseException(_dioResponse),
    );
    if (isSucceed) {
      //?this will be done later but now we will just return the list we
      //?already create
      final data = resData[JsonKeys.data];
      log('response data: $data');
    }
  }

  Response get dioResponse => _dioResponse;
  @override
  BaseException? get exceptions => _baseResponse.exception;

  @override
  bool get isSucceed => _baseResponse.isSucceed;

  @override
  int get statusCode => _baseResponse.statusCode;
}
