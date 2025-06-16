import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:dio/dio.dart';

class BaseException implements Exception {
  final Response _response;
  const BaseException(Response response) : _response = response;

  String? get message => _message ?? 'Unexpected Error';

  Map<String, dynamic>? get errors => _exceptions; //Map<String,List>

  Map<String, dynamic>? get _exceptions => _responseBody?[JsonKeys.errors];

  String? get _message => _responseBody[JsonKeys.message];

  get _responseBody => _response.data;

  int? get statusCode => _response.statusCode;
}
