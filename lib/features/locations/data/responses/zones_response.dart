import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/config/response/base_response.dart';
import 'package:ashafaq/config/response/i_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/locations/data/models/zones/m_zone.dart';
import 'package:ashafaq/features/locations/domain/entities/i_zone.dart';
import 'package:dio/dio.dart';

final class ZonesResponse implements IResponse {
  late final BaseResponse _baseResponse;
  final Response _dioResponse;
  late final List<IZone> zones;
  ZonesResponse.init(this._dioResponse) {
    final resData = _dioResponse.data;
    _baseResponse = BaseResponse(
      _dioResponse.statusCode!,
      isSucceed: resData[JsonKeys.success],
      exception: BaseException(_dioResponse),
    );
    if (_baseResponse.isSucceed) {
      //?everything works well
      zones = MZone.fromJsonList(resData[JsonKeys.data]);
    }
  }

  @override
  BaseException? get exceptions => _baseResponse.exception;

  @override
  bool get isSucceed => _baseResponse.isSucceed;

  @override
  int get statusCode => _baseResponse.statusCode;
}
