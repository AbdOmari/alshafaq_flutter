import 'dart:convert';
import 'dart:developer';
import 'package:ashafaq/config/exceptions/network_exception.dart';
import 'package:ashafaq/config/helpers/internet_connection_helper.dart';
import 'package:ashafaq/config/network/headers/headers.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
import 'dart:io';

final class DioHelper {
  static final _dio = Dio();

  final RequestHeaders _headers;
  final InternetConnectionHelper _connectionHelper;
  RequestHeaders get requestHeaders => _headers;
  const DioHelper(this._headers, this._connectionHelper);

  Future<bool> isConnectedToInternet() async {
    final isConnected = await _connectionHelper.isConnectedToInternet();
    if (isConnected) return true;
    throw const NetworkException(
      'no internet connection',
      NetworkExceptionType.noInternet,
    );
  }

  Future<FormData> createFormData({
    required String fileKey,
    required File file,
    required Map<String, dynamic> json,
  }) async {
    // Prepare the form data
    final formData = FormData.fromMap({
      ...json,
      fileKey: await MultipartFile.fromFile(
        file.path,
        filename: basename(file.path),
      ),
    });
    return formData;
  }

  Future<Response> post(
    String url, {
    required Map<String, dynamic> headers,
    required Object? body,
  }) async {
    await isConnectedToInternet();
    try {
      final response = await _dio.request(
        url,
        data: body is FormData ? body : json.encode(body),
        options: Options(
          method: 'POST',
          headers: headers,
          responseType: ResponseType.json,
          validateStatus: (_) => true,
        ),
      );
      return response;
    } on DioException catch (e) {
      throw _handelNetworkException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String url, {
    required Map<String, dynamic> headers,
    Map<String, dynamic>? body,
  }) async {
    try {
      await isConnectedToInternet();
      final response = await _dio.request(
        url,
        data: json.encode(body),
        options: Options(
          method: 'DELETE',
          headers: headers,
          responseType: ResponseType.json,
          validateStatus: (_) => true,
        ),
      );
      return response;
    } on DioException catch (e) {
      throw _handelNetworkException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> patch(
    String url, {
    required Map<String, dynamic> headers,
    required Map<String, dynamic> body,
  }) async {
    await isConnectedToInternet();
    try {
      final response = await _dio.request(
        url,
        data: json.encode(body),
        options: Options(
          method: 'PATCH',
          headers: headers,
          responseType: ResponseType.json,
          validateStatus: (_) => true,
        ),
      );
      return response;
    } on DioException catch (e) {
      throw _handelNetworkException(e);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> get(
    String url, {
    required Map<String, dynamic> headers,
  }) async {
    await isConnectedToInternet();
    try {
      final response = await _dio.request(
        url,
        options: Options(
          method: 'GET',
          headers: headers,
          responseType: ResponseType.json,
          validateStatus: (_) => true,
        ),
      );
      return response;
    } on DioException catch (e) {
      log('dio exception message: ${e.error.toString()}');
      throw _handelNetworkException(e);
    } catch (e) {
      rethrow;
    }
  }

  NetworkException _handelNetworkException(DioException e) {
    log('dio exception handler: ${e.toString()}');
    if ((e.error.toString().toLowerCase()).contains('connection refused')) {
      return const NetworkException(
        'Server In Maintenance Now',
        NetworkExceptionType.serverMaintenance,
      );
    }
    if ((e.error.toString().toLowerCase()).contains('no route to host')) {
      return const NetworkException(
        'Server In Maintenance Now',
        NetworkExceptionType.serverMaintenance,
      );
    }
    if ((e.error.toString().toLowerCase()).contains('network is unreachable')) {
      return const NetworkException(
        'No Internet Connection',
        NetworkExceptionType.noInternet,
      );
    }
    if ((e.error.toString().toLowerCase()).contains('[connection error]')) {
      return const NetworkException(
        'No Internet Connection',
        NetworkExceptionType.noInternet,
      );
    }
    return const NetworkException(
      'Unexpected Error',
      NetworkExceptionType.unKnown,
    );
  }
}
