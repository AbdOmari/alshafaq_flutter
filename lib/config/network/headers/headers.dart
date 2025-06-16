import 'package:ashafaq/core/constants/json_keys.dart';

final class RequestHeaders {
  Map<String, dynamic> getHeaders(String token) {
    return {JsonKeys.authorization: 'Bearer $token', ...headers};
  }

  static const _headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
  };
  Map<String, dynamic> get headers => _headers;
}
