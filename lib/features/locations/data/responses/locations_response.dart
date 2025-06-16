import 'package:ashafaq/config/exceptions/base_exception.dart';
import 'package:ashafaq/config/response/base_response.dart';
import 'package:ashafaq/config/response/i_response.dart';
import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/locations/data/models/m_location.dart';
import 'package:ashafaq/features/locations/domain/entities/i_location.dart';
import 'package:dio/dio.dart';

final class AddressesResponse implements IResponse {
  late final BaseResponse _baseResponse;
  late final Response _dioResponse;
  //!if the request is get locations we will implement it
  late final List<ILocation>? locations;
  AddressesResponse.init(this._dioResponse) {
    final resData = _dioResponse.data;
    _baseResponse = BaseResponse(
      _dioResponse.statusCode!,
      isSucceed: resData[JsonKeys.success],
      exception: BaseException(_dioResponse),
    );
    if (_baseResponse.isSucceed) {
      final method = _dioResponse.requestOptions.method;
      if (method.toLowerCase() == 'get') {
        //?create the locations list.
        locations = MLocation.fromJsonList(resData[JsonKeys.data]);
        return;
      }
    }
  }
  @override
  BaseException? get exceptions => _baseResponse.exception;

  @override
  bool get isSucceed => _baseResponse.isSucceed;

  @override
  int get statusCode => _baseResponse.statusCode;
}
